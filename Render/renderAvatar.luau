--!strict
-- Render script for R6 avatars

local ThumbnailGenerator =
	game:GetService "ThumbnailGenerator" :: ThumbnailGenerator
local RenderModule = require "../Modules/Render"
local SetupAvatar = require "../Modules/Render/SetupAvatar"
local Render = RenderModule(_BASE_URL, _PING_URL) -- avoid ambiguous syntax after compilation
local New = require("../Modules/New").New

local char, shoulder =
	SetupAvatar(_BASE_URL, _RENDER_TYPE, _ASSET_ID, "/asset/characterfetch/")
if not char then
	error(
		`[{game.JobId}] Failed to set up avatar for {_RENDER_TYPE} ID {_ASSET_ID}`
	)
end

local clickBody = ThumbnailGenerator:Click("PNG", 840, 840, true)

print(`[{game.JobId}] Rendered bodyshot`)

if shoulder then
	shoulder.CurrentAngle = 0
end

-- Headshot Camera
local CameraAngle = char.Head.CFrame
local CameraPosition = CameraAngle
	+ CFrame.Angles(0, math.pi, 0).lookVector.Unit * 2.75

workspace.CurrentCamera = New "Camera" {
	Name = "ThumbnailCamera",
	CameraType = Enum.CameraType.Scriptable,
	CoordinateFrame = CFrame.new(CameraPosition.p, CameraAngle.p),
	FieldOfView = 52.5,
	Parent = char,
}

local clickHead = ThumbnailGenerator:Click("PNG", 300, 300, true)

print(`[{game.JobId}] Rendered headshot`)

Render.Upload(`Completed\n{clickBody}\n{clickHead}`)
