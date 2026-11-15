--!strict
-- Render script for the right leg

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
		`[{game.JobId}] Failed to set up right leg render for {_RENDER_TYPE} ID {_ASSET_ID}`
	)
end

local part = char["Right Leg"] :: BasePart

print(`[{game.JobId}] Got part {part.Name} ({part.ClassName}) at {part.Position}`)

-- Body Part Camera: zoomed in on the limb, viewed at an angle
-- Distance: how far the camera sits from the limb (smaller = more zoomed in)
-- Yaw: angle around the limb; sign decides which side we view it from
-- AimHeight: vertical offset of the point the camera looks at
local Distance = 3.1
local Yaw = math.rad(-15)
local AimHeight = 0.2

local cameraPosition =
	(part.CFrame * CFrame.Angles(0, Yaw, 0) * CFrame.new(0, 0, -Distance)).p
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
	`[{game.JobId}] Rendered right leg (click length {#click})`
)

Render.Upload(`Completed\n{click}`)


