package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
)

const (
	outputDir  = "../out"
	coresDir   = "../Corescripts"
	libsDir    = "../Libraries"
	pluginsDir = "../Plugins"
	renderDir  = "../Render"
)

type Script struct {
	entrypoint, output, config string // "lines" | "dense"
}

var libraries = []Script{
	{
		entrypoint: libsDir + "/Fusion/init.luau",
		output:     outputDir + "/100000001.lua",
		config:     "dense",
	},
	{
		entrypoint: libsDir + "/Red/init.luau",
		output:     outputDir + "/100000002.lua",
		config:     "dense",
	},
	{
		entrypoint: libsDir + "/Load.luau",
		output:     outputDir + "/100000003.lua",
		config:     "dense",
	},
}

func processScript(s Script) error {
	fmt.Println("Processing", s.entrypoint, "to", s.output, "with config", s.config)
	configPath := fmt.Sprintf("../%s.json5", s.config)
	cmd := exec.Command("darklua", "process", "-c", configPath, s.entrypoint, s.output)
	return cmd.Run()
}

func readCores() ([]Script, error) {
	readCoresDir, err := os.ReadDir(coresDir)
	if err != nil {
		return nil, fmt.Errorf("failed to read cores directory: %w", err)
	}

	var scripts []Script
	for _, entry := range readCoresDir {
		if entry.IsDir() {
			continue
		}

		n := entry.Name()
		ext := filepath.Ext(n)
		nameNoExt := n[:len(n)-len(ext)]

		scripts = append(scripts, Script{
			entrypoint: coresDir + "/" + entry.Name(),
			output:     outputDir + "/" + nameNoExt + ".lua",
			config:     "dense",
		})
	}

	return scripts, nil
}

func main() {
	fmt.Println("Mercury Corescript Compiler (MCC) Version 2")

	cores, err := readCores()
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	fmt.Println(cores)
	for _, lib := range libraries {
		if err := processScript(lib); err != nil {
			fmt.Println("Error processing library:", err)
			return
		}
	}
}
