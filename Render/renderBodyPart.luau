--!strict
-- Render script for body parts

local ThumbnailGenerator = game:GetService "ThumbnailGenerator"
local RenderModule = require "../Modules/Render"
local SetupAvatar = require "../Modules/Render/SetupAvatar"
local Render = RenderModule(_BASE_URL, _PING_URL) -- avoid ambiguous syntax after compilation
local New = require("../Modules/New").New

-- _ASSET_ID: "<limb>:<itemId>", e.g. "Left Arm:330001234".
local limb: string?, itemId: string? = (_ASSET_ID :: string):match "([A-Za-z ]+):(%d+)"

if not limb or not itemId then
	error(
		`[{game.JobId}] Invalid body part render target "{_ASSET_ID}", expected "<limb>:<itemId>"`
	)
end

local char = SetupAvatar(
	_BASE_URL,
	_RENDER_TYPE,
	itemId :: string,
	"/api/render/bodypart?id="
)
if not char then
	error(`[{game.JobId}] Failed to set up body part render for {itemId}`)
end

-- The part can be missing if the appearance fails to apply the body part;
-- WaitForChild without a timeout would yield forever
local maxWait = 30
local part = char:WaitForChild(limb :: string, maxWait)

if not part then
	print(`[{game.JobId}] No {limb} on the character after {maxWait}s. Children:`)
	for _, child in char:GetChildren() :: { Instance } do
		print(`[{game.JobId}] - {child.Name} ({child.ClassName})`)
	end
	error(`[{game.JobId}] Character had no {limb} after {maxWait}s`)
end

workspace.CurrentCamera = New "Camera" {
	Name = "ThumbnailCamera",
	CameraType = Enum.CameraType.Scriptable,
	CoordinateFrame = CFrame.new(
		(part.CFrame * CFrame.new(0, 0, -4.25)).Position,
		part.Position
	),
	FieldOfView = 52.5,
	Parent = char,
}

local click = ThumbnailGenerator:Click("PNG", 840, 840, true)

print(`[{game.JobId}] Successfully rendered body part {limb}`)

Render.Upload(`Completed\n{click}`)
