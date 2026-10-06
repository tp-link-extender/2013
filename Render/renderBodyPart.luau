--!strict
-- Render script for body parts

local ThumbnailGenerator = game:GetService "ThumbnailGenerator"
local RenderModule = require "../Modules/Render"
local SetupAvatar = require "../Modules/Render/SetupAvatar"
local Render = RenderModule(_BASE_URL, _PING_URL) -- avoid ambiguous syntax after compilation
local New = require("../Modules/New").New

-- _ASSET_ID: "<limb>:<itemId>", e.g. "Left Arm:330001234".
local limb: string?, itemId: string? = (_ASSET_ID :: string):match "([[A-Za-z ]+):(%d+)"

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

local part = char:WaitForChild(limb :: string) :: BasePart

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
