--!strict

local Players = game:GetService "Players"

return function(
	baseUrl: string,
	renderType: string,
	assetId: string | number,
	characterAppearance: string
): (Model?, Motor6D?)
	print(`[{game.JobId}] Starting new render for {renderType} Id {assetId}`)
	local player = Players:CreateLocalPlayer(0)
	player.CharacterAppearance = "http://"
		.. baseUrl
		.. characterAppearance
		.. assetId
	player:LoadCharacter(false)

	-- Raise up the character's arm if they have gear.
	local backpack = player:WaitForChild "Backpack" :: Backpack
	local character = player.Character
	if not character then
		return nil, nil
	end

	local gear = backpack:GetChildren()[1]
	if not gear then
		return character, nil
	end

	gear.Parent = character
	local torso = character:FindFirstChild "Torso"
	if not torso then
		return character, nil
	end

	local rightShoulder = torso:FindFirstChild "Right Shoulder" :: Motor6D?
	if not rightShoulder then
		return character, nil
	end

	rightShoulder.CurrentAngle = math.rad(90)
	return character, rightShoulder
end
