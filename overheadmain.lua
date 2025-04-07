local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function makeTag(head, plrName)
	if not head:FindFirstChild("Rank") then -- prevent duplicate tags
		local Rank = Instance.new("BillboardGui")
		local Name1 = Instance.new("TextLabel")
		local UIListLayout = Instance.new("UIListLayout")

		Rank.Name = "Rank"
		Rank.Parent = head
		Rank.AlwaysOnTop = true
		Rank.Size = UDim2.new(4, 0, 1, 0)
		Rank.StudsOffset = Vector3.new(0, 2, 0)

		Name1.Name = "Name1"
		Name1.Parent = Rank
		Name1.BackgroundTransparency = 1
		Name1.Size = UDim2.new(1, 0, 0.3, 0)
		Name1.Font = Enum.Font.GothamBold
		Name1.Text = plrName
		Name1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Name1.TextScaled = true
		Name1.TextStrokeTransparency = 0.6
		Name1.TextWrapped = true
		Name1.TextYAlignment = Enum.TextYAlignment.Bottom

		UIListLayout.Parent = Rank
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom

		if plrName == "lvasion" then
			Name1.Text = " lvasion"
		end
		
		if head.Parent:FindFirstChildOfClass("Humanoid") then
			local hm = head.Parent:FindFirstChildOfClass("Humanoid")
			
			hm.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		end
	end
end

local function setupCharacter(player, character)
	local head = character:WaitForChild("Head", 5)
	
	if head then
		makeTag(head, player.Name)
	end
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(function(character)
		setupCharacter(player, character)
	end)

	if player.Character then
		setupCharacter(player, player.Character)
	end
end

for _, player in ipairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end

Players.PlayerAdded:Connect(onPlayerAdded)
