package main

import (
	"crypto"
	"crypto/rsa"
	"crypto/sha1"
	"crypto/x509"
	"encoding/base64"
	"encoding/pem"
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
)

func trimExt(n string) string {
	return n[:len(n)-len(filepath.Ext(n))]
}

const (
	outputPath        = "../out"
	serverOutputPath  = outputPath + "/server"
	pluginsOutputPath = outputPath + "/plugins"
	coresPath         = "../Corescripts"
	coresTemp         = outputPath + "/corescripts"
	libsPath          = "../Libraries"
	loadsPath         = "../Loadscripts"
	loadsOut          = serverOutputPath + "/loadscripts"
	pluginsPath       = "../Plugins"
	renderPath        = "../Render"
	assetsPath        = "../Assets"
	assetsOut         = serverOutputPath + "/assets"
	keyPath           = "./PrivateKey.pem"
)

type Script struct {
	entrypoint, output, config string // "lines" | "dense"
}

var libraries = []Script{
	{
		entrypoint: libsPath + "/Fusion/init.luau",
		output:     coresTemp + "/10000001.lua",
		config:     "dense",
	},
	{
		entrypoint: libsPath + "/Red/init.luau",
		output:     coresTemp + "/10000002.lua",
		config:     "dense",
	},
	{
		entrypoint: libsPath + "/Load.luau",
		output:     coresTemp + "/10000003.lua",
		config:     "dense",
	},
}

func processScript(s Script) error {
	fmt.Println("Processing", s.entrypoint, "to", s.output, "with config", s.config)
	configPath := fmt.Sprintf("../%s.json5", s.config)
	cmd := exec.Command("darklua", "process", "-c", configPath, s.entrypoint, s.output)
	return cmd.Run()
}

func readScripts(in, out string) ([]Script, error) {
	readDir, err := os.ReadDir(in)
	if err != nil {
		return nil, fmt.Errorf("failed to read cores directory: %w", err)
	}

	var scripts []Script
	for _, entry := range readDir {
		if entry.IsDir() {
			continue
		}

		n := entry.Name()
		nameNoExt := trimExt(n)

		scripts = append(scripts, Script{
			entrypoint: in + "/" + entry.Name(),
			output:     out + "/" + nameNoExt + ".lua",
			config:     "dense",
		})
	}

	return scripts, nil
}

func signScript(in, out string, sk *rsa.PrivateKey, total *int) error {
	fmt.Println("Signing", in)

	data, err := os.ReadFile(in)
	if err != nil {
		return fmt.Errorf("error reading script for signing: %w", err)
	}

	// signature is a comment, so prepend a newline to prevent the first line from being commented out
	data = append([]byte{'\n'}, data...)

	hashed := sha1.Sum(data)
	// actually works, can you believe it‽
	sig, err := rsa.SignPKCS1v15(nil, sk, crypto.SHA1, hashed[:])
	if err != nil {
		return fmt.Errorf("error signing script: %w", err)
	}
	// encode sig as base64
	sigb64 := base64.StdEncoding.EncodeToString(sig)
	sigcomment := fmt.Sprintf("--rbxsig%%%s%%", sigb64)

	newdata := append([]byte(sigcomment), data...)
	(*total) += len(newdata)

	if err = os.WriteFile(out, newdata, 0o644); err != nil {
		return fmt.Errorf("error writing signed script: %w", err)
	}
	return nil
}

func main() {
	fmt.Println("Mercury Corescript Compiler (MCC) Version 2")

	if err := os.RemoveAll(outputPath); err != nil {
		fmt.Println("Error removing output directory:", err)
		return
	}

	cores, err := readScripts(coresPath, coresTemp)
	if err != nil {
		fmt.Println("Error reading corescripts:", err)
		return
	}
	loads, err := readScripts(loadsPath, loadsOut)
	if err != nil {
		fmt.Println("Error reading loadscripts:", err)
		return
	}
	plugins, err := readScripts(pluginsPath, pluginsOutputPath)
	if err != nil {
		fmt.Println("Error reading plugins:", err)
		return
	}
	render, err := readScripts(renderPath, serverOutputPath+"/render")
	if err != nil {
		fmt.Println("Error reading render scripts:", err)
		return
	}

	var scripts []Script
	scripts = append(scripts, libraries...)
	scripts = append(scripts, cores...)
	scripts = append(scripts, loads...)
	scripts = append(scripts, plugins...)
	scripts = append(scripts, render...)

	// we could goroutine this in future
	for _, script := range scripts {
		if err := processScript(script); err != nil {
			fmt.Println("Error processing script:", err)
			return
		}
	}

	fmt.Println("Compilation complete")

	key, err := os.ReadFile(keyPath)
	if err != nil {
		fmt.Println("Error reading private key:", err)
		return
	}

	block, _ := pem.Decode(key)
	if block == nil || block.Type != "RSA PRIVATE KEY" {
		fmt.Println("Failed to decode PEM block containing private key")
		return
	}

	sk, err := x509.ParsePKCS1PrivateKey(block.Bytes)
	if err != nil {
		fmt.Println("Error parsing private key:", err)
		return
	}

	// sign all scripts in corescripts output dir
	coresOutDir, err := os.ReadDir(coresTemp)
	if err != nil {
		fmt.Println("Error reading corescripts directory for signing:", err)
		return
	}
	loadsOutDir, err := os.ReadDir(loadsOut)
	if err != nil {
		fmt.Println("Error reading corescripts directory for signing:", err)
		return
	}
	err = os.MkdirAll(assetsOut, 0o755)
	if err != nil {
		fmt.Println("Error creating assets output directory:", err)
		return
	}

	var totalCores int
	for _, entry := range coresOutDir {
		if entry.IsDir() {
			continue
		}
		name := entry.Name()
		in := coresTemp + "/" + name
		out := assetsOut + "/" + trimExt(name)
		if err = signScript(in, out, sk, &totalCores); err != nil {
			fmt.Println("Error signing corescript:", err)
			return
		}
	}
	fmt.Println("Total corescripts size", totalCores, "bytes")

	var totalLoads int
	for _, entry := range loadsOutDir {
		if entry.IsDir() {
			continue
		}
		p := loadsOut + "/" + entry.Name()
		if err = signScript(p, p, sk, &totalLoads); err != nil {
			fmt.Println("Error signing loadscript:", err)
			return
		}
	}
	fmt.Println("Total loadscripts size", totalLoads, "bytes")

	if err = os.RemoveAll(coresTemp); err != nil {
		fmt.Println("Error removing temporary corescripts directory:", err)
		return
	}

	// copy assets to server output dir
	assetsDir, err := os.ReadDir(assetsPath)
	if err != nil {
		fmt.Println("Error reading assets directory:", err)
		return
	}

	for _, entry := range assetsDir {
		if entry.IsDir() {
			continue
		}
		name := entry.Name()
		in := assetsPath + "/" + name
		out := serverOutputPath + "/assets/" + trimExt(name)

		fmt.Println("Copying asset", in, "to", out)
		data, err := os.ReadFile(in)
		if err != nil {
			fmt.Println("Error reading asset:", err)
			return
		}
		if err = os.WriteFile(out, data, 0o644); err != nil {
			fmt.Println("Error writing asset:", err)
			return
		}
	}

	fmt.Println("Done!")
}
