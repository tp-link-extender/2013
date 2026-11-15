--!strict
-- Render script for the torso

local ThumbnailGenerator =
	game:GetService "ThumbnailGenerator" :: ThumbnailGenerator
local RenderModule = require "../Modules/Render"
local SetupAvatar = require "../Modules/Render/SetupAvatar"
local Render = RenderModule(_BASE_URL, _PING_URL) -- avoid ambiguous syntax after compilation
local New = require("../Modules/New").New

print(`[{game.JobId}] Starting new render for {_RENDER_TYPE} Id {_ASSET_ID}`)

local char = SetupAvatar(
	_BASE_URL,
	_RENDER_TYPE,
	_ASSET_ID,
	"/api/render/bodypart?id="
)
if not char then
	error(
		`[{game.JobId}] Failed to set up torso render for {_RENDER_TYPE} ID {_ASSET_ID}`
	)
end

local part = char.Torso :: BasePart

print(`[{game.JobId}] Got part {part.Name} ({part.ClassName}) at {part.Position}`)

-- Body Part Camera: zoomed in on the limb, viewed at an angle
-- Distance: how far the camera sits from the limb (smaller = more cropped)
-- Yaw: angle around the limb; sign decides which side we view it from
-- Pitch: angle above the part looking down (positive = camera raised)
-- AimHeight: vertical offset of the point the camera looks at
-- CamHeight: vertical offset of the camera itself (negative = lower)
local Distance = 3.5
local Yaw = math.rad(10)
local Pitch = math.rad(40)
local AimHeight = -0.25
local CamHeight = -2.25

local cameraPosition =
	(
		part.CFrame
		* CFrame.Angles(Pitch, Yaw, 0)
		* CFrame.new(0, CamHeight, -Distance)
	).p
local aimPoint = part.Position + Vector3.new(0, AimHeight, 0)

workspace.CurrentCamera = New "Camera" {
	Name = "ThumbnailCamera",
	CameraType = Enum.CameraType.Scriptable,
	CoordinateFrame = CFrame.new(cameraPosition, aimPoint),
	FieldOfView = 52.5,
	Parent = char,
}

local click = ThumbnailGenerator:Click("PNG", 840, 840, true)

print(
	`[{game.JobId}] Rendered torso (click length {#click})`
)

Render.Upload(`Completed\n{click}`)
