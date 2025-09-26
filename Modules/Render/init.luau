--!strict

local HttpService = game:GetService "HttpService"
local ScriptContext = game:GetService "ScriptContext"
local ContentProvider = game:GetService "ContentProvider"
local InsertService = game:GetService "InsertService"

local function post(url: string, body: string)
	-- We have to lie about the contentType to avoid being nuked by CORS from the website (yes, the parameter exists in 2015)
	game:HttpPost(url, body, true, "text/json")
end

return function(baseUrl: string, pingUrl: string, thumbnailKey: string)
	local Render = {}

	-- print(`[{game.JobId}] Setting asset URLs....`)
	local ok, err = pcall(function()
		-- print(`[{game.JobId}] Setting base URL to http://{baseUrl}/`)
		ContentProvider:SetBaseUrl(`http://{baseUrl}/`) -- the base url has to be http://, the others must not (only 2015 RCC, not 2013 afaik)
		-- print(
		-- 	`[{game.JobId}] Setting asset URL format to {baseUrl}/asset?id=%d`
		-- )
		InsertService:SetAssetUrl(`{baseUrl}/asset?id=%d`)
		-- print(
		-- 	`[{game.JobId}] Setting asset version URL format to {baseUrl}/asset?assetversionid=%d`
		-- )
		InsertService:SetAssetVersionUrl(`{baseUrl}/asset?assetversionid=%d`)
	end)
	if not ok then
		error(`[{game.JobId}] Failed to set asset URLs: {err}`)
		-- else
		-- 	print(`[{game.JobId}] Successfully set asset URLs!`)
	end

	HttpService.HttpEnabled = true
	ScriptContext.ScriptsDisabled = true

	-- print(`[{game.JobId}] Sending rendering ping...`)
	post(`{pingUrl}?apiKey={thumbnailKey}`, "Rendering")

	function Render.Upload(result: string)
		-- print(`[{game.JobId}] Uploading render...`)
		for i = 1, 3 do
			local ok, err = pcall(function()
				post(`{pingUrl}?apiKey={thumbnailKey}`, result)
			end)
			if ok then
				print(`[{game.JobId}] Upload successful! Moving on...`)
				break
			end
			if i == 3 then
				print(`[{game.JobId}] An error occurred! ({err}). Giving up...`)
				break
			end
			print(
				`[{game.JobId}] An error occurred! ({err}). Uploading again...`
			)
		end
	end

	return Render
end
