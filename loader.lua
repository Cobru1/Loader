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
    1511691759,226243519,1549871163,287627733,621748832,363197636,1143823204,1144689168,1027332799,564730162,1969522752,203874179,796547030,170912625,957706991,136566977,1767381205,195218929,2225773281,436004440,103347621,583041590,3772443244,460430356,2904473027,304007441,2052679213,2401265603,329915825,141438129,177455136,3645048595,402040674,1029548891,273499275,627041507,556518622,2333662910,167194354,1457447322,608556871,131819830,2319720922,3098170487,2054576450,1343328534,135456351,3315926141,484861921,3182922154,253229867,1826049972,4505008256,183361115,1279580699,341261074,2001661490,577922417,122849514,112368463,335422678,1183087159,102854652,1453261719,1682422270,1487621735,1369295020,7525609337,171453440,375507240,342283595,1470896349,120548542,366175021,251810041,489115425,388206462,1843322806,1220374877,1220374953,1843322632,1220374793,1218479675,1843325111,1843324486,1843324847,1843324706,1843323440,1843323189,7896264844
}
local RACING_SIM_PLACEID = 105483453326837

local function findInTable(value, tbl)
	for i = 1, #tbl do
		if tbl[i] == value then
			return true
		end
	end
	return false
end

local currentPlaceId = game.PlaceId

if findInTable(currentPlaceId, FIND_MARKERS_PLACEIDS) then
	NotificationLib:Notify({
		Title = "Loader",
		Message = "Game detected: Find the Markers",
		Type = "success",
		Duration = 5
	})
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Cobru1/Find-the-markers/refs/heads/main/Find%20the%20markers.lua"))()
elseif currentPlaceId == RACING_SIM_PLACEID then
	NotificationLib:Notify({
		Title = "Loader",
		Message = "Game detected: Racing Simulator",
		Type = "success",
		Duration = 5
	})
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Cobru1/Racing-Simulator/refs/heads/main/racing%20simulator.lua"))()
else
	-- Get actual game name
	local MarketplaceService = game:GetService("MarketplaceService")
	local gameName = "Unknown game"
	pcall(function()

	    gameName = MarketplaceService:GetProductInfo(currentPlaceId).Name
	end)
	NotificationLib:Notify({
		Title = "Loader",
		Message = "Game not supported: "..gameName,
		Type = "error",
		Duration = 6
	})
end
