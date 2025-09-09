package main

import (
	_ "embed"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
)

//go:embed key
var key string

type ApiResponse struct {
	Location string `json:"location"`
}

const out = "../../Assets"

func main() {
	fmt.Println("downloader lel")

	if len(os.Args) < 2 {
		fmt.Println("usage: <assetid>")
		return
	}

	id := os.Args[1]
	req, err := http.NewRequest("GET", "https://apis.roblox.com/asset-delivery-api/v1/assetId/"+id, nil)
	req.Header.Add("x-api-key", key)
	if err != nil {
		fmt.Println("error creating request:", err)
		return
	}
	var client http.Client
	res, err := client.Do(req)
	if err != nil {
		fmt.Println("error fetching asset:", err)
		return
	}

	if res.StatusCode != 200 {
		fmt.Println("error fetching asset: status", res.StatusCode)
		return
	}

	body, err := io.ReadAll(res.Body)
	if err != nil {
		fmt.Println("error reading response body:", err)
		return
	}

	var response ApiResponse
	if err := json.Unmarshal(body, &response); err != nil {
		fmt.Println("error parsing response:", err)
		return
	}

	loc := response.Location
	fmt.Println("Got location")

	res2, err := http.Get(loc)
	if err != nil {
		fmt.Println("error downloading asset:", err)
		return
	}
	defer res2.Body.Close()

	if res2.StatusCode != 200 {
		fmt.Println("error downloading asset: status", res2.StatusCode)
		return
	}

	file, err := os.Create(out + "/" + id)
	if err != nil {
		fmt.Println("error creating file:", err)
		return
	}
	defer file.Close()

	if _, err = io.Copy(file, res2.Body); err != nil {
		fmt.Println("error saving asset to file:", err)
		return
	}

	fmt.Println("Downloaded asset to", out+"/"+id)
}
