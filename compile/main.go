package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
)

const (
	outputDir        = "../out"
	serverOutputDir  = outputDir + "/server"
	pluginsOutputDir = outputDir + "/plugins"
	coresDir         = "../Corescripts"
	libsDir          = "../Libraries"
	loadsDir         = "../Loadscripts"
	pluginsDir       = "../Plugins"
	renderDir        = "../Render"
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
		ext := filepath.Ext(n)
		nameNoExt := n[:len(n)-len(ext)]

		scripts = append(scripts, Script{
			entrypoint: in + "/" + entry.Name(),
			output:     out + "/" + nameNoExt + ".lua",
			config:     "dense",
		})
	}

	return scripts, nil
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
}
