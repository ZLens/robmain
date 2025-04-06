local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local LocalPlayer = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")

if LocalPlayer.Name == "ZxZy194" then
	LocalPlayer:Kick("You have been banned from this experience: Exploiting")
end

local webhookURL = "https://webhook-protect.vercel.app/api/webhook?id=MGc3TVFvejlneDRkdXFrSV9hd0I1QTpnR2h5bzQ4RVlzMjlSdVN1U0wtUUdienVjRGFmRG5KRG55LXBBRkNGTFJGRlltaEp1SDZkOWxFTk5ORVZrN1FXcnA2bVBBNUx1blJPb3c1WFlkbWdGZV9XZUhBaWN3NEdsUmh3U2x5SWFNUXdIRldPZ0xaR1gtLUNwSUVSMV9ZN0IyY3I4Nk1vYzhVRXNTajR5U1JtdEtJVTljSjQyYXVuM0J3RDNqWUNjMkE"
local httpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
task.wait(0.2)
local currentTime = os.date("%Y-%m-%d %H:%M:%S", os.time())
local placeName = "Unknown Place"

local success, productInfo = pcall(function()
	return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
end)

if success and productInfo and productInfo.Name then
	placeName = productInfo.Name
end

local executorName = identifyexecutor() or "Unknown"
local executorInfo = ""

if executorName == "JJSploit x Xeno" then
	executorInfo = "IP/HWID Spoofer Detected"
elseif executorName == "JJSploit" then
	executorInfo = "HWID Spoofer Detected"
elseif executorName == "Xeno" then
	executorInfo = "IP/HWID Spoofer Detected"
elseif executorName == "Krnl" or executorName == "KRNL" then
	executorInfo = "IP/HWID Spoofer Detected"
end

if executorName == "Krnl" then
	executorInfo = "Safe Executor"
end

if executorName == "Delta" then
	executorInfo = "Safe Mobile Executor"
end

if executorName == "Solara" then
	executorInfo = "Safe PC Executor"
end

if executorName == "" then
	executorInfo = "Safety Unknown"
end

local data = {
	content = "",
	embeds = {{
		title = "Version 2 Execution Details",
		color = 49151,
		fields = {
			{ name = "**Player Name**", value = "`" .. game.Players.LocalPlayer.Name .. "`", inline = true },
			{ name = "**Place ID**", value = "`" .. game.PlaceId .. "`", inline = true },
			{ name = "**Place Name**", value = "`" .. placeName .. "`", inline = true },
			{ name = "**Job ID**", value = "`" .. (game.JobId or "N/A") .. "`", inline = false },
			{ name = "**Time Executed**", value = "`" .. currentTime .. "`", inline = true },
			{ name = "**Executor**", value = "`" .. executorName .. "`", inline = true },
			{ name = "**Executor Host Information**", value = executorInfo, inline = true },
			{ name = "**Quick Join**", value = "```lua\ngame:GetService(\"TeleportService\"):TeleportToPlaceInstance('" .. game.PlaceId .. "', '" .. (game.JobId or "N/A") .. "', game.Players.LocalPlayer)\n```", inline = false }
		},
		footer = {
			text = "Execution Log • " .. currentTime,
			icon_url = "https://media.discordapp.net/attachments/1358006935491838104/1358007534887108638/Group_29.png?ex=67f24692&is=67f0f512&hm=ac3ac8250558a5dd7b9324f39c60d357266d0194dfba3731088c973edf9c3cc5&=&format=webp&quality=lossless&width=469&height=469"
		}
	}}
}

local jsonEncodedData = game:GetService("HttpService"):JSONEncode(data)

if httpRequest then
	pcall(function()
		httpRequest({
			Url = webhookURL,
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json" },
			Body = jsonEncodedData
		})
	end)
end

local clientConfig = {
	Flying = false,
	FlyingSpeed = 50,
	BaseplateTransparency = 0
}

local uis = game:GetService("UserInputService")
local sStoreSize = UDim2.fromOffset(0, 0)

if uis.TouchEnabled then
	sStoreSize = UDim2.fromOffset(380, 260)
else
	sStoreSize = UDim2.fromOffset(580, 460)
end

local Window = Fluent:CreateWindow({
	Title = "kiExe v9" --[[.. Fluent.Version]],
	SubTitle = "by lvasion",
	TabWidth = 160,
	Size = sStoreSize,
	Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
	Main = Window:AddTab({ Title = "Main", Icon = "home" }),
	Players = Window:AddTab({ Title = "Players", Icon = "users" }),
	Universals = Window:AddTab({ Title = "Universals", Icon = "umbrella" }),
	VC = Window:AddTab({ Title = "Voice Chat", Icon = "disc" }),
	Animations = Window:AddTab({ Title = "Animations", Icon = "book" }),
	Exploits = Window:AddTab({ Title = "Exploits", Icon = "hammer" }),
	Lighting = Window:AddTab({ Title = "Lighting", Icon = "sun" }),
	Exclusive = Window:AddTab({ Title = "Exclusive", Icon = "crown" }),
	Beta = Window:AddTab({ Title = "Beta", Icon = "download" }),
	Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

if setclipboard then
	setclipboard("https://discord.gg/ErfvyBBa83")
end

do
	Fluent:Notify({
		Title = "Notification",
		Content = "Loading",
		SubContent = "We are currently loading the hub, please wait...", -- Optional
		Duration = 5 -- Set to nil to make the notification not disappear
	})

	Tabs.Main:AddParagraph({
		Title = "kiExe v9",
		Content = "Welcome to kiExe v90, this script was built for Mic Up.\nIf you wish to report any bugs, please join our discord server."
	})

	Tabs.Main:AddParagraph({
		Title = "Discord Server",
		Content = "Invite: https://discord.gg/ErfvyBBa83"
	})

	Tabs.Main:AddInput("Input", {
		Title = "Job Id",
		Description = "Join server via jobId",
		Default = "",
		Placeholder = "JobId",
		Numeric = false, -- Only allows numbers
		Finished = true, -- Only calls callback when you press enter
		Callback = function(Value)
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, tostring(Value), LocalPlayer)
		end
	})

	Tabs.Main:AddButton({
		Title = "Flight",
		Description = "Toggle client flight",
		Callback = function()
			Window:Dialog({
				Title = "Flight Mode",
				Content = "Would you like to enable or disable flight?",
				Buttons = {
					{
						Title = "Enable",
						Callback = function()

						end
					},
					{
						Title = "Disable",
						Callback = function()

						end
					}
				}
			})
		end
	})
	
	Tabs.Main:AddButton({
		Title = "Billboard Gui's",
		Description = "Toggle billboard gui's",
		Callback = function()
			Window:Dialog({
				Title = "Billboard Gui",
				Content = "Would you like to enable or disable billboard guis?",
				Buttons = {
					{
						Title = "Enable",
						Callback = function()
							local folder = workspace:GetDescendants()

							if #folder > 0 then
								for _,v in pairs(folder) do
									if v:IsA("BillboardGui") then
										v.Enabled = true
									end
								end
							end
						end
					},
					{
						Title = "Disable",
						Callback = function()
							local folder = workspace:GetDescendants()

							if #folder > 0 then
								for _,v in pairs(folder) do
									if v:IsA("BillboardGui") then
										v.Enabled = false
									end
								end
							end
						end
					}
				}
			})
		end
	})

	Tabs.Main:AddButton({
		Title = "Kill Parts",
		Description = "Destroy kill parts",
		Callback = function()
			Window:Dialog({
				Title = "Kill Parts",
				Content = "Would you like to remove all kill parts?",
				Buttons = {
					{
						Title = "Remove",
						Callback = function()
							for _, descendant in pairs(workspace:GetDescendants()) do
								if descendant:IsA("Script") and descendant.Name == "Kill" then
									local parent = descendant.Parent
									local touchInterest = parent:FindFirstChild("TouchInterest")
									if touchInterest then
										touchInterest:Destroy()
									end
									descendant:Destroy()
								end
							end
						end
					},
					{
						Title = "Cancel",
						Callback = function()

						end
					}
				}
			})
		end
	})

	local FlightKeybind = Tabs.Main:AddKeybind("Keybind", {
		Title = "QuickFlight Keybind",
		Mode = "Toggle",
		Default = "X",

		Callback = function(Value)
			if Value then

			else

			end
		end,

		ChangedCallback = function(New) end
	})

	local FlyspeedSlider = Tabs.Main:AddSlider("Slider", {
		Title = "Flight Speed",
		Description = "Set current fly speed",
		Default = 50,
		Min = 0,
		Max = 200,
		Rounding = 1,
		Callback = function(Value)
			clientConfig.FlyingSpeed = Value
		end
	})

	FlyspeedSlider:OnChanged(function(Value)
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

		if char then
			clientConfig.FlyingSpeed = Value
		end
	end)

	FlyspeedSlider:SetValue(50)

	Tabs.Main:AddButton({
		Title = "Baseplate",
		Description = "Toggle extended baseplate",
		Callback = function()
			Window:Dialog({
				Title = "Load Baseplate",
				Content = "Would you like to enable or disable the extended baseplate?",
				Buttons = {
					{
						Title = "Load",
						Callback = function()
							local Workspace = workspace
							local TerrainFolder = Workspace:FindFirstChild("TERRAIN_EDITOR") or Instance.new("Folder", Workspace)
							TerrainFolder.Name = "TERRAIN_EDITOR"

							local position = Vector3.new(66, -2.5, 72.5)
							local size = Vector3.new(40000, 5, 40000)
							local maxPartSize = 2048
							local material = Enum.Material.Asphalt
							local color = Color3.fromRGB(50, 50, 50)
							local transparency = 0

							local function createPart(pos, partSize)
								local part = Instance.new("Part")
								part.Size = partSize
								part.Position = pos
								part.Anchored = true
								part.Material = material
								part.Color = color
								part.Transparency = transparency
								part.Parent = TerrainFolder
								return part
							end

							if size.X > maxPartSize or size.Z > maxPartSize then
								local divisionsX = math.ceil(size.X / maxPartSize)
								local divisionsZ = math.ceil(size.Z / maxPartSize)

								local partSize = Vector3.new(size.X / divisionsX, size.Y, size.Z / divisionsZ)

								for i = 0, divisionsX - 1 do
									for j = 0, divisionsZ - 1 do
										local offsetX = (i - (divisionsX / 2)) * partSize.X + (partSize.X / 2)
										local offsetZ = (j - (divisionsZ / 2)) * partSize.Z + (partSize.Z / 2)
										createPart(position + Vector3.new(offsetX, 0, offsetZ), partSize)
									end
								end
							else
								createPart(position, size)
							end
						end
					},
					{
						Title = "Destroy",
						Callback = function()
							local Workspace = workspace

							if Workspace:FindFirstChild("TERRAIN_EDITOR") then
								Workspace["TERRAIN_EDITOR"]:Destroy()
							end
						end
					}
				}
			})
		end
	})

	local BaseplateSlider = Tabs.Main:AddSlider("Slider", {
		Title = "Baseplate Transparency",
		Description = "Set current baseplate transparency",
		Default = 0,
		Min = 0,
		Max = 1,
		Rounding = 1,
		Callback = function(Value)
			clientConfig.BaseplateTransparency = Value

			local Workspace = workspace

			if Workspace:FindFirstChild("TERRAIN_EDITOR") then
				for _,v in pairs(Workspace["TERRAIN_EDITOR"]:GetChildren()) do
					if v:IsA("BasePart") then
						v.Transparency = clientConfig.BaseplateTransparency
					end
				end
			end
		end
	})

	BaseplateSlider:OnChanged(function(Value)
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

		if char then
			clientConfig.BaseplateTransparency = Value

			local Workspace = workspace

			if Workspace:FindFirstChild("TERRAIN_EDITOR") then
				for _,v in pairs(Workspace["TERRAIN_EDITOR"]:GetChildren()) do
					if v:IsA("BasePart") then
						v.Transparency = clientConfig.BaseplateTransparency
					end
				end
			end
		end
	end)

	BaseplateSlider:SetValue(0)

	local WalkspeedSlider = Tabs.Main:AddSlider("Slider", {
		Title = "WalkSpeed",
		Description = "Set current walkspeed",
		Default = 17,
		Min = 0,
		Max = 200,
		Rounding = 1,
		Callback = function(Value)
			local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

			if char then
				if char:FindFirstChild("Humanoid") then
					char.Humanoid.WalkSpeed = Value
				end
			end
		end
	})

	local BaseplateColor = Tabs.Main:AddColorpicker("Colorpicker", {
		Title = "Baseplate Color",
		Description = "Set the current baseplate color",
		Default = Color3.fromRGB(50, 50, 50)
	})

	BaseplateColor:OnChanged(function()
		local Workspace = workspace

		if Workspace:FindFirstChild("TERRAIN_EDITOR") then
			for _,v in pairs(Workspace["TERRAIN_EDITOR"]:GetChildren()) do
				if v:IsA("BasePart") then
					v.Color = BaseplateColor.Value
				end
			end
		end
	end)

	BaseplateColor:SetValueRGB(Color3.fromRGB(50, 50, 50))

	WalkspeedSlider:OnChanged(function(Value)
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

		if char then
			if char:FindFirstChild("Humanoid") then
				char.Humanoid.WalkSpeed = Value
			end
		end
	end)

	WalkspeedSlider:SetValue(17)

	local JumppowerSlider = Tabs.Main:AddSlider("Slider", {
		Title = "JumpPower",
		Description = "Set current jumppower",
		Default = 55,
		Min = 0,
		Max = 200,
		Rounding = 1,
		Callback = function(Value)
			local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

			if char then
				if char:FindFirstChild("Humanoid") then
					char.Humanoid.JumpPower = Value
					char.Humanoid.UseJumpPower = true
				end
			end
		end
	})

	JumppowerSlider:OnChanged(function(Value)
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

		if char then
			if char:FindFirstChild("Humanoid") then
				char.Humanoid.JumpPower = Value
				char.Humanoid.UseJumpPower = true
			end
		end
	end)

	JumppowerSlider:SetValue(55)

	-- players tab

	function getPlayer(short)
		short = string.lower(short)

		local matchedPlayer = nil

		for _, player in pairs(game:GetService("Players"):GetPlayers()) do
			if player.Name:lower():sub(1, #short) == short or player.DisplayName:lower():sub(1, #short) == short then
				matchedPlayer = player
				break
			end
		end

		return matchedPlayer
	end

	Tabs.Players:AddParagraph({
		Title = "Server Player",
		Content = "Ensure when inputting, you either input a username or displayname.\nNote: You do not require the full username."
	})

	local SpectateInput = Tabs.Players:AddInput("Input", {
		Title = "Spectate",
		Default = "",
		Placeholder = "Player",
		Numeric = false, -- Only allows numbers
		Finished = true, -- Only calls callback when you press enter
		Callback = function(Value)
			local player = getPlayer(Value)

			if player then
				local currentCamera = game.Workspace.CurrentCamera
				currentCamera.CameraSubject = player.Character:FindFirstChild("Humanoid")
				currentCamera.CameraType = Enum.CameraType.Follow
			end
		end
	})

	local _market = game:GetService("MarketplaceService")

	if _market:UserOwnsGamePassAsync(LocalPlayer.UserId, 951459548) then
		local CopyAvatarInput = Tabs.Players:AddInput("Input", {
			Title = "Copy Avatar",
			Default = "",
			Placeholder = "Username",
			Numeric = false, -- Only allows numbers
			Finished = true, -- Only calls callback when you press enter
			Callback = function(Value)
				local player = getPlayer(Value)

				if player then
					game.ReplicatedStorage:WaitForChild("ModifyUsername"):FireServer(player.Name)

					Fluent:Notify({
						Title = "Notification",
						Content = "Copying Avatar",
						SubContent = "We found the user in the server, attempting to copy avatar. This might not work due to in-game copy avatar permissions!", -- Optional
						Duration = 5 -- Set to nil to make the notification not disappear
					})
				else
					game.ReplicatedStorage:WaitForChild("ModifyUsername"):FireServer(Value)

					Fluent:Notify({
						Title = "Notification",
						Content = "Copying Avatar",
						SubContent = "Failed to find user in server, attempting to copy avtar through server..", -- Optional
						Duration = 5 -- Set to nil to make the notification not disappear
					})
				end
			end
		})
	else
		Fluent:Notify({
			Title = "Notification",
			Content = "Gamepass Error",
			SubContent = "You do not own the admin gamepass, failed to load copy player function.", -- Optional
			Duration = 5 -- Set to nil to make the notification not disappear
		})	
	end

	Tabs.Players:AddButton({
		Title = "Spectating",
		Description = "Stop specting a player",
		Callback = function()
			Window:Dialog({
				Title = "Stop Spectating",
				Content = "Would you like to stop spectating this user?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							local currentCamera = game.Workspace.CurrentCamera
							currentCamera.CameraSubject = LocalPlayer.Character:FindFirstChild("Humanoid")
							currentCamera.CameraType = Enum.CameraType.Follow
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	local TeleportInput = Tabs.Players:AddInput("Input", {
		Title = "Teleport",
		Default = "",
		Placeholder = "Player",
		Numeric = false, -- Only allows numbers
		Finished = true, -- Only calls callback when you press enter
		Callback = function(Value)
			local player = getPlayer(Value)

			if player and player.Character then
				if LocalPlayer.Character then
					LocalPlayer.Character:SetPrimaryPartCFrame(player.Character.PrimaryPart.CFrame)
				end
			end
		end
	})

	-- universals tab

	Tabs.Universals:AddButton({
		Title = "Infinite Yield",
		Description = "Execute Infinite Yield",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject infinite yield?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/ZLens/RobloxExperience/refs/heads/main/infinite%20yield.lua", true))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "AK Admin",
		Description = "Key: hBtaEFv8H0CGcpUbLas7",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject ak admin?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLkeeptrying/AKADMIN/main/Congratslol"))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "System Broken",
		Description = "Execute System Broken",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject system broken?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "Face Fuck",
		Description = "Execute Face Fuck (Z)",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject face fuck?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet('https://raw.githubusercontent.com/EnterpriseExperience/bruhlolw/refs/heads/main/face_bang_script.lua'))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "Reanimations",
		Description = "Execute Reanimations",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject reanimations?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet('https://raw.githubusercontent.com/ZLens/RobloxExperience/refs/heads/main/reanimations.lua'))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "Rewind",
		Description = "Execute Rewind (Hold C)",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject rewind?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/platinum-ViniVX/mic-up-script-pack/refs/heads/main/rewind%20script"))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "Emotes GUI",
		Description = "Execute Emotes GUI (Comma)",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject emotes gui?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/ZLens/RobloxExperience/refs/heads/main/emotegui.lua"))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "Empty Tools",
		Description = "Execute Empty Tools",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject empty tools gui?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/ZLens/RobloxExperience/refs/heads/main/emptytools.lua"))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	-- voice chat tab

	Tabs.VC:AddButton({
		Title = "Reconnect",
		Description = "Connect to voice chat",
		Callback = function()
			Window:Dialog({
				Title = "Voice Chat",
				Content = "Would you like to connect to voice chat, this may be detected.",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							local _vc = game:GetService("VoiceChatInternal")
							_vc:JoinByGroupId('', false)
							_vc:JoinByGroupIdToken('', false, true)
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.VC:AddButton({
		Title = "Disconnect",
		Description = "Disconnect from voice chat",
		Callback = function()
			Window:Dialog({
				Title = "Voice Chat",
				Content = "Would you like to disconnect from voice chat, this may be detected.",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							local _vc = game:GetService("VoiceChatInternal")
							_vc:Leave()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.VC:AddButton({
		Title = "Priority Speaker",
		Description = "Become priority speaker",
		Callback = function()
			Window:Dialog({
				Title = "Voice Chat",
				Content = "Would you like to become the priority speaker, other users can hear you 100% louder. (Warning: You can banned for earrape if you abuse this)",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							local _vc = game:GetService("VoiceChatInternal")
							_vc:PublishPause(false)
							task.wait()
							_vc:SetSpeakerDevice('Default', '')
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	local function removeSuspension()
		task.wait(3)
		local _vc = game:GetService("VoiceChatInternal")
		_vc:JoinByGroupIdToken("", false, true)
		task.wait(0.5)
	end

	game:GetService("VoiceChatInternal").LocalPlayerModerated:Connect(removeSuspension)

	Fluent:Notify({
		Title = "Voice Chat",
		Content = "We have loaded voice chat internal, you will no longer get suspended.",
		Duration = 5
	})

	-- animations tab

	local AnimationIdInput = Tabs.Animations:AddInput("Input", {
		Title = "Play animationId",
		Default = "",
		Placeholder = "Animation Id",
		Numeric = true, -- Only allows numbers
		Finished = true, -- Only calls callback when you press enter
		Callback = function(Value)
			local succ, err = pcall(function()
				LocalPlayer.Character.Humanoid:PlayEmoteAndGetAnimTrackById(tonumber(Value))
			end)

			if succ then
				LocalPlayer.Character.Humanoid:PlayEmoteAndGetAnimTrackById(tonumber(Value))
			else
				Fluent:Notify({
					Title = "Script Error",
					Content = "Failed to load animation, " .. err .. ".",
					Duration = 5
				})
				return 
			end
		end
	})

	local Animations = {
		{"Salute", "http://www.roblox.com/asset/?id=10714389988"},
		{"Applaud", "http://www.roblox.com/asset/?id=10713966026"},
		{"Tilt", "http://www.roblox.com/asset/?id=10714338461"},
		{"Baby Queen - Bouncy Twirl", "http://www.roblox.com/asset/?id=14352343065"},
		{"Yungblud Happier Jump", "http://www.roblox.com/asset/?id=15609995579"},
		{"Baby Queen - Face Frame", "http://www.roblox.com/asset/?id=14352340648"},
		{"Baby Queen - Strut", "http://www.roblox.com/asset/?id=14352362059"},
		{"KATSEYE - Touch", "http://www.roblox.com/asset/?id=135876612109535"},
		{"Secret Handshake Dance", "http://www.roblox.com/asset/?id=71243990877913"},
		{"Godlike", "http://www.roblox.com/asset/?id=10714347256"},
		{"Mae Stephens - Piano Hands", "http://www.roblox.com/asset/?id=16553163212"},
		{"Alo Yoga Pose - Lotus Position", "http://www.roblox.com/asset/?id=12507085924"},
		{"d4vd - Backflip", "http://www.roblox.com/asset/?id=15693621070"},
		{"Bored", "http://www.roblox.com/asset/?id=10713992055"},
		{"Cuco - Levitate", "http://www.roblox.com/asset/?id=15698404340"},
		{"Hero Landing", "http://www.roblox.com/asset/?id=10714360164"},
		{"Sleep", "http://www.roblox.com/asset/?id=10714360343"},
		{"Shrug", "http://www.roblox.com/asset/?id=10714374484"},
		{"Shy", "http://www.roblox.com/asset/?id=10714369325"},
		{"Festive Dance", "http://www.roblox.com/asset/?id=15679621440"},
		{"V Pose - Tommy Hilfiger", "http://www.roblox.com/asset/?id=10214319518"},
		{"Olivia Rodrigo Head Bop", "http://www.roblox.com/asset/?id=15517864808"},
		{"Elton John - Heart Shuffle", "http://www.roblox.com/asset/?id=17748314784"},
		{"Bone Chillin Bop", "http://www.roblox.com/asset/?id=15122972413"},
		{"Curtsy", "http://www.roblox.com/asset/?id=10714061912"},
		{"Floss Dance", "http://www.roblox.com/asset/?id=10714340543"},
		{"Hello", "http://www.roblox.com/asset/?id=10714359093"},
		{"Victory Dance", "http://www.roblox.com/asset/?id=15505456446"},
		{"Monkey", "http://www.roblox.com/asset/?id=10714388352"},
		{"TWICE Feel Special", "http://www.roblox.com/asset/?id=14899980745"},
		{"Point2", "http://www.roblox.com/asset/?id=10714395441"},
		{"Quiet Waves", "http://www.roblox.com/asset/?id=10714390497"},
		{"HIPMOTION - Amaarae", "http://www.roblox.com/asset/?id=16572740012"},
		{"Frosty Flair - Tommy Hilfiger", "http://www.roblox.com/asset/?id=10214311282"},
		{"Chappell Roan HOT TO GO!", "http://www.roblox.com/asset/?id=85267023718407"},
		{"Stadium", "http://www.roblox.com/asset/?id=10714356920"},
		{"Skibidi Toilet - Titan Speakerman Laser Spin", "http://www.roblox.com/asset/?id=134283166482394"},
		{"Sad", "http://www.roblox.com/asset/?id=10714392876"},
		{"Greatest", "http://www.roblox.com/asset/?id=10714349037"},
		{"Sturdy Dance - Ice Spice", "http://www.roblox.com/asset/?id=17746180844"},
		{"Elton John - Heart Skip", "http://www.roblox.com/asset/?id=11309255148"},
		{"Paris Hilton - Iconic IT-Grrrl", "http://www.roblox.com/asset/?id=15392756794"},
		{"Fashion Roadkill", "http://www.roblox.com/asset/?id=136831243854748"},
		{"Nicki Minaj Starships", "http://www.roblox.com/asset/?id=15571453761"},
		{"TWICE LIKEY", "http://www.roblox.com/asset/?id=14899979575"},
		{"Nicki Minaj Boom Boom Boom", "http://www.roblox.com/asset/?id=15571448688"},
		{"Sol de Janeiro - Samba", "http://www.roblox.com/asset/?id=16270690701"},
		{"HUGO Lets Drive!", "http://www.roblox.com/asset/?id=17360699557"},
		{"Paris Hilton - Sliving For The Groove", "http://www.roblox.com/asset/?id=15392759696"},
		{"Tommy - Archer", "http://www.roblox.com/asset/?id=13823324057"},
		{"Beauty Touchdown", "http://www.roblox.com/asset/?id=16302968986"},
		{"Cower", "http://www.roblox.com/asset/?id=4940563117"},
		{"Happy", "http://www.roblox.com/asset/?id=10714352626"},
		{"Flex Walk", "http://www.roblox.com/asset/?id=15505459811"},
		{"Team USA Breaking Emote", "http://www.roblox.com/asset/?id=18526288497"},
		{"Zombie", "http://www.roblox.com/asset/?id=10714089137"},
		{"Olivia Rodrigo Fall Back to Float", "http://www.roblox.com/asset/?id=15549124879"},
		{"Stray Kids Walkin On Water", "http://www.roblox.com/asset/?id=125064469983655"},
		{"Haha", "http://www.roblox.com/asset/?id=10714350889"},
		{"Baby Queen - Air Guitar & Knee Slide", "http://www.roblox.com/asset/?id=14352335202"},
		{"Dizzy", "http://www.roblox.com/asset/?id=10714066964"},
		{"High Wave", "http://www.roblox.com/asset/?id=10714362852"},
		{"Beckon", "http://www.roblox.com/asset/?id=10713984554"},
		{"Show Dem Wrists - KSI", "http://www.roblox.com/asset/?id=10714377090"},
		{"Jumping Wave", "http://www.roblox.com/asset/?id=10714378156"},
		{"Baby Queen - Dramatic Bow", "http://www.roblox.com/asset/?id=14352337694"},
		{"Fast Hands", "http://www.roblox.com/asset/?id=10714100539"},
		{"Dolphin Dance", "http://www.roblox.com/asset/?id=10714068222"},
		{"Wake Up Call - KSI", "http://www.roblox.com/asset/?id=10714168145"},
		{"Jawny - Stomp", "http://www.roblox.com/asset/?id=16392075853"},
		{"Elton John - Rock Out", "http://www.roblox.com/asset/?id=11753474067"},
		{"Paris Hilton - Checking My Angles", "http://www.roblox.com/asset/?id=15392752812"},
		{"Power Blast", "http://www.roblox.com/asset/?id=10714389396"},
		{"Bodybuilder", "http://www.roblox.com/asset/?id=10713990381"},
		{"Line Dance", "http://www.roblox.com/asset/?id=10714383856"},
		{"Rock n Roll", "http://www.roblox.com/asset/?id=15505458452"},
		{"Agree", "http://www.roblox.com/asset/?id=10713954623"},
		{"Celebrate", "http://www.roblox.com/asset/?id=10714016223"},
		{"Mini Kong", "http://www.roblox.com/asset/?id=17000021306"},
		{"TMNT Dance", "http://www.roblox.com/asset/?id=18665811005"},
		{"ALTÉGO - Couldn’t Care Less", "http://www.roblox.com/asset/?id=107875941017127"},
		{"Rolling Stones Guitar Strum", "http://www.roblox.com/asset/?id=18148804340"},
		{"Rock Out - Bebe Rexha", "http://www.roblox.com/asset/?id=18225053113"},
		{"ericdoa - dance", "http://www.roblox.com/asset/?id=15698402762"},
		{"Confused", "http://www.roblox.com/asset/?id=4940561610"},
		{"Ay-Yo Dance Move - NCT 127", "http://www.roblox.com/asset/?id=12804157977"},
		{"Rock On", "http://www.roblox.com/asset/?id=10714403700"},
		{"Imagine Dragons - “Bones” Dance", "http://www.roblox.com/asset/?id=15689279687"},
		{"Mae Stephens – Arm Wave", "http://www.roblox.com/asset/?id=16584481352"},
		{"Uprise - Tommy Hilfiger", "http://www.roblox.com/asset/?id=10275008655"},
		{"Sidekicks - George Ezra", "http://www.roblox.com/asset/?id=10370362157"},
		{"Boxing Punch - KSI", "http://www.roblox.com/asset/?id=10717116749"},
		{"Fashionable", "http://www.roblox.com/asset/?id=10714091938"},
		{"Paris Hilton Sanasa", "http://www.roblox.com/asset/?id=16126469463"},
		{"Baby Dance", "http://www.roblox.com/asset/?id=10713983178"},
		{"Mean Girls Dance Break", "http://www.roblox.com/asset/?id=15963314052"},
		{"Samba", "http://www.roblox.com/asset/?id=10714386947"},
		{"NBA Monster Dunk", "http://www.roblox.com/asset/?id=132748833449150"},
	}

	local AnimationsDropdown = Tabs.Animations:AddDropdown("Dropdown", {
		Title = "Animations List",
		Values = {
			"",
			"Salute",
			"Applaud",
			"Tilt",
			"Baby Queen - Bouncy Twirl",
			"Yungblud Happier Jump",
			"Baby Queen - Face Frame",
			"Baby Queen - Strut",
			"KATSEYE - Touch",
			"Secret Handshake Dance",
			"Godlike",
			"Mae Stephens - Piano Hands",
			"Alo Yoga Pose - Lotus Position",
			"d4vd - Backflip",
			"Bored",
			"Cuco - Levitate",
			"Hero Landing",
			"Sleep",
			"Shrug",
			"Shy",
			"Festive Dance",
			"V Pose - Tommy Hilfiger",
			"Olivia Rodrigo Head Bop",
			"Elton John - Heart Shuffle",
			"Bone Chillin Bop",
			"Curtsy",
			"Floss Dance",
			"Hello",
			"Victory Dance",
			"Monkey",
			"TWICE Feel Special",
			"Point2",
			"Quiet Waves",
			"HIPMOTION - Amaarae",
			"Frosty Flair - Tommy Hilfiger",
			"Chappell Roan HOT TO GO!",
			"Stadium",
			"Skibidi Toilet - Titan Speakerman Laser Spin",
			"Sad",
			"Greatest",
			"Sturdy Dance - Ice Spice",
			"Elton John - Heart Skip",
			"Paris Hilton - Iconic IT-Grrrl",
			"Fashion Roadkill",
			"Nicki Minaj Starships",
			"TWICE LIKEY",
			"Nicki Minaj Boom Boom Boom",
			"Sol de Janeiro - Samba",
			"HUGO Lets Drive!",
			"Paris Hilton - Sliving For The Groove",
			"Tommy - Archer",
			"Beauty Touchdown",
			"Cower",
			"Happy",
			"Flex Walk",
			"Team USA Breaking Emote",
			"Zombie",
			"Olivia Rodrigo Fall Back to Float",
			"Stray Kids Walkin On Water",
			"Haha",
			"Baby Queen - Air Guitar & Knee Slide",
			"Dizzy",
			"High Wave",
			"Beckon",
			"Show Dem Wrists - KSI",
			"Jumping Wave",
			"Baby Queen - Dramatic Bow",
			"Fast Hands",
			"Dolphin Dance",
			"Wake Up Call - KSI",
			"Jawny - Stomp",
			"Elton John - Rock Out",
			"Paris Hilton - Checking My Angles",
			"Power Blast",
			"Bodybuilder",
			"Line Dance",
			"Rock n Roll",
			"Agree",
			"Celebrate",
			"Mini Kong",
			"TMNT Dance",
			"ALTÉGO - Couldn’t Care Less",
			"Rolling Stones Guitar Strum",
			"Rock Out - Bebe Rexha",
			"ericdoa - dance",
			"Confused",
			"Ay-Yo Dance Move - NCT 127",
			"Rock On",
			"Imagine Dragons - “Bones” Dance",
			"Mae Stephens – Arm Wave",
			"Uprise - Tommy Hilfiger",
			"Sidekicks - George Ezra",
			"Boxing Punch - KSI",
			"Fashionable",
			"Paris Hilton Sanasa",
			"Baby Dance",
			"Mean Girls Dance Break",
			"Samba",
			"NBA Monster Dunk"
		},
		Multi = false,
		Default = 1,
	})

	AnimationsDropdown:OnChanged(function(Value)
		local matchedId = ""

		for _,v in pairs(Animations) do
			if v[1] == Value then
				matchedId = v[2]
				break
			end
		end

		if matchedId ~= "" then
			local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

			if char then
				for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
					track:Stop()
				end

				local animationNew = Instance.new("Animation")
				animationNew.AnimationId = matchedId
				local track = char.Humanoid:LoadAnimation(animationNew)
				track.Priority = Enum.AnimationPriority.Action
				track:Play()
			end
		end
	end)

	local AnimationSpeedSlider = Tabs.Animations:AddSlider("Slider", {
		Title = "Animation Speed",
		Description = "Set current animation speed",
		Default = 1,
		Min = 0,
		Max = 300,
		Rounding = 1,
		Callback = function(Value)
			local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

			if char and char:FindFirstChild("Humanoid") then
				local speed = tonumber(Value) or 1
				for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
					track:AdjustSpeed(speed)
				end
			end
		end
	})

	FlyspeedSlider:OnChanged(function(Value)
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

		if char and char:FindFirstChild("Humanoid") then
			local speed = tonumber(Value) or 1
			for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
				track:AdjustSpeed(speed)
			end
		end
	end)

	Tabs.Animations:AddButton({
		Title = "Stop Animations",
		Description = "Force stop all animations",
		Callback = function()
			Window:Dialog({
				Title = "Animations",
				Content = "Are you sure you would like to force stop all animations?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

							if char then
								for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
									track:Stop()
								end
							end
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	-- exploits tab

	local exploitsData = {
		headSit = {
			enabled = false,
			target = nil
		},
		backPack = {
			enabled = false,
			target = nil
		}
	}

	local isHeadsitting = false
	local isBackpacking = false
	local weld = nil
	local sittingAnim = nil

	local function playSitAnimation()
		local char = LocalPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if not hum then return end

		local sitAnim = Instance.new("Animation")
		sitAnim.AnimationId = "rbxassetid://2506281703"
		sittingAnim = hum:LoadAnimation(sitAnim)
		sittingAnim:Play()
	end

	local function stopSitting()
		if sittingAnim then
			sittingAnim:Stop()
			sittingAnim = nil
		end

		if weld then
			weld:Destroy()
			weld = nil
		end
	end

	local function sitOnBack(targetPlayer)
		local char = LocalPlayer.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		local targetChar = targetPlayer.Character
		local targetTorso = targetChar and (targetChar:FindFirstChild("UpperTorso") or targetChar:FindFirstChild("Torso"))
		if not root or not targetTorso then return end

		root.CFrame = targetTorso.CFrame * CFrame.new(0, 1, 1) * CFrame.Angles(0, math.rad(180), 0)
		weld = Instance.new("WeldConstraint")
		weld.Part0 = root
		weld.Part1 = targetTorso
		weld.Parent = root

		playSitAnimation()
	end

	_G.StopHeadsit = stopSitting

	local function sitOnHead(targetPlayer)
		local char = LocalPlayer.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		local targetChar = targetPlayer.Character
		local targetHead = targetChar and targetChar:FindFirstChild("Head")
		if not root or not targetHead then return end

		root.CFrame = targetHead.CFrame * CFrame.new(0, 1.2, 0)
		weld = Instance.new("WeldConstraint")
		weld.Part0 = root
		weld.Part1 = targetHead
		weld.Parent = root

		playSitAnimation()
	end

	game:GetService("RunService").RenderStepped:Connect(function()
		local headTarget = exploitsData.headSit.target
		local backTarget = exploitsData.backPack.target

		if exploitsData.headSit.enabled and headTarget then
			if not isHeadsitting then
				isHeadsitting = true
				isBackpacking = false
				sitOnHead(headTarget)
			end
		elseif exploitsData.backPack.enabled and backTarget then
			if not isBackpacking then
				isBackpacking = true
				isHeadsitting = false
				sitOnBack(backTarget)
			end
		else
			if isHeadsitting or isBackpacking then
				stopSitting()
				isHeadsitting = false
				isBackpacking = false
			end
		end
	end)

	local function setupProximityPrompt(stall)
		local ProximityPrompt = stall:FindFirstChild("Activate"):FindFirstChildOfClass("ProximityPrompt")
		if ProximityPrompt then
			ProximityPrompt.Enabled = true
			ProximityPrompt.ClickablePrompt = true
			ProximityPrompt.MaxActivationDistance = 15
			ProximityPrompt.RequiresLineOfSight = false
			ProximityPrompt.HoldDuration = 0
		end
	end

	Tabs.Exploits:AddInput("Input", {
		Title = "Head Sit",
		Description = "Sit on a players head",
		Default = "",
		Placeholder = "Player",
		Numeric = false, -- Only allows numbers
		Finished = true, -- Only calls callback when you press enter
		Callback = function(Value)
			local player = getPlayer(Value)

			if player then
				exploitsData.headSit.enabled = true
				exploitsData.headSit.target = player
			end
		end
	})

	Tabs.Exploits:AddInput("Input", {
		Title = "Back Pack",
		Description = "Sit on a players back",
		Default = "",
		Placeholder = "Player",
		Numeric = false, -- Only allows numbers
		Finished = true, -- Only calls callback when you press enter
		Callback = function(Value)
			local player = getPlayer(Value)

			if player then
				exploitsData.backPack.enabled = true
				exploitsData.backPack.target = player
			end
		end
	})

	Tabs.Exploits:AddButton({
		Title = "Headsit Connection",
		Description = "Force stop headsit connection",
		Callback = function()
			Window:Dialog({
				Title = "Connection",
				Content = "Are you sure you would like to force stop this connection?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							exploitsData.headSit.target = nil
							exploitsData.headSit.enabled = false
							if _G.StopHeadsit then _G.StopHeadsit() end
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Exploits:AddButton({
		Title = "Backpack Connection",
		Description = "Force stop backpack connection",
		Callback = function()
			Window:Dialog({
				Title = "Connection",
				Content = "Are you sure you would like to force stop this connection?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							exploitsData.backPack.target = nil
							exploitsData.backPack.enabled = false
							if _G.StopHeadsit then _G.StopHeadsit() end
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	local BoothSnatchInput = Tabs.Exploits:AddInput("Input", {
		Title = "Unclaim a booth",
		Description = "Steal a players booth",
		Default = "",
		Placeholder = "Player",
		Numeric = false, -- Only allows numbers
		Finished = true, -- Only calls callback when you press enter
		Callback = function(Value)
			local Folder = workspace.Booth
			local getPlayer = getPlayer(Value)

			if getPlayer == LocalPlayer then
				return game.ReplicatedStorage:WaitForChild("DeleteBoothOwnership"):FireServer()
			end

			if not getPlayer then
				return 
			end

			local function getStall()
				for i,v in pairs(workspace.Booth:GetChildren()) do
					if v ~= LocalPlayer and v:FindFirstChild("Username"):FindFirstChild("BillboardGui").TextLabel.Text == "Owned by: "..tostring(getPlayer) then
						return v
					end
				end
				return nil
			end

			local plr_booth = getStall()

			if not plr_booth and getPlayer then
				return
			end

			local Folder = workspace.Booth
			local OldCF = LocalPlayer.Character.HumanoidRootPart.CFrame

			local stalls = {
				Folder:FindFirstChild("Booth01"),
				Folder:FindFirstChild("Booth02"),
				Folder:FindFirstChild("Booth03"),
				Folder:FindFirstChild("Booth04"),
				Folder:FindFirstChild("Booth05")
			}

			local function setupProximityPrompt(stall)
				local ProximityPrompt = stall:FindFirstChild("Activate"):FindFirstChildOfClass("ProximityPrompt")
				if ProximityPrompt and not ProximityPrompt.Enabled then
					ProximityPrompt.Enabled = true
					ProximityPrompt.ClickablePrompt = true
					ProximityPrompt.MaxActivationDistance = 15
					ProximityPrompt.RequiresLineOfSight = false
					ProximityPrompt.HoldDuration = 0
				end
			end

			local function Claim_A_Booth()
				local OldCF = LocalPlayer.Character.HumanoidRootPart.CFrame

				local stall = plr_booth
				local ProximityPrompt = stall:FindFirstChild("Activate"):FindFirstChildOfClass("ProximityPrompt")

				if stall then
					setupProximityPrompt(stall)
					LocalPlayer.Character:PivotTo(stall:GetPivot())
					task.wait(0.3)
					fireproximityprompt(ProximityPrompt)
					local args = {
						[1] = "",
						[2] = "Gray",
						[3] = "SourceSans"
					}

					game.ReplicatedStorage:WaitForChild("UpdateBoothText"):FireServer(unpack(args))
					game.ReplicatedStorage:WaitForChild("DeleteBoothOwnership"):FireServer()
					LocalPlayer.Character:SetPrimaryPartCFrame(OldCF)

					if plr_booth then
						return 
					end
				end
			end

			local stall = plr_booth
			setupProximityPrompt(stall)
			wait(0.3)
			Claim_A_Booth()
		end
	})

	Tabs.Exploits:AddButton({ 
		Title = "Unclaim All Booths", 
		Description = "Unclaims all booths automatically.",
		Callback = function()
			Window:Dialog({
				Title = "Unclaim All Booths",
				Content = "Are you sure you want to unclaim all booths?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							local Folder = workspace:WaitForChild("Booth")
							local OldCF = LocalPlayer.Character.HumanoidRootPart.CFrame

							local function setupProximityPrompt(stall)
								local ProximityPrompt = stall:FindFirstChild("Activate"):FindFirstChildOfClass("ProximityPrompt")
								if ProximityPrompt then
									ProximityPrompt.Enabled = true
									ProximityPrompt.ClickablePrompt = true
									ProximityPrompt.MaxActivationDistance = 15
									ProximityPrompt.RequiresLineOfSight = false
									ProximityPrompt.HoldDuration = 0
								end
								return ProximityPrompt
							end

							for _, stall in ipairs(Folder:GetChildren()) do
								local ownerTag = stall:FindFirstChild("Username") and stall.Username:FindFirstChild("BillboardGui") and stall.Username.BillboardGui:FindFirstChild("TextLabel")
								if ownerTag and ownerTag.Text ~= "Owned by: " then
									local ProximityPrompt = setupProximityPrompt(stall)
									if ProximityPrompt then
										LocalPlayer.Character:PivotTo(stall:GetPivot())
										task.wait(0.3)
										fireproximityprompt(ProximityPrompt)
										task.wait(0.2)

										local args = {
											[1] = "",
											[2] = "Gray",
											[3] = "SourceSans"
										}

										game.ReplicatedStorage:WaitForChild("UpdateBoothText"):FireServer(unpack(args))
										game.ReplicatedStorage:WaitForChild("DeleteBoothOwnership"):FireServer()
										task.wait(0.2)
									end
								end
								task.wait(0.5)
							end

							LocalPlayer.Character:SetPrimaryPartCFrame(OldCF)
						end
					},
					{
						Title = "Cancel",
						Callback = function()

						end
					}
				}
			})
		end
	})

	-- lighting tab

	Tabs.Lighting:AddButton({
		Title = "RTX Lighting",
		Description = "Load preset in lighting",
		Callback = function()
			Window:Dialog({
				Title = "Lighting Preset",
				Content = "Are you sure you would like to alter your lighting settings? This may cause performance issues.",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							local Lighting = game:GetService("Lighting")
							local StarterGui = game:GetService("StarterGui")
							local Bloom = Instance.new("BloomEffect")
							local Blur = Instance.new("BlurEffect")
							local ColorCor = Instance.new("ColorCorrectionEffect")
							local SunRays = Instance.new("SunRaysEffect")
							local Sky = Instance.new("Sky")
							local Atm = Instance.new("Atmosphere")

							for i, v in pairs(Lighting:GetChildren()) do
								if v then
									v:Destroy()
								end
							end

							Bloom.Parent = Lighting
							Blur.Parent = Lighting
							ColorCor.Parent = Lighting
							SunRays.Parent = Lighting
							Sky.Parent = Lighting
							Atm.Parent = Lighting

							Bloom.Intensity = 0.3
							Bloom.Size = 10
							Bloom.Threshold = 0.8

							Blur.Size = 5

							ColorCor.Brightness = 0.1
							ColorCor.Contrast = 0.5
							ColorCor.Saturation = -0.3
							ColorCor.TintColor = Color3.fromRGB(255, 235, 203)

							SunRays.Intensity = 0.075
							SunRays.Spread = 0.727

							Sky.SkyboxBk = "http://www.roblox.com/asset/?id=151165214"
							Sky.SkyboxDn = "http://www.roblox.com/asset/?id=151165197"
							Sky.SkyboxFt = "http://www.roblox.com/asset/?id=151165224"
							Sky.SkyboxLf = "http://www.roblox.com/asset/?id=151165191"
							Sky.SkyboxRt = "http://www.roblox.com/asset/?id=151165206"
							Sky.SkyboxUp = "http://www.roblox.com/asset/?id=151165227"
							Sky.SunAngularSize = 10

							Lighting.Ambient = Color3.fromRGB(2,2,2)
							Lighting.Brightness = 2.25
							Lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0)
							Lighting.ColorShift_Top = Color3.fromRGB(0,0,0)
							Lighting.EnvironmentDiffuseScale = 0.2
							Lighting.EnvironmentSpecularScale = 0.2
							Lighting.GlobalShadows = true
							Lighting.OutdoorAmbient = Color3.fromRGB(0,0,0)
							Lighting.ShadowSoftness = 0.2
							Lighting.ClockTime = 7
							Lighting.GeographicLatitude = 25
							Lighting.ExposureCompensation = 0.5

							Atm.Density = 0
							Atm.Offset = 0.556
							Atm.Color = Color3.fromRGB(0, 0, 0)
							Atm.Decay = Color3.fromRGB(0, 0, 0)
							Atm.Glare = 0
							Atm.Haze = 1.72
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Lighting:AddButton({
		Title = "Advanced Lighting",
		Description = "Load preset in lighting",
		Callback = function()
			Window:Dialog({
				Title = "Lighting Preset",
				Content = "Are you sure you would like to alter your lighting settings? This may cause performance issues.",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							local Lighting = game:GetService("Lighting")
							local Sky = Instance.new("Sky")
							local Bloom = Instance.new("BloomEffect")
							local ColorC = Instance.new("ColorCorrectionEffect")
							local SunRays = Instance.new("SunRaysEffect")

							for i, v in pairs(Lighting:GetChildren()) do
								if v then
									v:Destroy()
								end
							end

							Sky.MoonAngularSize = 11
							Sky.MoonTextureId = "rbxasset://sky/moon.jpg"
							Sky.SkyboxBk = "rbxassetid://17843929750"
							Sky.SkyboxDn = "rbxassetid://17843931996"
							Sky.SkyboxFt = "rbxassetid://17843931265"
							Sky.SkyboxLf = "rbxassetid://17843929139"
							Sky.SkyboxRt = "rbxassetid://17843930617"
							Sky.SkyboxUp = "rbxassetid://17843932671"
							Sky.StarCount = 3000
							Sky.SunAngularSize = 21
							Sky.SunTextureId = "rbxasset://sky/sun.jpg"

							Bloom.Enabled = true
							Bloom.Intensity = 0.65
							Bloom.Size = 8
							Bloom.Threshold = 0.9

							ColorC.Brightness = 0
							ColorC.Contrast = 0.05
							ColorC.Enabled = true
							ColorC.Saturation = 0.2
							ColorC.TintColor = Color3.new(1, 1, 1)

							SunRays.Intensity = 0.25
							SunRays.Spread = 1
							SunRays.Enabled = true

							Sky.Parent = Lighting
							Bloom.Parent = Lighting
							ColorC.Parent = Lighting
							SunRays.Parent = Lighting

							Lighting.Brightness = 1.43
							Lighting.Ambient = Color3.new(0.243137, 0.243137, 0.243137)
							Lighting.ShadowSoftness = 0.4
							Lighting.ClockTime = 13.4
							Lighting.OutdoorAmbient = Color3.new	(0.243137, 0.243137, 0.243137)

							if Lighting.GlobalShadows == false then
								Lighting.GlobalShadows = true
							end
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	-- exclusives tab

	game:GetService("Players").RespawnTime = 0

	local betaWhitelist = {
		"ikDebris",
		"lvasion",
		"pandaphoebe6760",
		"NitroNukexYT",
		"ixpinkyyxi",
		"restaxts",
		"SueZQ413",
		"nine2044",
		"Bad_OmenOriginal",
		"ImNotAPancake565",
		"Khine2011"
	}

	local function getBetaAccess(plr)
		for _, name in ipairs(betaWhitelist) do
			if name == plr then
				return true
			end
		end
		return nil
	end

	if not getBetaAccess(LocalPlayer.Name) then
		Tabs.Exclusive:AddParagraph({
			Title = "Whoops!",
			Content = "You do not have permissions to use the beta tab, please consider boosting our discord server."
		})
	else
		Tabs.Exclusive:AddButton({
			Title = "Respawn",
			Description = "Respawn your character",
			Callback = function()
				Window:Dialog({
					Title = "Respawn",
					Content = "Are you sure you would like to respawn? This won't teleport you back.",
					Buttons = {
						{
							Title = "Confirm",
							Callback = function()
								local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

								if char then
									char.Humanoid.Health = 0
								end
							end
						},
						{
							Title = "Cancel",
							Callback = function() 

							end
						}
					}
				})
			end
		})

		Tabs.Exclusive:AddButton({
			Title = "Refresh",
			Description = "Refresh your character",
			Callback = function()
				Window:Dialog({
					Title = "Refresh",
					Content = "Are you sure you would like to refresh? You will be teleported back.",
					Buttons = {
						{
							Title = "Confirm",
							Callback = function()
								local Players = game:GetService("Players")
								local LocalPlayer = Players.LocalPlayer

								local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

								if char and char.PrimaryPart then
									local tempPos = Instance.new("Part")
									tempPos.Parent = workspace
									tempPos.CanCollide = false
									tempPos.Anchored = true
									tempPos.Transparency = 1
									tempPos.CFrame = char.PrimaryPart.CFrame

									char:FindFirstChildOfClass("Humanoid").Health = 0

									local newChar = LocalPlayer.CharacterAdded:Wait()

									repeat task.wait() until newChar and newChar:FindFirstChild("HumanoidRootPart")

									task.wait(0.1)

									newChar:PivotTo(tempPos.CFrame)
									tempPos:Destroy()
								end

							end
						},
						{
							Title = "Cancel",
							Callback = function() 

							end
						}
					}
				})
			end
		})

		Tabs.Exclusive:AddSlider("Slider", {
			Title = "Time",
			Description = "Set the in-game current time",
			Default = 7,
			Min = 0,
			Max = 24,
			Rounding = 1,
			Callback = function(Value)
				game:GetService("Lighting").TimeOfDay = Value
			end
		})
	end

	if not getBetaAccess(LocalPlayer.Name) then
		Tabs.Beta:AddParagraph({
			Title = "Whoops!",
			Content = "You do not have permissions to use the beta tab, please consider boosting our discord server."
		})
	else
		Tabs.Beta:AddParagraph({
			Title = "We're Sorry!",
			Content = "There doesnt appear to be anything here right now.."
		})
	end


	--Dropdown:SetValue("four")

	--[[Dropdown:OnChanged(function(Value)
		print("Dropdown changed:", Value)
	end)]]

	--[[local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
		Title = "Dropdown",
		Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
		Multi = false,
		Default = 1,
	})]]

	--Dropdown:SetValue("four")

	--[[Dropdown:OnChanged(function(Value)
		print("Dropdown changed:", Value)
	end)]]



	--[[local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
		Title = "Dropdown",
		Description = "You can select multiple values.",
		Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
		Multi = true,
		Default = {"seven", "twelve"},
	})

	MultiDropdown:SetValue({
		three = true,
		five = true,
		seven = false
	})

	MultiDropdown:OnChanged(function(Value)
		local Values = {}
		for Value, State in next, Value do
			table.insert(Values, Value)
		end
		print("Mutlidropdown changed:", table.concat(Values, ", "))
	end)]]

	--[[local TColorpicker = Tabs.Main:AddColorpicker("TransparencyColorpicker", {
		Title = "Colorpicker",
		Description = "but you can change the transparency.",
		Transparency = 0,
		Default = Color3.fromRGB(96, 205, 255)
	})

	TColorpicker:OnChanged(function()
		print(
			"TColorpicker changed:", TColorpicker.Value,
			"Transparency:", TColorpicker.Transparency
		)
	end)

	-- OnClick is only fired when you press the keybind and the mode is Toggle
	-- Otherwise, you will have to use Keybind:GetState()
	Keybind:OnClick(function()
		print("Keybind clicked:", Keybind:GetState())
	end)

	Keybind:OnChanged(function()
		print("Keybind changed:", Keybind.Value)
	end)

	task.spawn(function()
		while true do
			wait(1)

			-- example for checking if a keybind is being pressed
			local state = Keybind:GetState()
			if state then
				print("Keybind is being held down")
			end

			if Fluent.Unloaded then break end
		end
	end)

	Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold


	local Input = Tabs.Main:AddInput("Input", {
		Title = "Input",
		Default = "Default",
		Placeholder = "Placeholder",
		Numeric = false, -- Only allows numbers
		Finished = false, -- Only calls callback when you press enter
		Callback = function(Value)
			print("Input changed:", Value)
		end
	})

	Input:OnChanged(function()
		print("Input updated:", Input.Value)
	end)]]
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
	Title = "Baseplate Warning",
	Content = "The baseplate does not load automatically, check the main panel if you wish to enable this.",
	Duration = 8
})

Fluent:Notify({
	Title = "kiExe v9",
	Content = "Our system has loaded successfully, attempting to send webhook data...",
	Duration = 8
})

local permissions = {
	owners = {
		"lvasion",
		"pandaphoebe6760",
		"ikDebris"
	},
	coowner = {
		"Swipedyourcredit"
	},
	developers = {
		"ixpinkyyxi"
	},
	staff = {
		"Khine2011",
		"1can3uss"
	}
}

local function findList(list, name)
	for _, v in ipairs(list) do
		if v == name then
			return true
		end
	end
	return false
end

local function headtagCreate(plr, fromHost)
	local char = plr.Character or plr.CharacterAdded:Wait()

	if char then
		local kiExe_OH = Instance.new("BillboardGui")
		local OwnerTag = Instance.new("Frame")
		local TagContent = Instance.new("TextLabel")
		local UICorner = Instance.new("UICorner")
		local UIPadding = Instance.new("UIPadding")
		local UIPadding_2 = Instance.new("UIPadding")
		local UICorner_2 = Instance.new("UICorner")
		local UIListLayout = Instance.new("UIListLayout")
		local DeveloperTag = Instance.new("Frame")
		local TagContent_2 = Instance.new("TextLabel")
		local UICorner_3 = Instance.new("UICorner")
		local UIPadding_3 = Instance.new("UIPadding")
		local UIPadding_4 = Instance.new("UIPadding")
		local UICorner_4 = Instance.new("UICorner")
		local CoOwnerTag = Instance.new("Frame")
		local TagContent_3 = Instance.new("TextLabel")
		local UICorner_5 = Instance.new("UICorner")
		local UIPadding_5 = Instance.new("UIPadding")
		local UIPadding_6 = Instance.new("UIPadding")
		local UICorner_6 = Instance.new("UICorner")
		local UserTag = Instance.new("Frame")
		local TagContent_4 = Instance.new("TextLabel")
		local UICorner_7 = Instance.new("UICorner")
		local UIPadding_7 = Instance.new("UIPadding")
		local UIPadding_8 = Instance.new("UIPadding")
		local UICorner_8 = Instance.new("UICorner")
		local StaffTag = Instance.new("Frame")
		local TagContent_5 = Instance.new("TextLabel")
		local UICorner_9 = Instance.new("UICorner")
		local UIPadding_9 = Instance.new("UIPadding")
		local UIPadding_10 = Instance.new("UIPadding")
		local UICorner_10 = Instance.new("UICorner")

		kiExe_OH.Name = "kiExe_OH"
		kiExe_OH.Parent = char.Head
		kiExe_OH.Active = true
		kiExe_OH.Size = UDim2.new(3, 0, 0.5, 0)
		kiExe_OH.StudsOffset = Vector3.new(0, 2, 0)

		OwnerTag.Name = "OwnerTag"
		OwnerTag.Parent = kiExe_OH
		OwnerTag.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
		OwnerTag.BorderColor3 = Color3.fromRGB(31, 31, 31)
		OwnerTag.BorderSizePixel = 5
		OwnerTag.Position = UDim2.new(0.100000001, 0, 0, 0)
		OwnerTag.Size = UDim2.new(1, 0, 1, 0)
		OwnerTag.Visible = false
		OwnerTag.ZIndex = 2

		TagContent.Name = "TagContent"
		TagContent.Parent = OwnerTag
		TagContent.Active = true
		TagContent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		TagContent.BorderColor3 = Color3.fromRGB(0, 255, 0)
		TagContent.BorderSizePixel = 0
		TagContent.Size = UDim2.new(1, 0, 1, 0)
		TagContent.ZIndex = 2
		TagContent.Font = Enum.Font.Unknown
		TagContent.Text = "Owner"
		TagContent.TextColor3 = Color3.fromRGB(85, 170, 255)
		TagContent.TextScaled = true
		TagContent.TextSize = 28.000
		TagContent.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		TagContent.TextWrapped = true

		UICorner.CornerRadius = UDim.new(0.200000003, 0)
		UICorner.Parent = TagContent

		UIPadding.Parent = TagContent
		UIPadding.PaddingBottom = UDim.new(0.150000006, 0)
		UIPadding.PaddingTop = UDim.new(0.150000006, 0)

		UIPadding_2.Parent = OwnerTag
		UIPadding_2.PaddingBottom = UDim.new(0.0799999982, 0)
		UIPadding_2.PaddingLeft = UDim.new(0.0149999997, 0)
		UIPadding_2.PaddingRight = UDim.new(0.0149999997, 0)
		UIPadding_2.PaddingTop = UDim.new(0.0799999982, 0)

		UICorner_2.CornerRadius = UDim.new(0.200000003, 0)
		UICorner_2.Parent = OwnerTag

		UIListLayout.Parent = kiExe_OH
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

		DeveloperTag.Name = "DeveloperTag"
		DeveloperTag.Parent = kiExe_OH
		DeveloperTag.BackgroundColor3 = Color3.fromRGB(255, 255, 127)
		DeveloperTag.BorderColor3 = Color3.fromRGB(31, 31, 31)
		DeveloperTag.BorderSizePixel = 5
		DeveloperTag.Position = UDim2.new(0.100000001, 0, 0, 0)
		DeveloperTag.Size = UDim2.new(1, 0, 1, 0)
		DeveloperTag.Visible = false
		DeveloperTag.ZIndex = 2

		TagContent_2.Name = "TagContent"
		TagContent_2.Parent = DeveloperTag
		TagContent_2.Active = true
		TagContent_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		TagContent_2.BorderColor3 = Color3.fromRGB(0, 255, 0)
		TagContent_2.BorderSizePixel = 0
		TagContent_2.Size = UDim2.new(1, 0, 1, 0)
		TagContent_2.ZIndex = 2
		TagContent_2.Font = Enum.Font.Unknown
		TagContent_2.Text = "Developer"
		TagContent_2.TextColor3 = Color3.fromRGB(255, 255, 127)
		TagContent_2.TextScaled = true
		TagContent_2.TextSize = 28.000
		TagContent_2.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		TagContent_2.TextWrapped = true

		UICorner_3.CornerRadius = UDim.new(0.200000003, 0)
		UICorner_3.Parent = TagContent_2

		UIPadding_3.Parent = TagContent_2
		UIPadding_3.PaddingBottom = UDim.new(0.150000006, 0)
		UIPadding_3.PaddingTop = UDim.new(0.150000006, 0)

		UIPadding_4.Parent = DeveloperTag
		UIPadding_4.PaddingBottom = UDim.new(0.0799999982, 0)
		UIPadding_4.PaddingLeft = UDim.new(0.0149999997, 0)
		UIPadding_4.PaddingRight = UDim.new(0.0149999997, 0)
		UIPadding_4.PaddingTop = UDim.new(0.0799999982, 0)

		UICorner_4.CornerRadius = UDim.new(0.200000003, 0)
		UICorner_4.Parent = DeveloperTag

		CoOwnerTag.Name = "CoOwnerTag"
		CoOwnerTag.Parent = kiExe_OH
		CoOwnerTag.BackgroundColor3 = Color3.fromRGB(255, 85, 127)
		CoOwnerTag.BorderColor3 = Color3.fromRGB(31, 31, 31)
		CoOwnerTag.BorderSizePixel = 5
		CoOwnerTag.Position = UDim2.new(0.100000001, 0, 0, 0)
		CoOwnerTag.Size = UDim2.new(1, 0, 1, 0)
		CoOwnerTag.Visible = false
		CoOwnerTag.ZIndex = 2

		TagContent_3.Name = "TagContent"
		TagContent_3.Parent = CoOwnerTag
		TagContent_3.Active = true
		TagContent_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		TagContent_3.BorderColor3 = Color3.fromRGB(0, 255, 0)
		TagContent_3.BorderSizePixel = 0
		TagContent_3.Size = UDim2.new(1, 0, 1, 0)
		TagContent_3.ZIndex = 2
		TagContent_3.Font = Enum.Font.Unknown
		TagContent_3.Text = "Co-Owner"
		TagContent_3.TextColor3 = Color3.fromRGB(255, 85, 127)
		TagContent_3.TextScaled = true
		TagContent_3.TextSize = 28.000
		TagContent_3.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		TagContent_3.TextWrapped = true

		UICorner_5.CornerRadius = UDim.new(0.200000003, 0)
		UICorner_5.Parent = TagContent_3

		UIPadding_5.Parent = TagContent_3
		UIPadding_5.PaddingBottom = UDim.new(0.150000006, 0)
		UIPadding_5.PaddingTop = UDim.new(0.150000006, 0)

		UIPadding_6.Parent = CoOwnerTag
		UIPadding_6.PaddingBottom = UDim.new(0.0799999982, 0)
		UIPadding_6.PaddingLeft = UDim.new(0.0149999997, 0)
		UIPadding_6.PaddingRight = UDim.new(0.0149999997, 0)
		UIPadding_6.PaddingTop = UDim.new(0.0799999982, 0)

		UICorner_6.CornerRadius = UDim.new(0.200000003, 0)
		UICorner_6.Parent = CoOwnerTag

		UserTag.Name = "UserTag"
		UserTag.Parent = kiExe_OH
		UserTag.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
		UserTag.BorderColor3 = Color3.fromRGB(31, 31, 31)
		UserTag.BorderSizePixel = 5
		UserTag.Position = UDim2.new(0.100000001, 0, 0, 0)
		UserTag.Size = UDim2.new(1, 0, 1, 0)
		UserTag.Visible = false
		UserTag.ZIndex = 2

		TagContent_4.Name = "TagContent"
		TagContent_4.Parent = UserTag
		TagContent_4.Active = true
		TagContent_4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		TagContent_4.BorderColor3 = Color3.fromRGB(0, 255, 0)
		TagContent_4.BorderSizePixel = 0
		TagContent_4.Size = UDim2.new(1, 0, 1, 0)
		TagContent_4.ZIndex = 2
		TagContent_4.Font = Enum.Font.Unknown
		TagContent_4.Text = "kiExe User"
		TagContent_4.TextColor3 = Color3.fromRGB(255, 170, 0)
		TagContent_4.TextScaled = true
		TagContent_4.TextSize = 28.000
		TagContent_4.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		TagContent_4.TextWrapped = true

		UICorner_7.CornerRadius = UDim.new(0.200000003, 0)
		UICorner_7.Parent = TagContent_4

		UIPadding_7.Parent = TagContent_4
		UIPadding_7.PaddingBottom = UDim.new(0.150000006, 0)
		UIPadding_7.PaddingTop = UDim.new(0.150000006, 0)

		UIPadding_8.Parent = UserTag
		UIPadding_8.PaddingBottom = UDim.new(0.0799999982, 0)
		UIPadding_8.PaddingLeft = UDim.new(0.0149999997, 0)
		UIPadding_8.PaddingRight = UDim.new(0.0149999997, 0)
		UIPadding_8.PaddingTop = UDim.new(0.0799999982, 0)

		UICorner_8.CornerRadius = UDim.new(0.200000003, 0)
		UICorner_8.Parent = UserTag

		StaffTag.Name = "StaffTag"
		StaffTag.Parent = kiExe_OH
		StaffTag.BackgroundColor3 = Color3.fromRGB(85, 255, 255)
		StaffTag.BorderColor3 = Color3.fromRGB(31, 31, 31)
		StaffTag.BorderSizePixel = 5
		StaffTag.Position = UDim2.new(0.100000001, 0, 0, 0)
		StaffTag.Size = UDim2.new(1, 0, 1, 0)
		StaffTag.Visible = false
		StaffTag.ZIndex = 2

		TagContent_5.Name = "TagContent"
		TagContent_5.Parent = StaffTag
		TagContent_5.Active = true
		TagContent_5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		TagContent_5.BorderColor3 = Color3.fromRGB(0, 255, 0)
		TagContent_5.BorderSizePixel = 0
		TagContent_5.Size = UDim2.new(1, 0, 1, 0)
		TagContent_5.ZIndex = 2
		TagContent_5.Font = Enum.Font.Unknown
		TagContent_5.Text = "Staff Member"
		TagContent_5.TextColor3 = Color3.fromRGB(85, 255, 255)
		TagContent_5.TextScaled = true
		TagContent_5.TextSize = 28.000
		TagContent_5.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		TagContent_5.TextWrapped = true

		UICorner_9.CornerRadius = UDim.new(0.200000003, 0)
		UICorner_9.Parent = TagContent_5

		UIPadding_9.Parent = TagContent_5
		UIPadding_9.PaddingBottom = UDim.new(0.150000006, 0)
		UIPadding_9.PaddingTop = UDim.new(0.150000006, 0)

		UIPadding_10.Parent = StaffTag
		UIPadding_10.PaddingBottom = UDim.new(0.0799999982, 0)
		UIPadding_10.PaddingLeft = UDim.new(0.0149999997, 0)
		UIPadding_10.PaddingRight = UDim.new(0.0149999997, 0)
		UIPadding_10.PaddingTop = UDim.new(0.0799999982, 0)

		UICorner_10.CornerRadius = UDim.new(0.200000003, 0)
		UICorner_10.Parent = StaffTag

		if findList(permissions.owners, plr.Name) then
			OwnerTag.Visible = true
		elseif findList(permissions.developers, plr.Name) then
			DeveloperTag.Visible = true
		elseif findList(permissions.staff, plr.Name) then
			StaffTag.Visible = true
		elseif findList(permissions.coowner, plr.Name) then
			CoOwnerTag.Visible = true
		else
			UserTag.Visible = false
		end
	end
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(function()
		task.wait(1)
		headtagCreate(player)
	end)

	if player.Character then
		task.spawn(function()
			task.wait(1)
			headtagCreate(player)
		end)
	end

	player.Chatted:Connect(function(message)
		if message == "kiExe()" then
			local char = player.Character or player.CharacterAdded:Wait()

			if char then
				local head = char:WaitForChild("Head")

				if head then
					local gui = head:WaitForChild("kiExe_OH")

					if gui then
						if findList(permissions.owners, player.Name) then
							gui.OwnerTag.Visible = true
						elseif findList(permissions.developers, player.Name) then
							gui.DeveloperTag.Visible = true
						elseif findList(permissions.staff, player.Name) then
							gui.StaffTag.Visible = true
						elseif findList(permissions.coowner, player.Name) then
							gui.CoOwnerTag.Visible = true
						else
							gui.UserTag.Visible = true
						end

					end
				end
			end
		end
	end)
end

for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
	onPlayerAdded(player)
end

game:GetService("Players").PlayerAdded:Connect(onPlayerAdded)

task.spawn(function()
	while true do
		for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
			game:GetService("Players"):Chat("kiExe()")
		end
		task.wait(60)
	end
end)

SaveManager:LoadAutoloadConfig()
