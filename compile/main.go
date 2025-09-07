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
	outputDir        = "../out"
	serverOutputDir  = outputDir + "/server"
	pluginsOutputDir = outputDir + "/plugins"
	coresDir         = "../Corescripts"
	coresTemp        = serverOutputDir + "/corescripts"
	libsDir          = "../Libraries"
	loadsDir         = "../Loadscripts"
	loadsOut         = serverOutputDir + "/loadscripts"
	pluginsDir       = "../Plugins"
	renderDir        = "../Render"
	assetsOut        = "../out/assets"
	keyPath          = "./PrivateKey.pem"
)

type Script struct {
	entrypoint, output, config string // "lines" | "dense"
}

var libraries = []Script{
	{
		entrypoint: libsDir + "/Fusion/init.luau",
		output:     serverOutputDir + "/corescripts/10000001.lua",
		config:     "dense",
	},
	{
		entrypoint: libsDir + "/Red/init.luau",
		output:     serverOutputDir + "/corescripts/10000002.lua",
		config:     "dense",
	},
	{
		entrypoint: libsDir + "/Load.luau",
		output:     serverOutputDir + "/corescripts/10000003.lua",
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

func signScript(in, out string, sk *rsa.PrivateKey) error {
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

	if err = os.WriteFile(out, newdata, 0o644); err != nil {
		return fmt.Errorf("error writing signed script: %w", err)
	}
	return nil
}

func main() {
	fmt.Println("Mercury Corescript Compiler (MCC) Version 2")

	// delete output directory if it exists
	if _, err := os.Stat(outputDir); err == nil {
		if err := os.RemoveAll(outputDir); err != nil {
			fmt.Println("Error removing output directory:", err)
			return
		}
	}

	cores, err := readScripts(coresDir, serverOutputDir+"/corescripts")
	if err != nil {
		fmt.Println("Error reading corescripts:", err)
		return
	}
	loads, err := readScripts(loadsDir, serverOutputDir+"/loadscripts")
	if err != nil {
		fmt.Println("Error reading loadscripts:", err)
		return
	}
	plugins, err := readScripts(pluginsDir, pluginsOutputDir)
	if err != nil {
		fmt.Println("Error reading plugins:", err)
		return
	}
	render, err := readScripts(renderDir, serverOutputDir+"/render")
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

	for _, entry := range coresOutDir {
		if entry.IsDir() {
			continue
		}
		name := entry.Name()
		in := coresTemp + "/" + name
		out := assetsOut + "/" + trimExt(name)
		if err = signScript(in, out, sk); err != nil {
			fmt.Println("Error signing corescript:", err)
			return
		}
	}
	for _, entry := range loadsOutDir {
		if entry.IsDir() {
			continue
		}
		p := loadsOut + "/" + entry.Name()
		if err = signScript(p, p, sk); err != nil {
			fmt.Println("Error signing loadscript:", err)
			return
		}
	}
}
