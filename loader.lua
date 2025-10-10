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

-- Notification system: AxrexNotifier
local rawLink = "https://raw.githubusercontent.com/AxerRe/ProSite/refs/heads/main/views/AxrexNotifier.lua"
local success, NotificationLib = pcall(function()
    return loadstring(game:HttpGet(rawLink))()
end)

if success and NotificationLib then
    NotificationLib:Show("🔌 Loader", "Library loaded!", 3)

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
    local ELEMENTAL_TYCOON_PLACEID = 10253248401

    local function findInTable(val, tab)
        for i=1,#tab do if tab[i]==val then return true end end
        return false
    end

    local placeId = game.PlaceId

    if findInTable(placeId, FIND_MARKERS_PLACEIDS) then
        NotificationLib:Show("🎯 Loader", "Game detected: Find the Markers", 5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cobru1/Find-the-markers/refs/heads/main/Find%20the%20markers.lua"))()
    elseif placeId == RACING_SIM_PLACEID then
        NotificationLib:Show("🏎️ Loader", "Game detected: Racing Simulator", 5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cobru1/Racing-Simulator/refs/heads/main/racing%20simulator.lua"))()
    elseif placeId == ELEMENTAL_TYCOON_PLACEID then
        NotificationLib:Show("🌩️ Loader", "Game detected: Elemental Power Tycoon", 5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cobru1/Elemental-Power-Tycoon/refs/heads/main/Elemental%20Power%20Tycoon.lua"))()
    else
        local MarketplaceService = game:GetService("MarketplaceService")
        local gameName = "Unknown game"
        pcall(function() gameName = MarketplaceService:GetProductInfo(placeId).Name end)
        NotificationLib:Show("❌ Loader", "Game not supported: "..gameName, 6)
    end
else
    warn("Failed to load Notification from GitHub!")
end
