--!strict
-- CoreGui.RobloxGui.CoreScripts/MainBotChatScript
print "[Mercury]: Loaded corescript 39250920"

local News = require "../Modules/New"
local New = News.New
local Hydrate = News.Hydrate

local CoreGui = game:GetService "CoreGui"
local Chat = game:GetService "Chat"
local InsertService = game:GetService "InsertService"
local RunService = game:GetService "RunService"

local function waitForProperty(instance, name: string)
	while not instance[name] do
		instance.Changed:wait()
	end
end

local function waitForChild(instance: Instance, name: string)
	while not instance:FindFirstChild(name) do
		instance.ChildAdded:wait()
		return instance:FindFirstChild(name)
	end
	return nil
end

local mainFrame: Frame & {
	Tail: ImageLabel,
}
local choices = {}
local lastChoice
local choiceMap = {}
local currentConversationDialog, currentConversationPartner, currentAbortDialogScript

local tooFarAwayMessage = "You are too far away to chat!"
local tooFarAwaySize = 300
local characterWanderedOffMessage = "Chat ended because you walked away"
local characterWanderedOffSize = 350
local conversationTimedOut = "Chat ended because you didn't reply"
local conversationTimedOutSize = 350

local player, chatNotificationGui, messageDialog, timeoutScript, reenableDialogScript
local dialogMap = {}
local dialogConnections = {}

waitForChild(game, "CoreGui")
waitForChild(CoreGui, "RobloxGui")

local MercuryGui = CoreGui:FindFirstChild "RobloxGui" :: ScreenGui & {
	ControlFrame: Frame,
}
local gui = MercuryGui:FindFirstChild "ControlFrame" or MercuryGui

local function currentTone()
	if currentConversationDialog then
		return currentConversationDialog.Tone
	end
	return Enum.DialogTone.Neutral
end

local function createChatNotificationGui()
	chatNotificationGui = New "BillboardGui" {
		Name = "ChatNotificationGui",
		ExtentsOffset = Vector3.new(0, 1, 0),
		Size = UDim2.new(4, 0, 5.42857122, 0),
		SizeOffset = Vector2.new(0, 0),
		StudsOffset = Vector3.new(0.4, 4.3, 0),
		Enabled = true,
		RobloxLocked = true,
		Active = true,
		New "ImageLabel" {
			Name = "Image",
			Active = false,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			Image = "",
			RobloxLocked = true,
			Parent = chatNotificationGui,
			New "ImageButton" {
				Name = "Button",
				AutoButtonColor = false,
				Position = UDim2.new(0.088, 0, 0.053, 0),
				Size = UDim2.new(0.83, 0, 0.468, 0),
				Image = "",
				BackgroundTransparency = 1,
				RobloxLocked = true,
			},
		},
	}
end

local function getChatColor(tone)
	if tone == Enum.DialogTone.Friendly then
		return Enum.ChatColor.Green
	elseif tone == Enum.DialogTone.Enemy then
		return Enum.ChatColor.Red
	end
	return Enum.ChatColor.Blue
end

local function resetColor(frame, tone)
	if tone == Enum.DialogTone.Neutral then
		frame.BackgroundColor3 = Color3.new(0 / 255, 0 / 255, 179 / 255)
		frame.Number.TextColor3 = Color3.new(45 / 255, 142 / 255, 245 / 255)
	elseif tone == Enum.DialogTone.Friendly then
		frame.BackgroundColor3 = Color3.new(0 / 255, 77 / 255, 0 / 255)
		frame.Number.TextColor3 = Color3.new(0 / 255, 190 / 255, 0 / 255)
	elseif tone == Enum.DialogTone.Enemy then
		frame.BackgroundColor3 = Color3.new(140 / 255, 0 / 255, 0 / 255)
		frame.Number.TextColor3 = Color3.new(255 / 255, 88 / 255, 79 / 255)
	end
end

local function styleChoices(tone)
	for _, obj in pairs(choices) do
		resetColor(obj, tone)
	end
	resetColor(lastChoice, tone)
end

local function styleMainFrame(tone)
	if tone == Enum.DialogTone.Neutral then
		mainFrame.Style = Enum.FrameStyle.ChatBlue
		mainFrame.Tail.Image =
			"rbxasset://textures/chatBubble_botBlue_tailRight.png"
	elseif tone == Enum.DialogTone.Friendly then
		mainFrame.Style = Enum.FrameStyle.ChatGreen
		mainFrame.Tail.Image =
			"rbxasset://textures/chatBubble_botGreen_tailRight.png"
	elseif tone == Enum.DialogTone.Enemy then
		mainFrame.Style = Enum.FrameStyle.ChatRed
		mainFrame.Tail.Image =
			"rbxasset://textures/chatBubble_botRed_tailRight.png"
	end

	styleChoices(tone)
end

local function setChatNotificationTone(notificationGui, purpose, tone)
	if tone == Enum.DialogTone.Neutral then
		notificationGui.Image.Image =
			"rbxasset://textures/chatBubble_botBlue_notify_bkg.png"
	elseif tone == Enum.DialogTone.Friendly then
		notificationGui.Image.Image =
			"rbxasset://textures/chatBubble_botGreen_notify_bkg.png"
	elseif tone == Enum.DialogTone.Enemy then
		notificationGui.Image.Image =
			"rbxasset://textures/chatBubble_botRed_notify_bkg.png"
	end
	if purpose == Enum.DialogPurpose.Quest then
		notificationGui.Image.Button.Image =
			"rbxasset://textures/chatBubble_bot_notify_bang.png"
	elseif purpose == Enum.DialogPurpose.Help then
		notificationGui.Image.Button.Image =
			"rbxasset://textures/chatBubble_bot_notify_question.png"
	elseif purpose == Enum.DialogPurpose.Shop then
		notificationGui.Image.Button.Image =
			"rbxasset://textures/chatBubble_bot_notify_money.png"
	end
end

local function createMessageDialog()
	messageDialog = New "Frame" {
		Name = "DialogScriptMessage",
		Style = Enum.FrameStyle.RobloxRound,
		Visible = false,
		New "TextLabel" {
			Name = "Text",
			Position = UDim2.new(0, 0, 0, -1),
			Size = UDim2.new(1, 0, 1, 0),
			FontSize = Enum.FontSize.Size14,
			BackgroundTransparency = 1,
			TextColor3 = Color3.new(1, 1, 1),
			RobloxLocked = true,
		},
	}
end

local function showMessage(msg: string, size: number)
	Hydrate(messageDialog) {
		Size = UDim2.new(0, size, 0, 40),
		Position = UDim2.new(0.5, -size / 2, 0.5, -40),
		Visible = true,
	}
	messageDialog.Text.Text = msg
	wait(2)
	messageDialog.Visible = false
end

local function variableDelay(str)
	local length = math.min(string.len(str), 100)
	wait(0.75 + (length / 50))
end

local function highlightColor(frame, tone)
	if tone == Enum.DialogTone.Neutral then
		frame.BackgroundColor3 = Color3.new(2 / 255, 108 / 255, 255 / 255)
		frame.Number.TextColor3 = Color3.new(1, 1, 1)
	elseif tone == Enum.DialogTone.Friendly then
		frame.BackgroundColor3 = Color3.new(0 / 255, 128 / 255, 0 / 255)
		frame.Number.TextColor3 = Color3.new(1, 1, 1)
	elseif tone == Enum.DialogTone.Enemy then
		frame.BackgroundColor3 = Color3.new(204 / 255, 0 / 255, 0 / 255)
		frame.Number.TextColor3 = Color3.new(1, 1, 1)
	end
end

local function endDialog()
	if currentAbortDialogScript then
		currentAbortDialogScript:Remove()
		currentAbortDialogScript = nil
	end

	local dialog = currentConversationDialog
	currentConversationDialog = nil
	if dialog and dialog.InUse then
		local reenableScript = reenableDialogScript:Clone()
		reenableScript.archivable = false
		reenableScript.Disabled = false
		reenableScript.Parent = dialog
	end

	for dialog2, gui2 in pairs(dialogMap) do
		if dialog2 and gui2 then
			gui2.Enabled = not dialog2.InUse
		end
	end

	currentConversationPartner = nil
end

local function wanderDialog()
	print "[Mercury]: Dialog wander"
	mainFrame.Visible = false
	endDialog()
	showMessage(characterWanderedOffMessage, characterWanderedOffSize)
end

local function timeoutDialog()
	print "[Mercury]: Dialog timeout"
	mainFrame.Visible = false
	endDialog()
	showMessage(conversationTimedOut, conversationTimedOutSize)
end

local function normalEndDialog()
	print "[Mercury]: Dialog done"
	endDialog()
end

local function sanitiseMessage(msg)
	if string.len(msg) == 0 then
		return "..."
	end
	return msg
end

local function presentDialogChoices(talkingPart, dialogChoices)
	if not currentConversationDialog then
		return
	end

	currentConversationPartner = talkingPart
	local sortedDialogChoices: { DialogChoice } = {}
	for _, obj in pairs(dialogChoices) do
		if obj:IsA "DialogChoice" then
			table.insert(sortedDialogChoices, obj)
		end
	end
	table.sort(sortedDialogChoices, function(a, b)
		return a.Name < b.Name
	end)

	if #sortedDialogChoices == 0 then
		normalEndDialog()
		return
	end

	local pos = 1
	local yPosition = 0
	choiceMap = {}
	for _, obj in pairs(choices) do
		obj.Visible = false
	end

	for _, obj in pairs(sortedDialogChoices) do
		if pos <= #choices then
			--3 lines is the maximum, set it to that temporarily
			choices[pos].Size = UDim2.new(1, 0, 0, 24 * 3)
			choices[pos].UserPrompt.Text = obj.UserDialog
			local height = math.ceil(choices[pos].UserPrompt.TextBounds.Y / 24)
				* 24

			choices[pos].Position = UDim2.new(0, 0, 0, yPosition)
			choices[pos].Size = UDim2.new(1, 0, 0, height)
			choices[pos].Visible = true

			choiceMap[choices[pos]] = obj

			yPosition += height
			pos += 1
		end
	end

	lastChoice.Position = UDim2.new(0, 0, 0, yPosition)
	lastChoice.Number.Text = pos .. ")"

	mainFrame.Size = UDim2.new(0, 350, 0, yPosition + 24 + 32)
	mainFrame.Position = UDim2.new(0, 20, 0, -mainFrame.Size.Y.Offset - 20)
	styleMainFrame(currentTone())
	mainFrame.Visible = true
end

local function renewKillswitch(dialog)
	if currentAbortDialogScript then
		currentAbortDialogScript:Remove()
		currentAbortDialogScript = nil
	end

	currentAbortDialogScript = Hydrate(timeoutScript:Clone()) {
		archivable = false,
		Disabled = false,
		Parent = dialog,
	}
end

local function selectChoice(choice)
	renewKillswitch(currentConversationDialog)

	local localPlayer = game.Players.LocalPlayer

	--First hide the Gui
	mainFrame.Visible = false
	if choice == lastChoice then
		Chat:Chat(
			localPlayer.Character,
			"Goodbye!",
			getChatColor(currentTone())
		)

		normalEndDialog()
	else
		local dialogChoice = choiceMap[choice]

		Chat:Chat(
			localPlayer.Character,
			sanitiseMessage(dialogChoice.UserDialog),
			getChatColor(currentTone())
		)
		wait(1)
		currentConversationDialog:SignalDialogChoiceSelected(
			player,
			dialogChoice
		)
		Chat:Chat(
			currentConversationPartner,
			sanitiseMessage(dialogChoice.ResponseDialog),
			getChatColor(currentTone())
		)

		variableDelay(dialogChoice.ResponseDialog)
		presentDialogChoices(
			currentConversationPartner,
			dialogChoice:GetChildren()
		)
	end
end

local function newChoice(numberText)
	local frame = New "TextButton" {
		BackgroundColor3 = Color3.new(0 / 255, 0 / 255, 179 / 255),
		AutoButtonColor = false,
		BorderSizePixel = 0,
		Text = "",
		RobloxLocked = true,
		New "TextLabel" {
			Name = "Number",
			TextColor3 = Color3.new(127 / 255, 212 / 255, 255 / 255),
			Text = numberText,
			FontSize = Enum.FontSize.Size14,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 4, 0, 2),
			Size = UDim2.new(0, 20, 0, 24),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			RobloxLocked = true,
		},
		New "TextLabel" {
			Name = "UserPrompt",
			BackgroundTransparency = 1,
			TextColor3 = Color3.new(1, 1, 1),
			FontSize = Enum.FontSize.Size14,
			Position = UDim2.new(0, 28, 0, 2),
			Size = UDim2.new(1, -32, 1, -4),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextWrapped = true,
			RobloxLocked = true,
		},
	}
	frame.MouseEnter:connect(function()
		highlightColor(frame, currentTone())
	end)
	frame.MouseLeave:connect(function()
		resetColor(frame, currentTone())
	end)
	frame.MouseButton1Click:connect(function()
		selectChoice(frame)
	end)

	return frame
end

local function initialize(parent)
	choices[1] = newChoice "1)"
	choices[2] = newChoice "2)"
	choices[3] = newChoice "3)"
	choices[4] = newChoice "4)"

	lastChoice = newChoice "5)"
	lastChoice.UserPrompt.Text = "Goodbye!"
	lastChoice.Size = UDim2.new(1, 0, 0, 28)

	mainFrame = New "Frame" {
		Name = "UserDialogArea",
		Size = UDim2.new(0, 350, 0, 200),
		Style = Enum.FrameStyle.ChatBlue,
		Visible = false,
		RobloxLocked = true,
		New "ImageLabel" {
			Name = "Tail",
			Size = UDim2.new(0, 62, 0, 53),
			Position = UDim2.new(1, 8, 0.25),
			Image = "rbxasset://textures/chatBubble_botBlue_tailRight.png",
			BackgroundTransparency = 1,
			RobloxLocked = true,
		},
	}

	for _, obj in pairs(choices) do
		obj.RobloxLocked = true
		obj.Parent = mainFrame
	end
	lastChoice.RobloxLocked = true
	mainFrame.Parent = parent
	lastChoice.Parent = mainFrame
end

local function doDialog(dialog: Dialog)
	local il = Instance.Lock(dialog, player) -- does this even do anything in 2013
	print("for instance", il)
	while not il do
		RunService.Heartbeat:wait()
		il = Instance.Lock(dialog, player)
		print("for instance", il)
	end

	print("testin", dialog)

	if dialog.InUse then
		Instance.Unlock(dialog)
		return
	end

	dialog.InUse = true
	Instance.Unlock(dialog)

	currentConversationDialog = dialog
	Chat:Chat(
		dialog.Parent,
		dialog.InitialPrompt,
		getChatColor(dialog.Tone)
	)
	variableDelay(dialog.InitialPrompt)

	presentDialogChoices(dialog.Parent, dialog:GetChildren())
end

local function checkForLeaveArea()
	while currentConversationDialog do
		if
			currentConversationDialog.Parent
			and (
				player:DistanceFromCharacter(
					currentConversationDialog.Parent.Position
				) >= currentConversationDialog.ConversationDistance
			)
		then
			wanderDialog()
		end
		wait(1)
	end
end

local function startDialog(dialog: Dialog)
	if dialog.Parent and dialog.Parent:IsA "BasePart" then
		if
			player:DistanceFromCharacter(dialog.Parent.Position)
			>= dialog.ConversationDistance
		then
			showMessage(tooFarAwayMessage, tooFarAwaySize)
			return
		end

		for dialog2, gui2 in pairs(dialogMap) do
			if dialog2 and gui2 then
				gui2.Enabled = false
			end
		end

		renewKillswitch(dialog)

		delay(1, checkForLeaveArea)
		doDialog(dialog)
	end
end

local function removeDialog(dialog: Dialog)
	if dialogMap[dialog] then
		dialogMap[dialog]:Remove()
		dialogMap[dialog] = nil
	end
	if dialogConnections[dialog] then
		dialogConnections[dialog]:disconnect()
		dialogConnections[dialog] = nil
	end
end

local function addDialog(dialog: Dialog)
	if dialog.Parent then
		if dialog.Parent:IsA "BasePart" then
			local chatGui = Hydrate(chatNotificationGui:Clone()) {
				Enabled = not dialog.InUse,
				Adornee = dialog.Parent,
				RobloxLocked = true,
				Parent = CoreGui,
			}
			chatGui.Image.Button.MouseButton1Click:connect(function()
				startDialog(dialog)
			end)
			setChatNotificationTone(chatGui, dialog.Purpose, dialog.Tone)

			dialogMap[dialog] = chatGui

			dialogConnections[dialog] = dialog.Changed:connect(function(prop)
				if prop == "Parent" and dialog.Parent then
					--This handles the reparenting case, seperate from removal case
					removeDialog(dialog)
					addDialog(dialog)
				elseif prop == "InUse" then
					chatGui.Enabled = not currentConversationDialog
						and not dialog.InUse
					if dialog == currentConversationDialog then
						timeoutDialog()
					end
				elseif prop == "Tone" or prop == "Purpose" then
					setChatNotificationTone(
						chatGui,
						dialog.Purpose,
						dialog.Tone
					)
				end
			end)
		else -- still need to listen to parent changes even if current parent is not a BasePart
			dialogConnections[dialog] = dialog.Changed:connect(function(prop)
				if prop == "Parent" and dialog.Parent then
					--This handles the reparenting case, seperate from removal case
					removeDialog(dialog)
					addDialog(dialog)
				end
			end)
		end
	end
end

local function fetchScripts()
	local model = InsertService:LoadAsset(39226062)
	if type(model) == "string" then -- load failed, lets try again
		wait(0.1)
		model = InsertService:LoadAsset(39226062)
	end
	if type(model) == "string" then -- not going to work, lets bail
		return
	end

	waitForChild(model, "TimeoutScript")
	timeoutScript = model.TimeoutScript
	waitForChild(model, "ReenableDialogScript")
	reenableDialogScript = model.ReenableDialogScript
end

local function onLoad()
	waitForProperty(game.Players, "LocalPlayer")
	player = game.Players.LocalPlayer
	waitForProperty(player, "Character")

	-- print "Fetching Scripts"
	fetchScripts()

	-- print "Creating Guis"
	createChatNotificationGui()

	-- print "Creating MessageDialog"
	createMessageDialog()
	messageDialog.RobloxLocked = true
	messageDialog.Parent = gui

	-- print "Waiting for BottomLeftControl"
	waitForChild(gui, "BottomLeftControl")

	-- print "Initializing Frame"
	local frame = New "Frame" {
		Name = "DialogFrame",
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 1,
		RobloxLocked = true,
		Parent = gui.BottomLeftControl,
	}
	initialize(frame)

	-- print "Adding Dialogs"
	game.CollectionService.ItemAdded:connect(function(obj)
		if obj:IsA "Dialog" then
			addDialog(obj)
		end
	end)
	game.CollectionService.ItemRemoved:connect(function(obj)
		if obj:IsA "Dialog" then
			removeDialog(obj)
		end
	end)
	for _, obj in pairs(game.CollectionService:GetCollection "Dialog") do
		if obj:IsA "Dialog" then
			addDialog(obj)
		end
	end
end

onLoad()
