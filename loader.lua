-- Play a random public legacy scary sound, always works
local works = {
    "rbxassetid://911882310",  -- Horror music
    "rbxassetid://131961136",  -- Creepy laugh
    "rbxassetid://1843171198", -- Jump scare stinger
    "rbxassetid://159882598"   -- Violin hit
}
local chosenId = works[math.random(1, #works)]
local s = Instance.new("Sound")
s.SoundId = chosenId
s.Volume = 1
s.Parent = workspace
s:Play()
game:GetService("Debris"):AddItem(s, 8)

-- Loader notifications and teleporter
local NotificationLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/DemogorgonItsMe/DemoNotifications/refs/heads/main/V2/source.lua"))()
NotificationLib:SetSettings({
    position = "BottomRight",
    maxNotifications = 5,
    duration = 4,
    spacing = 10,
    fadeTime = 0.3,
    slideDistance = 20
})
NotificationLib:SetTheme({
    primaryColor = Color3.fromRGB(45, 45, 45),
    successColor = Color3.fromRGB(50, 180, 100),
    errorColor = Color3.fromRGB(220, 80, 80),
    warningColor = Color3.fromRGB(240, 180, 50),
    textColor = Color3.fromRGB(255, 255, 255),
    showStroke = false,
    useBackgroundColor = false,
    backgroundTransparency = 0.1,
    cornerRadius = UDim.new(0, 5),
    font = Enum.Font.GothamSemibold,
    background = "rbxassetid://18610728562",
    closeIcon = "rbxassetid://6031094677",
    mobileScale = 0.8
})

local FIND_MARKERS_PLACEIDS = {
    10026123355,
    8506260179,
    7896264844,
    9353059905,
    9273236872,
    8246417300,
    8954347485
}
local RACING_SIM_PLACEID = 105483453326837

local function findInTable(val, tab)
    for i=1,#tab do if tab[i]==val then return true end end
    return false
end

local placeId = game.PlaceId

if findInTable(placeId, FIND_MARKERS_PLACEIDS) then
    NotificationLib:Notify({
        Title = "🎯 Loader",
        Message = "Game detected: Find the Markers",
        Type = "success", Duration = 5
    })
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Cobru1/Find-the-markers/refs/heads/main/Find%20the%20markers.lua"))()
elseif placeId == RACING_SIM_PLACEID then
    NotificationLib:Notify({
        Title = "🏎️ Loader",
        Message = "Game detected: Racing Simulator",
        Type = "success", Duration = 5
    })
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Cobru1/Racing-Simulator/refs/heads/main/racing%20simulator.lua"))()
else
    local MarketplaceService = game:GetService("MarketplaceService")
    local gameName = "Unknown game"
    pcall(function() gameName = MarketplaceService:GetProductInfo(placeId).Name end)
    NotificationLib:Notify({
        Title = "❌ Loader",
        Message = "Game not supported: "..gameName,
        Type = "error",
        Duration = 6
    })
end
