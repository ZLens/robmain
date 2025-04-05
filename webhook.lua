local webhookURL = "https://discord.com/api/webhooks/1358007000381788242/BxCd74Kg9DesRd7XJ0GPcCUG-0agYPsxuQeBTpqtmQtcVj-_ZmwXM9G_DhpBItXWdDIy"

local httpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

task.wait(0.2)

local currentTime = os.date("%Y-%m-%d %H:%M:%S", os.time())
local placeName = "Unknown Place"

-- Attempt to get the game's name
local success, productInfo = pcall(function()
    return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
end)

if success and productInfo and productInfo.Name then
    placeName = productInfo.Name
end

local executorName = identifyexecutor() or "Unknown"
local executorInfo = ""

-- Detect executor specifics
if executorName == "JJSploit x Xeno" then
    executorInfo = "IP/HWID Spoofer Detected"
elseif executorName == "JJSploit" then
    executorInfo = "HWID Spoofer Detected"
elseif executorName == "Xeno" then
    executorInfo = "IP/HWID Spoofer Detected"
elseif executorName == "Krnl" or executorName == "KRNL" then
    executorInfo = "IP/HWID Spoofer Detected"
end

-- Overwrites Krnl detection with "Safe Executor"
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

-- Prepare the message
local data = {
    content = "",
    embeds = {{
        title = "Version 2 Execution Details",
        color = 16711680,
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

-- Encode to JSON
local jsonEncodedData = game:GetService("HttpService"):JSONEncode(data)

-- Send to Discord webhook
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
