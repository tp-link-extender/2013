print "[Mercury]: Loaded 2016 Host corescript"

local BadgeService = game:GetService "BadgeService"
local ChangeHistoryService = game:GetService "ChangeHistoryService"
local ContentProvider = game:GetService "ContentProvider"
local InsertService = game:GetService "InsertService"
local Players = game:GetService "Players"
local RunService = game:GetService "RunService"
local ScriptContext = game:GetService "ScriptContext"
local ScriptInformationProvider =
	game:GetService "ScriptInformationProvider" :: ScriptInformationProvider

-- establish this peer as the Server
local NetworkServer = game:GetService "NetworkServer"

local url = "https://" .. _BASE_URL -- can't use the BaseUrl module because ContentProvider.BaseUrl isn't set yet
local mapLoc = _MAP_LOCATION

-----------------------------------"CUSTOM" SHARED CODE----------------------------------

pcall(function()
	settings().Network.UseInstancePacketCache = true
end)
pcall(function()
	settings().Network.UsePhysicsPacketCache = true
end)
--pcall(function() settings()["Task Scheduler"].PriorityMethod = Enum.PriorityMethod.FIFO end)
pcall(function()
	settings()["Task Scheduler"].PriorityMethod =
		Enum.PriorityMethod.AccumulatedError
end)

--settings().Network.PhysicsSend = 1 -- 1==RoundRobin
--settings().Network.PhysicsSend = Enum.PhysicsSendMethod.ErrorComputation2
settings().Network.PhysicsSend = Enum.PhysicsSendMethod.TopNErrors
settings().Network.ExperimentalPhysicsEnabled = true
settings().NetworkWaitingForCharacterLogRate = 100
pcall(function()
	settings().Diagnostics:LegacyScriptMode()
end)

-----------------------------------START GAME SHARED SCRIPT------------------------------

pcall(function()
	ScriptContext:AddStarterScript(37801172)
end)
ScriptContext.ScriptsDisabled = true

game:SetPlaceID(_PLACE_ID, false)
ChangeHistoryService:SetEnabled(false)

if url then
	pcall(function()
		Players:SetAbuseReportUrl(`{url}/AbuseReport/InGameChatHandler.ashx`)
	end)
	pcall(function()
		ScriptInformationProvider:SetAssetUrl(`{url}/asset/`) -- needs trailing / for appended paths, like /asset/GetScriptState.ashx
	end)
	pcall(function()
		ContentProvider:SetBaseUrl(url) -- testing whatever
	end)

	BadgeService:SetPlaceId(_PLACE_ID)

	BadgeService:SetIsBadgeLegalUrl ""
	InsertService:SetBaseSetsUrl(
		`{url}/Game/Tools/InsertAsset.ashx?nsets=10&type=base`
	)
	InsertService:SetUserSetsUrl(
		`{url}/Game/Tools/InsertAsset.ashx?nsets=20&type=user&userid=%d`
	)
	InsertService:SetCollectionUrl(`{url}/Game/Tools/InsertAsset.ashx?sid=%d`)
	InsertService:SetAssetUrl(`{url}/asset?id=%d`)
	InsertService:SetAssetVersionUrl(`{url}/asset?assetversionid=%d`)

	-- idfk
	-- pcall(function()
	-- 	loadfile(`{url}/Game/LoadPlaceInfo.ashx?PlaceId={_PLACE_ID}`)()
	-- end)

	-- also idfk. "let's amputate it" – programmer mindset
	-- pcall(function()
	-- 	if not access then
	-- 		return
	-- 	end
	-- 	loadfile(
	-- 		url
	-- 			.. "/Game/PlaceSpecificScript.ashx?PlaceId="
	-- 			.. _PLACE_ID
	-- 			.. "&"
	-- 			.. access
	-- 	)()
	-- end)
end

--pcall(function() NetworkServer:SetIsPlayerAuthenticationRequired(true) end)
settings().Diagnostics.LuaRamLimit = 0
--settings().Network:SetThroughputSensitivity(0.08, 0.01)
--settings().Network.SendRate = 35
--settings().Network.PhysicsSend = 0  -- 1==RoundRobin

Players.PlayerAdded:connect(function(player)
	print(`Player {player.userId} added`)
end)

Players.PlayerRemoving:connect(function(player)
	print(`Player {player.userId} leaving`)
end)

if mapLoc and mapLoc ~= "" then
	-- yield so that file load happens in the heartbeat thread
	RunService.Heartbeat:wait()

	-- load the game
	game:Load(mapLoc)
end

-- Now start the connection
NetworkServer:Start(_SERVER_PORT)

ScriptContext:SetTimeout(10)
ScriptContext.ScriptsDisabled = false

------------------------------END START GAME SHARED SCRIPT--------------------------

-- StartGame --
RunService:Run()
