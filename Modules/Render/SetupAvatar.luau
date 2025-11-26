--!strict

local Players = game:GetService "Players"

return function(
	baseUrl: string,
	renderType: string,
	assetId: number,
	characterAppearance: string
)
	print(`[{game.JobId}] Starting new render for {renderType} Id {assetId}`)
	local player = Players:CreateLocalPlayer(0)
	player.CharacterAppearance = "http://"
		.. baseUrl
		.. characterAppearance
		.. assetId
	player:LoadCharacter(false)

	-- Raise up the character's arm if they have gear.
	local backpack = player:WaitForChild "Backpack" :: Backpack
	local gear = backpack:GetChildren()[1]
	local character = player.Character
	if not (gear and character) then
		return player
	end

	gear.Parent = character
	local torso = character:FindFirstChild "Torso"
	if not torso then
		return player
	end

	local rightShoulder = torso:FindFirstChild "Right Shoulder"
	if not rightShoulder then
		return player
	end

	rightShoulder.CurrentAngle = math.rad(90)
	return player
end
