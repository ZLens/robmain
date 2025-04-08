local OnOffKey = "G"
local ToggleKey = "M"
local Refreshkey = "`"
local Player = game:GetService("Players").LocalPlayer
local SelectedPlayer
local Functions = {}

local Toggle, OnOff, ScriptActive = false, true, true

Functions.CopyAnimations = function(target)
    for i, v in pairs(Player.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
        v:Stop()
    end
    for i, v in pairs(target.Character.Humanoid:GetPlayingAnimationTracks()) do
        local Animation = Player.Character:WaitForChild("Humanoid"):LoadAnimation(v.Animation)
        Animation:Play()
        Animation:AdjustWeight(9e9)
        Animation:AdjustSpeed(v.Speed)
        Animation.TimePosition = v.TimePosition
        spawn(function()
            v.Stopped:wait()
            Animation:Stop()
            Animation:Destroy()
        end)
    end
end

Functions.ClosePlayer = function()
    local PlayerDistance = math.huge
    local ClosePlayer

    for i, v in pairs(game:GetService("Players"):GetPlayers()) do
        local CauculatedDistance = (v.Character.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).magnitude
        if v ~= Player and CauculatedDistance < PlayerDistance then
            PlayerDistance = CauculatedDistance
            ClosePlayer = v
        end
    end
    SelectedPlayer = ClosePlayer
end

game:GetService("UserInputService").InputBegan:Connect(function(key, gameallowance)
    if ScriptActive == true and gameallowance == false then
        if key.KeyCode == Enum.KeyCode[ToggleKey] then
            if OnOff == true then
                if Toggle == false then
                    print("Toggle true")
                    Toggle = true
                    Functions.ClosePlayer()
                    print(SelectedPlayer)
                elseif Toggle == true then
                    print("Toggle false")
                    Toggle = false
                    wait()
                    for i, v in pairs(Player.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                        v:Stop()
                    end
                end
            end
        elseif key.KeyCode == Enum.KeyCode[OnOffKey] then
            if OnOff == false then
                OnOff = true
                print("Onoff true")
            elseif OnOff == true then
                OnOff = false
                Toggle = false
                print("Onoff false")
            end
        elseif key.KeyCode == Enum.KeyCode[Refreshkey] then
            if OnOff == true then
                local OldCFrame = Player.Character:WaitForChild("HumanoidRootPart").CFrame
                Player.Character.Humanoid.Health = 0
                Player.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = OldCFrame
            end
        end
    end
end)

while true do
    task.wait()
    if Toggle == true then
        Functions.CopyAnimations(SelectedPlayer)
    end
end
