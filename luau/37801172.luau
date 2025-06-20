--!strict
-- Script Context.StarterScript
print "[Mercury]: Loaded corescript 37801172"

local CoreGui = game:GetService "CoreGui"
local Players = game:GetService "Players"
local ScriptContext = game:GetService "ScriptContext"

if Players.LocalPlayer and Players.LocalPlayer.Name == "Heliodex" then
	-- Don't show the debug console for anyone but me
	ScriptContext:AddCoreScript(
		20000001,
		ScriptContext,
		"CoreScripts/DebugConsole"
	)
end

-- Creates all neccessary scripts for the gui on initial load, everything except build tools
-- Please note that these are loaded in a specific order to diminish errors/perceived load time by user

-- library registration
ScriptContext:AddCoreScript(
	30000012,
	ScriptContext,
	"/Libraries/LibraryRegistration/LibraryRegistration"
)

local function waitForChild(instance, name)
	while not instance:FindFirstChild(name) do
		instance.ChildAdded:wait()
	end
end

waitForChild(CoreGui, "RobloxGui")
local screenGui = CoreGui:FindFirstChild "RobloxGui" :: ScreenGui & {
	Backpack: Frame,
	CurrentLoadout: Frame,
}
-- screenGui.Name = "MercuryGui" -- "it wasn't meant to be" - Heliodex
-- renaming the RobloxGui seems to break the camera

local scripts = {
	[30000001] = "CoreScripts/ToolTip", -- ToolTipper (creates tool tips for gui)
	[30000003] = "CoreScripts/MainBotChatScript", -- MainBotChatScript
	[30000005] = "CoreScripts/Settings", -- SettingsScript
	[30000007] = "CoreScripts/NotificationScript", -- Friend Notification Script (probably can use this script to expand out to other notifications)
	[30000008] = "CoreScripts/PopupScript", -- Popup Script
	[30000016] = "CoreScripts/ChatScript", -- Chat script
}

for id, path in pairs(scripts) do
	ScriptContext:AddCoreScript(id, screenGui, path)
end

-- New Player List
ScriptContext:AddCoreScript(30000006, screenGui, "CoreScripts/PlayerListScript")

-- Backpack Builder, creates most of the backpack gui
ScriptContext:AddCoreScript(
	30000009,
	screenGui,
	"CoreScripts/BackpackScripts/BackpackBuilder"
)

waitForChild(screenGui, "CurrentLoadout")
waitForChild(screenGui, "Backpack")
local Backpack = screenGui.Backpack :: Frame

-- Manager handles all big backpack state changes, other scripts subscribe to this and do things accordingly
ScriptContext:AddCoreScript(
	30000015,
	Backpack,
	"CoreScripts/BackpackScripts/BackpackManager"
)

-- Backpack Gear (handles all backpack gear tab stuff)
ScriptContext:AddCoreScript(
	30000014,
	Backpack,
	"CoreScripts/BackpackScripts/BackpackGear"
)
-- Loadout Script, used for gear hotkeys
ScriptContext:AddCoreScript(
	30000010,
	screenGui.CurrentLoadout,
	"CoreScripts/BackpackScripts/LoadoutScript"
)

-- Personal servers are disabled, the corescript for it is not present
