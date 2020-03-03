-----------------------------------------------------------------
-- Castlevania: Symphony of the Night Relic Tracker for PSXjin--
-----------------------------------------------------------------
-- By TalicZealot
-----------------
----settings-----
-----------------
local lightweightMode = false -- Only output to the console. Turn on if you're experiencing emulator performance issues.
local onlyTrackProgressionRelics = true
local trackerBackgroundEnabled = false

local trackerBackgroundColor = "#00FF00FF" -- Color format: "#RRGGBBOO" (Red, Green, Blue, Opacity)
local locationMapColor = "#006A00FF"
local mapBorderColor = "#C0C0C0FF"

--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
require "gd"

local alucardModeStarted = false
local alucardCurrentXpAddress = 0x097BEC
local mapOpenAddress = 0x0974A4
local alucardRoomsCountAddress = 0x03C760
local secondCastleAddress = 0x1E5458
local alucardRooms = 0
local drawingOffsetX = 0
local drawingOffsetY = 20
local firstCastleChecksRemaining = 21
local secondCastleChecksRemaining = 7

local constants = {
    alucardCurrentXpAddress = 0x097BEC,
    gameStatus = 0x03C734,
    mapOpenAddress = 0x0974A4,
    alucardRoomsCountAddress = 0x03C760,
    secondCastleAddress = 0x1E5458,
    rightHandSlotAddress = 0x097C00,
    headSlotAddress = 0x097C08,
    armorSlotAddress = 0x097C0C,
    accessorySlot1Address = 0x097C14,
    accessorySlot2Address = 0x097C18,
    locationMapColorReachable = 0xFF6FD400,
    locationMapColor = 0xFF696969,
    mapBorderColor = 0xFFC0C0C0,
    cloakExteriorRaddress = 0x03CAA8,
    cloakExteriorGaddress = 0x03CAAC,
    cloakExteriorBaddress = 0x03CAB0,
    cloakLiningRaddress = 0x03CAB4,
    cloakLiningGaddress = 0x03CAB8,
    cloakLiningBaddress = 0x03CABC,
    settingsSubmenuOpenAddress = 0x03D04E,
    seedNameStartAddress = 0x1A7840,
    thrustWeaponImagePath = "images/large/ObsidianSword.png"
}

local relics = {
    {
        name = "Soul of Bat",
        image = gd.createFromPng("images/SoulOfBat.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97964
    }, {
        name = "Fire of Bat",
        image = gd.createFromPng("images/FireOfBat.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97965
    }, {
        name = "Echo of Bat",
        image = gd.createFromPng("images/EchoOfBat.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97966
    }, {
        name = "Force of Echo",
        image = gd.createFromPng("images/ForceOfEcho.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97967
    }, {
        name = "Soul of Wolf",
        image = gd.createFromPng("images/SoulOfWolf.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97968
    }, {
        name = "Power of Wolf",
        image = gd.createFromPng("images/PowerOfWolf.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97969
    }, {
        name = "Skill of Wolf",
        image = gd.createFromPng("images/SkillOfWolf.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x9796A
    }, {
        name = "Form of Mist",
        image = gd.createFromPng("images/FormOfMist.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x9796B
    }, {
        name = "Power of Mist",
        image = gd.createFromPng("images/PowerOfMist.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x9796C
    }, {
        name = "Gas Cloud",
        image = gd.createFromPng("images/GasCloud.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x9796D
    }, {
        name = "Cube of Zoe",
        image = gd.createFromPng("images/CubeOfZoe.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x9796E
    }, {
        name = "Spirit Orb",
        image = gd.createFromPng("images/SpiritOrb.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x9796F
    }, {
        name = "Gravity Boots",
        image = gd.createFromPng("images/GravityBoots.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97970
    }, {
        name = "Leap Stone",
        image = gd.createFromPng("images/LeapStone.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97971
    }, {
        name = "Holy Symbol",
        image = gd.createFromPng("images/HolySymbol.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97972
    }, {
        name = "Faerie Scroll",
        image = gd.createFromPng("images/FaerieScroll.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97973
    }, {
        name = "Jewel of Open",
        image = gd.createFromPng("images/JewelOfOpen.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97974
    }, {
        name = "Merman Statue",
        image = gd.createFromPng("images/MermanStatue.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97975
    }, {
        name = "Bat Card",
        image = gd.createFromPng("images/BatCard.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97976
    }, {
        name = "Ghost Card",
        image = gd.createFromPng("images/GhostCard.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97977
    }, {
        name = "Faerie Card",
        image = gd.createFromPng("images/FaerieCard.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97978
    }, {
        name = "Demon Card",
        image = gd.createFromPng("images/DemonCard.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97979
    }, {
        name = "Sword Card",
        image = gd.createFromPng("images/SwordCard.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x9797A
    }, {
        name = "Heart of Vlad",
        image = gd.createFromPng("images/HeartOfVlad.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x9797D
    }, {
        name = "Tooth of Vlad",
        image = gd.createFromPng("images/ToothOfVlad.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x9797E
    }, {
        name = "Rib of Vlad",
        image = gd.createFromPng("images/RibOfVlad.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x9797F
    }, {
        name = "Ring of Vlad",
        image = gd.createFromPng("images/RingOfVlad.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97980
    }, {
        name = "Eye of Vlad",
        image = gd.createFromPng("images/EyeOfVlad.png"):gdStr(),
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
        mapTiles = {{address = 0x06BCD9, values = {5, 85}}},
        mapX = 170,
        mapY = 140
    }, {
        name = "Power of Mist",
        status = false,
        mapTiles = {
            {address = 0x06BC0B, values = {1, 3}},
            {address = 0x06BC1B, values = {1}}
        }, -- doesnt trigger, but works on reload
        mapX = 250,
        mapY = 36
    }, {
        name = "Cube of Zoe",
        status = false,
        mapTiles = {{address = 0x06BDB8, values = {1, 4, 5, 84, 85, 255}}},
        mapX = 154,
        mapY = 252
    }, {
        name = "Spirit Orb",
        status = false,
        mapTiles = {
            {address = 0x06BD7A, values = {20, 21, 62}},
            {address = 0x06BD6A, values = {20, 16}}
        },
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
        mapTiles = {{address = 0x06BD27, values = {80, 84, 85, 222}}},
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

local function contains(table, val)
    for i = 1, #table do if table[i] == val then return true end end
    return false
end

local function clearConsole()
    print(
        "\n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n")
end

local function setcloakColor()
    local rand1 = math.random(0, 220)
    memory.writebyte(constants.cloakExteriorRaddress, rand1)
    local rand2 = math.random(0, 220)
    memory.writebyte(constants.cloakExteriorGaddress, rand2)
    local rand3 = math.random(0, 220)
    memory.writebyte(constants.cloakExteriorBaddress, rand3)
    local rand4 = math.random(0, 220)
    memory.writebyte(constants.cloakLiningRaddress, rand4)
    local rand5 = math.random(0, 220)
    memory.writebyte(constants.cloakLiningGaddress, rand5)
    local rand6 = math.random(0, 220)
    memory.writebyte(constants.cloakLiningBaddress, rand6)
end

local function checkAlucardModeStart()
    local alucardXp = memory.readbyte(alucardCurrentXpAddress)
    if alucardXp > 0 and alucardXp < 80000 then
         alucardModeStarted = true
         setcloakColor()
    end
end

local function outputRelics()
    local collectedRelics = "Collected Relics: \n "
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
    local unvisitedLocations = "Unchecked Locations: \n "
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
                if memory.readbyte(relics[i].address) ~= 0x00 then
                    relics[i].status = true
                    changes = changes + 1
                end
            end
        else
            if relics[i].status == false then
                if memory.readbyte(relics[i].address) ~= 0x00 then
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
    local relicsPerRow = 1
    local rows = 0

    if trackerBackgroundEnabled == true then
        gui.box(0, 0, 256, 20, trackerBackgroundColor, trackerBackgroundColor)
    end
    for i = 1, 28, 1 do
        if onlyTrackProgressionRelics then
            if relics[i].status and relics[i].progression then
                gui.gdoverlay(13 * (relicsPerRow - 1) + (rows * 130), rows * 14,
                              relics[i].image, 1.0)
                relicsPerRow = relicsPerRow + 1
                if relicsPerRow > 19 then
                    relicsPerRow = 1
                    rows = 1
                end
            end
        else
            if relics[i].status then
                gui.gdoverlay(13 * (relicsPerRow - 1) + (rows * 130), rows * 20,
                              relics[i].image, 1.0)
                relicsPerRow = relicsPerRow + 1
                if relicsPerRow > 19 then
                    relicsPerRow = 1
                    rows = 1
                end
            end
        end
    end
end

local function detectLocations()
    local changes = 0
    for i = 1, 28, 1 do
        if locations[i].status == false then
            for j = 1, #locations[i].mapTiles do
                if contains(locations[i].mapTiles[j].values,
                            memory.readbyte(locations[i].mapTiles[j].address)) then
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

    if lightweightMode and changes > 0 then
        clearConsole()
        outputRelics()
        outputLocations()
    end
end

local function drawLocations()
    local mapCheck = memory.readbyte(mapOpenAddress)
    if mapCheck == 1 and memory.readword(secondCastleAddress) == 0 then
        for i = 1, 21, 1 do
            if locations[i].status == false then
                gui.box(locations[i].mapX / 2 + drawingOffsetX,
                        locations[i].mapY / 2 + drawingOffsetY,
                        locations[i].mapX / 2 + drawingOffsetX + 3,
                        locations[i].mapY / 2 + drawingOffsetY + 3,
                        locationMapColor, mapBorderColor)
            end
        end
        gui.text(drawingOffsetX, drawingOffsetY, "First Castle checks: "..firstCastleChecksRemaining)
        gui.text(drawingOffsetX, drawingOffsetY + 12, "Second Castle checks: "..secondCastleChecksRemaining)
    elseif mapCheck == 1 then
        for i = 22, 28, 1 do
            if locations[i].status == false then
                gui.box(locations[i].mapX / 2 + drawingOffsetX,
                        locations[i].mapY / 2 + drawingOffsetY,
                        locations[i].mapX / 2 + drawingOffsetX + 3,
                        locations[i].mapY / 2 + drawingOffsetY + 3,
                        locationMapColor, mapBorderColor)
            end
        end
        gui.text(drawingOffsetX, drawingOffsetY, "First Castle checks: "..firstCastleChecksRemaining)
        gui.text(drawingOffsetX, drawingOffsetY + 12, "Second Castle checks: "..secondCastleChecksRemaining)
    end
end

gui.register(function()
    if alucardModeStarted then
        if lightweightMode == false then
            drawRelics()
            drawLocations()
        end
        if emu.framecount() % 120 == 0 then detectRelics() end
        if memory.readword(alucardRoomsCountAddress) > alucardRooms then
            alucardRooms = memory.readword(alucardRoomsCountAddress)
            detectLocations()
        end
    else
        if emu.framecount() > 4200 and emu.framecount() % 120 == 0 then
            checkAlucardModeStart()
        end
    end
end)
