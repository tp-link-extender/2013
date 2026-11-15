--!strict
-- Render script for packages

local ThumbnailGenerator = game:GetService "ThumbnailGenerator"
local RenderModule = require "../Modules/Render"
local SetupAvatar = require "../Modules/Render/SetupAvatar"
local Render = RenderModule(_BASE_URL, _PING_URL) -- avoid ambiguous syntax after compilation

SetupAvatar(
	_BASE_URL,
	_RENDER_TYPE,
	_ASSET_ID,
	"/api/render/package?id="
)

local click = ThumbnailGenerator:Click("PNG", 840, 840, true)

print(`[{game.JobId}] Successfully rendered package`)

Render.Upload(`Completed\n{click}`)
