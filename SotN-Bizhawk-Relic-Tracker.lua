-----------------------------------------------------------------
-- Castlevania: Symphony of the Night Relic Tracker for Bizhawk--
-----------------------------------------------------------------
-- By TalicZealot
-----------------
----settings-----
-----------------
local lightweightMode = false -- Only output to the console. Turn on if you're experiencing emulator performance issues.
local onlyTrackProgressionRelics = true
local trackerBackgroundEnabled = false

local trackerBackgroundColor = 0xFF00FF00 -- Color format: OORRGGBB(Opacity, Red, Green, Blue)
local locationMapColor = 0xFF006A00
local mapBorderColor = 0xFFC0C0C0

local debugMode = false

--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
local alucardModeStarted = false
local alucardCurrentXpAddress = 0x097BEC
local mapOpenAddress = 0x0974A4
local alucardRoomsCountAddress = 0x03C760
local secondCastleAddress = 0x1E5458
local alucardRooms = 0
local drawingOffsetX = 150
local drawingOffsetY = 40
local firstCastleChecksRemaining = 21
local secondCastleChecksRemaining = 7

local relics = {
    {
        name = "Soul of Bat",
        path = "images/SoulOfBat.png",
        status = false,
        progression = true,
        address = 0x97964
    }, {
        name = "Fire of Bat",
        path = "images/FireOfBat.png",
        status = false,
        progression = false,
        address = 0x97965
    }, {
        name = "Echo of Bat",
        path = "images/EchoOfBat.png",
        status = false,
        progression = true,
        address = 0x97966
    }, {
        name = "Force of Echo",
        path = "images/ForceOfEcho.png",
        status = false,
        progression = false,
        address = 0x97967
    }, {
        name = "Soul of Wolf",
        path = "images/SoulOfWolf.png",
        status = false,
        progression = true,
        address = 0x97968
    }, {
        name = "Power of Wolf",
        path = "images/PowerOfWolf.png",
        status = false,
        progression = false,
        address = 0x97969
    }, {
        name = "Skill of Wolf",
        path = "images/SkillOfWolf.png",
        status = false,
        progression = false,
        address = 0x9796A
    }, {
        name = "Form of Mist",
        path = "images/FormOfMist.png",
        status = false,
        progression = true,
        address = 0x9796B
    }, {
        name = "Power of Msit",
        path = "images/PowerOfMist.png",
        status = false,
        progression = true,
        address = 0x9796C
    }, {
        name = "Fas Cloud",
        path = "images/GasCloud.png",
        status = false,
        progression = false,
        address = 0x9796D
    }, {
        name = " Cube of Zoe",
        path = "images/CubeOfZoe.png",
        status = false,
        progression = false,
        address = 0x9796E
    }, {
        name = "Spirit Orb",
        path = "images/SpiritOrb.png",
        status = false,
        progression = false,
        address = 0x9796F
    }, {
        name = "Gravity Boots",
        path = "images/GravityBoots.png",
        status = false,
        progression = true,
        address = 0x97970
    }, {
        name = "Leap Stone",
        path = "images/LeapStone.png",
        status = false,
        progression = true,
        address = 0x97971
    }, {
        name = "Holy Symbol",
        path = "images/HolySymbol.png",
        status = false,
        progression = false,
        address = 0x97972
    }, {
        name = "Faerie Scroll",
        path = "images/FaerieScroll.png",
        status = false,
        progression = false,
        address = 0x97973
    }, {
        name = "Jewel of Open",
        path = "images/JewelOfOpen.png",
        status = false,
        progression = true,
        address = 0x97974
    }, {
        name = "Merman Statue",
        path = "images/MermanStatue.png",
        status = false,
        progression = true,
        address = 0x97975
    }, {
        name = "Bat Card",
        path = "images/BatCard.png",
        status = false,
        progression = false,
        address = 0x97976
    }, {
        name = "Ghost Card",
        path = "images/GhostCard.png",
        status = false,
        progression = false,
        address = 0x97977
    }, {
        name = "Faerie Card",
        path = "images/FaerieCard.png",
        status = false,
        progression = false,
        address = 0x97978
    }, {
        name = "Demon Card",
        path = "images/DemonCard.png",
        status = false,
        progression = false,
        address = 0x97979
    }, {
        name = "Sword Card",
        path = "images/SwordCard.png",
        status = false,
        progression = false,
        address = 0x9797A
    }, {
        name = "Heart of Vlad",
        path = "images/HeartOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797D
    }, {
        name = "Tooth of Vlad",
        path = "images/ToothOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797E
    }, {
        name = "Rib of Vlad",
        path = "images/RibOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797F
    }, {
        name = "Ring of Vlad",
        path = "images/RingOfVlad.png",
        status = false,
        progression = true,
        address = 0x97980
    }, {
        name = "Eye of Vlad",
        path = "images/EyeOfVlad.png",
        status = false,
        progression = true,
        address = 0x97981
    }
}

local locations = {
    {
        name = "Soul of Bat",
        status = false,
        mapTiles = {{address = 0x06BCCF, values = {85}}},
        mapX = 386,
        mapY = 132
    }, {
        name = "Fire of Bat",
        status = false,
        mapTiles = {{address = 0x06BC32, values = {5, 85, 21, 189}}},
        mapX = 474,
        mapY = 52
    }, {
        name = "Echo of Bat",
        status = false,
        mapTiles = {{address = 0x06BC78, values = {85}}},
        mapX = 130,
        mapY = 92
    }, {
        name = "Soul of Wolf",
        status = false,
        mapTiles = {
            {address = 0x06BCA3, values = {80, 240}},
            {address = 0x06BC93, values = {16, 240}}
        },
        mapX = 490,
        mapY = 108
    }, {
        name = "Power of Wolf",
        status = false,
        mapTiles = {{address = 0x06BDE4, values = {1, 5}}},
        mapX = 18,
        mapY = 268
    }, {
        name = "Skill of Wolf",
        status = false,
        mapTiles = {{address = 0x06BD87, values = {85, 213}}},
        mapX = 122,
        mapY = 228
    }, {
        name = "Form of Mist",
        status = false,
        mapTiles = {{address = 0x06BCD9, values = {5, 85}}}, --5 doesnt trigger, but works on reload
        mapX = 170,
        mapY = 140
    }, {
        name = "Power of Mist",
        status = false,
        mapTiles = {{address = 0x06BC0B, values = {1, 3}}}, -- doesnt trigger, but works on reload
        mapX = 250,
        mapY = 36
    }, {
        name = "Cube of Zoe",
        status = false,
        mapTiles = {{address = 0x06BDB8, values = {1, 4, 5, 85, 255}}},
        mapX = 154,
        mapY = 252
    }, {
        name = "Spirit Orb",
        status = false,
        mapTiles = {{address = 0x06BD7A, values = {20, 21, 62}}},
        mapX = 202,
        mapY = 214
    }, {
        name = "Gravity Boots",
        status = false,
        mapTiles = {{address = 0x06BCEC, values = {4, 5, 84}}},
        mapX = 274,
        mapY = 148
    }, {
        name = "Leap Stone",
        status = false,
        mapTiles = {
            {address = 0x06BC3B, values = {1, 85, 131}},
            {address = 0x06BC2B, values = {1, 171}} ---doesnt trigger, but works on reload
        },
        mapX = 250,
        mapY = 52
    }, {
        name = "Holy Symbol",
        status = false,
        mapTiles = {{address = 0x06BE11, values = {85}}},
        mapX = 442,
        mapY = 292
    }, {
        name = "Faerie Scroll",
        status = false,
        mapTiles = {{address = 0x06BCA2, values = {21, 85, 191}}},
        mapX = 474,
        mapY = 108
    }, {
        name = "Jewel of Open",
        status = false,
        mapTiles = {{address = 0x06BCC0, values = {21, 85, 127}}},
        mapX = 394,
        mapY = 124
    }, {
        name = "Merman Statue",
        status = false,
        mapTiles = {{address = 0x06BE16, values = {85, 255}}},
        mapX = 66,
        mapY = 300
    }, {
        name = "Bat Card",
        status = false,
        mapTiles = {{address = 0x06BD27, values = {84, 222}}},
        mapX = 106,
        mapY = 180
    }, {
        name = "Ghost Card",
        status = false,
        mapTiles = {{address = 0x06BBED, values = {20, 21, 69, 81, 181, 85, 17}}},
        mapX = 314,
        mapY = 20
    }, {
        name = "Faerie Card",
        status = false,
        mapTiles = {{address = 0x06BCA1, values = {84, 126, 85}}},
        mapX = 418,
        mapY = 108
    }, {
        name = "Demon Card",
        status = false,
        mapTiles = {{address = 0x06BE3B, values = {21}}},
        mapX = 234,
        mapY = 316
    }, {
        name = "Sword Card",
        status = false,
        mapTiles = {{address = 0x06BC99, values = {64}}},
        mapX = 162,
        mapY = 108
    }, {
        name = "Heart of Vlad",
        status = false,
        mapTiles = {
            {address = 0x06C29D, values = {85}},
            {address = 0x06C29E, values = {85, 64}}
        },
        mapX = 320,
        mapY = 330
    }, {
        name = "Tooth of Vlad",
        status = false,
        mapTiles = {{address = 0x06C1F5, values = {80, 84, 85, 5, 21}}},
        mapX = 48,
        mapY = 250
    }, {
        name = "Rib of Vlad",
        status = false,
        mapTiles = {{address = 0x06C26E, values = {85}}},
        mapX = 352,
        mapY = 306
    }, {
        name = "Ring of Vlad",
        status = false,
        mapTiles = {{address = 0x06C2C9, values = {1, 5, 85}}}, -- 5 doesnt trigger, but works on reload
        mapX = 184,
        mapY = 354
    }, {
        name = "Eye of Vlad",
        status = false,
        mapTiles = {{address = 0x06C0EC, values = {21, 85}}},
        mapX = 264,
        mapY = 114
    }, {
        name = "Force of Echo",
        status = false,
        mapTiles = {{address = 0x06C0D6, values = {85}}},
        mapX = 64,
        mapY = 106
    }, {
        name = "Gas Cloud",
        status = false,
        mapTiles = {{address = 0x06C04F, values = {85}}},
        mapX = 368,
        mapY = 34
    }
}

gui.clearImageCache()

local function contains(table, val)
    for i = 1, #table do if table[i] == val then return true end end
    return false
end

local function clearConsole()
    print(
        "\n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n")
end

local function checkAlucardModeStart()
    local alucardXp = mainmemory.read_u8(alucardCurrentXpAddress)
    if alucardXp > 0 and alucardXp < 80000 then alucardModeStarted = true end
end

local function outputRelics()
    local collectedRelics = "Collected Relics: \n\n "
    for i = 1, 28, 1 do
        if onlyTrackProgressionRelics then
            if relics[i].status and relics[i].progression then
                if collectedRelics == "" then
                    collectedRelics = collectedRelics .. relics[i].name
                else
                    collectedRelics = collectedRelics .. ", " .. relics[i].name
                end
            end
        else
            if relics[i].status then
                if collectedRelics == "" then
                    collectedRelics = collectedRelics .. relics[i].name
                else
                    collectedRelics = collectedRelics .. ", " .. relics[i].name
                end
            end
        end
    end
    print(collectedRelics)
end

local function outputLocations()
    local unvisitedLocations = "Unchecked Locations: \n\n "
    for i = 1, 28, 1 do
        if locations[i].status == false then
            if unvisitedLocations == "" then
                unvisitedLocations = unvisitedLocations .. locations[i].name
            else
                unvisitedLocations = unvisitedLocations .. ", " ..
                                         locations[i].name
            end
        end
    end
    print(unvisitedLocations)
end

local function detectRelics()
    local changes = 0
    for i = 1, 28, 1 do
        if onlyTrackProgressionRelics then
            if relics[i].status == false and relics[i].progression then
                if mainmemory.readbyte(relics[i].address) ~= 0x00 then
                    relics[i].status = true
                    changes = changes + 1
                end
            end
        else
            if relics[i].status == false then
                if mainmemory.readbyte(relics[i].address) ~= 0x00 then
                    relics[i].status = true
                    changes = changes + 1
                end
            end
        end
    end

    if lightweightMode and changes > 0 then
        clearConsole()
        outputRelics()
        outputLocations()
    end
end

local function drawRelics()
    local rows = 1
    local columns = 1

    if trackerBackgroundEnabled == true then
        gui.drawBox(107, 40, 150, 295, trackerBackgroundColor,
                    trackerBackgroundColor)
    end
    for i = 1, 28, 1 do
        if onlyTrackProgressionRelics then
            if relics[i].status and relics[i].progression then
                gui.drawImage(relics[i].path, drawingOffsetX - 21 * columns,
                              20 + 21 * rows, 20, 20, true)
                rows = rows + 1
                if rows > 14 then
                    rows = 1
                    columns = 2
                end
            end
        else
            if relics[i].status then
                gui.drawImage(relics[i].path, 150 - 21 * columns,
                              20 + 21 * rows, 20, 20, true)
                rows = rows + 1
                if rows > 14 then
                    rows = 1
                    columns = 2
                end
            end
        end
    end
end

local function detectLocations()
    local changes = 0
    local debugLocations = "\n\n"..alucardRooms
    for i = 1, 28, 1 do
        if locations[i].status == false then
            for j = 1, #locations[i].mapTiles do
                if debugMode then
                    debugLocations = debugLocations .. ("\n\n" .. locations[i].name .. " " .. locations[i].mapTiles[j].address .. " : " .. mainmemory.readbyte(locations[i].mapTiles[j].address))
                end
                if contains(locations[i].mapTiles[j].values,
                            mainmemory.readbyte(locations[i].mapTiles[j].address)) then
                    locations[i].status = true
                    changes = changes + 1
                    if i < 22 then
                        firstCastleChecksRemaining = firstCastleChecksRemaining - 1
                    else
                        secondCastleChecksRemaining = secondCastleChecksRemaining - 1
                    end
                end
            end
        end
    end

    if debugMode then
        print(debugLocations)
    end
    if lightweightMode and changes > 0 then
        clearConsole()
        outputRelics()
        outputLocations()
    end
end

local function drawLocations()
    local mapCheck = memory.readbyte(mapOpenAddress)
    if mapCheck == 1 and mainmemory.read_u8(secondCastleAddress) == 0 then
        for i = 1, 21, 1 do
            if locations[i].status == false then
                gui.drawBox(locations[i].mapX + drawingOffsetX,
                            locations[i].mapY + drawingOffsetY,
                            locations[i].mapX + drawingOffsetX + 5,
                            locations[i].mapY + drawingOffsetY + 5,
                            mapBorderColor, locationMapColor)
            end
        end
        gui.drawText(drawingOffsetX, drawingOffsetY, "First Castle checks: "..firstCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000)
        gui.drawText(drawingOffsetX, drawingOffsetY + 12, "Second Castle checks: "..secondCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000)
    elseif mapCheck == 1 then
        for i = 22, 28, 1 do
            if locations[i].status == false then
                gui.drawBox(locations[i].mapX + drawingOffsetX,
                            locations[i].mapY + drawingOffsetY,
                            locations[i].mapX + drawingOffsetX + 5,
                            locations[i].mapY + drawingOffsetY + 5,
                            mapBorderColor, locationMapColor)
            end
        end
        gui.drawText(drawingOffsetX, drawingOffsetY, "First Castle checks: "..firstCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000)
        gui.drawText(drawingOffsetX, drawingOffsetY + 12, "Second Castle checks: "..secondCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000)
    end
end

local function outputDebugInfo()
    local inputs = input.get()

    if inputs["Comma"] == true and inputs["Period"] == true then
        local locationsData = "Locations: \n\n "

        for i = 1, 28, 1 do
            locationsData = locationsData .. locations[i].name
            locationsData = locationsData .. " "

            if locations[i].status then
                locationsData = locationsData .. "checked"
            else
                locationsData = locationsData .. "unchecked"
            end

            locationsData = locationsData .. "\n\n"
        end
        print(locationsData)
    end
end

while true do
    if alucardModeStarted then
        if lightweightMode == false then
            drawRelics()
            drawLocations()
        end
        if emu.framecount() % 120 == 0 then detectRelics() end
        if mainmemory.read_u16_le(alucardRoomsCountAddress) > alucardRooms then
            alucardRooms = mainmemory.read_u16_le(alucardRoomsCountAddress)
            detectLocations()
        end
        if debugMode then outputDebugInfo() end
    else
        if emu.framecount() > 4200 and emu.framecount() % 120 == 0 then
            checkAlucardModeStart()
        end
    end
    emu.frameadvance()
end
