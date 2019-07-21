-----------------------------------------------------------------
-- Castlevania: Symphony of the Night Relic Tracker for Bizhawk--
-----------------------------------------------------------------
-- By TalicZealot
-----------------
require "Utilities/Serialization"
require "Utilities/UserInterface"

local settings = {
    lightweightMode = false, -- Only output to the console. Turn on if you're experiencing emulator performance issues.
    onlyTrackProgressionRelics = true,
    pixelProMode = true,
    trackerBackgroundEnabled = true,
    debugMode = false,
    drawingOffsetX = 150,
    drawingOffsetY = 40
}
deserializeToObject(settings, "config.ini")

---UI---
local guiForm = {
    mainForm = nil,
    lightweightModeCheckbox = nil,
    onlyTrackProgressionRelicsCheckbox = nil,
    pixelProModeCheckbox = nil,
    relicBox = nil
}
initForm(settings, guiForm)
forms.drawBox(guiForm.relicBox, 0, 0, 300, 340, 0xFF110011, 0xFF110011)
--------

local constants = {
    alucardCurrentXpAddress = 0x097BEC,
    gameStatus = 0x03C734,
    mapOpenAddress = 0x0974A4,
    alucardRoomsCountAddress = 0x03C760,
    secondCastleAddress = 0x1E5458,
    trackerBackgroundColor = 0xFF00FF00, -- Color format: OORRGGBB(Opacity, Red, Green, Blue)
    locationMapColorReachable = 0xFFf8f848,
    locationMapColor = 0xFF006A00,
    mapBorderColor = 0xFFC0C0C0,
    defaultComonVariables = {
        alucardModeStarted = false,
        alucardRooms = 0,
        firstCastleChecksRemaining = 21,
        secondCastleChecksRemaining = 7,
        hasFlight = false,
        hasJewelOfOpen = false,
        hasMist = false,
        hasLeapstone = false,
        hasMermanStatue = false
    }
}

local comonVariables = {
    alucardModeStarted = false,
    alucardRooms = 0,
    firstCastleChecksRemaining = 21,
    secondCastleChecksRemaining = 7,
    hasFlight = false,
    hasJewelOfOpen = false,
    hasMist = false,
    hasLeapstone = false,
    hasMermanStatue = false
}

local relics = {
    {
        name = "Soul of Bat",
        path = "images/large/SoulOfBat.png",
        status = false,
        progression = true,
        address = 0x97964
    }, {
        name = "Fire of Bat",
        path = "images/large/FireOfBat.png",
        status = false,
        progression = false,
        address = 0x97965
    }, {
        name = "Echo of Bat",
        path = "images/large/EchoOfBat.png",
        status = false,
        progression = true,
        address = 0x97966
    }, {
        name = "Force of Echo",
        path = "images/large/ForceOfEcho.png",
        status = false,
        progression = false,
        address = 0x97967
    }, {
        name = "Soul of Wolf",
        path = "images/large/SoulOfWolf.png",
        status = false,
        progression = true,
        address = 0x97968
    }, {
        name = "Power of Wolf",
        path = "images/large/PowerOfWolf.png",
        status = false,
        progression = false,
        address = 0x97969
    }, {
        name = "Skill of Wolf",
        path = "images/large/SkillOfWolf.png",
        status = false,
        progression = false,
        address = 0x9796A
    }, {
        name = "Form of Mist",
        path = "images/large/FormOfMist.png",
        status = false,
        progression = true,
        address = 0x9796B,
        requires = 4
    }, {
        name = "Power of Msit",
        path = "images/large/PowerOfMist.png",
        status = false,
        progression = true,
        address = 0x9796C
    }, {
        name = "Gas Cloud",
        path = "images/large/GasCloud.png",
        status = false,
        progression = false,
        address = 0x9796D
    }, {
        name = " Cube of Zoe",
        path = "images/large/CubeOfZoe.png",
        status = false,
        progression = false,
        address = 0x9796E
    }, {
        name = "Spirit Orb",
        path = "images/large/SpiritOrb.png",
        status = false,
        progression = false,
        address = 0x9796F
    }, {
        name = "Gravity Boots",
        path = "images/large/GravityBoots.png",
        status = false,
        progression = true,
        address = 0x97970
    }, {
        name = "Leap Stone",
        path = "images/large/LeapStone.png",
        status = false,
        progression = true,
        address = 0x97971
    }, {
        name = "Holy Symbol",
        path = "images/large/HolySymbol.png",
        status = false,
        progression = false,
        address = 0x97972
    }, {
        name = "Faerie Scroll",
        path = "images/large/FaerieScroll.png",
        status = false,
        progression = false,
        address = 0x97973
    }, {
        name = "Jewel of Open",
        path = "images/large/JewelOfOpen.png",
        status = false,
        progression = true,
        address = 0x97974
    }, {
        name = "Merman Statue",
        path = "images/large/MermanStatue.png",
        status = false,
        progression = true,
        address = 0x97975
    }, {
        name = "Bat Card",
        path = "images/large/BatCard.png",
        status = false,
        progression = false,
        address = 0x97976
    }, {
        name = "Ghost Card",
        path = "images/large/GhostCard.png",
        status = false,
        progression = false,
        address = 0x97977
    }, {
        name = "Faerie Card",
        path = "images/large/FaerieCard.png",
        status = false,
        progression = false,
        address = 0x97978
    }, {
        name = "Demon Card",
        path = "images/large/DemonCard.png",
        status = false,
        progression = false,
        address = 0x97979
    }, {
        name = "Sword Card",
        path = "images/large/SwordCard.png",
        status = false,
        progression = false,
        address = 0x9797A
    }, {
        name = "Heart of Vlad",
        path = "images/large/HeartOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797D
    }, {
        name = "Tooth of Vlad",
        path = "images/large/ToothOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797E
    }, {
        name = "Rib of Vlad",
        path = "images/large/RibOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797F
    }, {
        name = "Ring of Vlad",
        path = "images/large/RingOfVlad.png",
        status = false,
        progression = true,
        address = 0x97980
    }, {
        name = "Eye of Vlad",
        path = "images/large/EyeOfVlad.png",
        status = false,
        progression = true,
        address = 0x97981
    }
}

local progressionItems = {
    {
        name = "Gold Ring",
        path = "images/large/GoldRing.png",
        status = false,
        address = 0x097A7B
    }, {
        name = "Silver Ring",
        path = "images/large/SilverRing.png",
        status = false,
        address = 0x097A7C
    }, {
        name = "Spike Breaker",
        path = "images/large/SpikeBreaker.png",
        status = false,
        address = 0x097A41
    }, {
        name = "Holy Glasses",
        path = "images/large/HolyGlasses.png",
        status = false,
        address = 0x097A55
    }
}

local locations = {
    {
        name = "Soul of Bat",
        status = false,
        mapTiles = {{address = 0x06BCCF, values = {85}}},
        mapX = 386,
        mapY = 132,
        requires = 3
    }, {
        name = "Fire of Bat",
        status = false,
        mapTiles = {{address = 0x06BC32, values = {5, 85, 21, 189}}},
        mapX = 474,
        mapY = 52,
        requires = 1
    }, {
        name = "Echo of Bat",
        status = false,
        mapTiles = {{address = 0x06BC78, values = {85}}},
        mapX = 130,
        mapY = 92,
        requires = 1
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
        mapY = 268,
        requires = 1
    }, {
        name = "Skill of Wolf",
        status = false,
        mapTiles = {{address = 0x06BD87, values = {85, 213}}},
        mapX = 122,
        mapY = 228,
        requires = 1
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
        mapY = 36,
        requires = 1
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
        mapY = 148,
        requires = 1
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
        mapY = 292,
        requires = 6
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
        mapY = 300,
        requires = 2
    }, {
        name = "Bat Card",
        status = false,
        mapTiles = {{address = 0x06BD27, values = {84, 222}}},
        mapX = 106,
        mapY = 180,
        requires = 1
    }, {
        name = "Ghost Card",
        status = false,
        mapTiles = {{address = 0x06BBED, values = {20, 21, 69, 81, 181, 85, 17}}},
        mapX = 314,
        mapY = 20,
        requires = 1
    }, {
        name = "Faerie Card",
        status = false,
        mapTiles = {{address = 0x06BCA1, values = {84, 126, 85}}},
        mapX = 418,
        mapY = 108,
        requires = 4
    }, {
        name = "Demon Card",
        status = false,
        mapTiles = {{address = 0x06BE3B, values = {21}}},
        mapX = 234,
        mapY = 316,
        requires = 2
    }, {
        name = "Sword Card",
        status = false,
        mapTiles = {{address = 0x06BC99, values = {64}}},
        mapX = 162,
        mapY = 108,
        requires = 1
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

local function resetAllValues()
    for i = 1, 28, 1 do
        relics[i].status = false
    end
    for i = 1, 28, 1 do
        locations[i].status = false
    end
    for i = 1, 4, 1 do
        progressionItems[i].status = false
    end
    comonVariables = constants.defaultComonVariables
end

local function checkAlucardModeStart()
    local alucardXp = mainmemory.read_u8(constants.alucardCurrentXpAddress)
    if alucardXp > 0 and alucardXp < 80000 then comonVariables.alucardModeStarted = true end
end

local function outputRelics()
    local collectedRelics = "Collected Relics: \n\n "
    for i = 1, 28, 1 do
        if settings.onlyTrackProgressionRelics then
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

local function outputItems()
    local collectedItems = "Collected Progression Items: \n\n "
    for i = 1, 4, 1 do
        if progressionItems[i].status then
            if collectedItems == "" then
                collectedItems = collectedItems .. progressionItems[i].name
            else
                collectedItems = collectedItems .. ", " .. progressionItems[i].name
            end
        end
    end
    print(collectedItems)
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

local function drawRelics()
    local rows = 0
    local columns = 0
    forms.clear(guiForm.relicBox, 0xFF110011)

    for i = 1, 28, 1 do
        if settings.onlyTrackProgressionRelics then
            if relics[i].status and relics[i].progression then
                forms.drawImage(guiForm.relicBox, relics[i].path, columns * 46, rows * 46, 60, 60, true)
                columns = columns + 1
                if columns > 5 then
                    rows =  rows + 1
                    columns = 0
                end
            end
        else
            if relics[i].status then
                forms.drawImage(guiForm.relicBox, relics[i].path, columns * 46, rows * 46, 60, 60, true)
                columns = columns + 1
                if columns > 5 then
                    rows =  rows + 1
                    columns = 0
                end
            end
        end
    end

    for i = 1, 4, 1 do
        if progressionItems[i].status then
            forms.drawImage(guiForm.relicBox, progressionItems[i].path, columns * 46, rows * 46, 60, 60, true)
            columns = columns + 1
            if columns > 5 then
                rows =  rows + 1
                columns = 0
            end
        end
    end

    forms.refresh(guiForm.relicBox)
end

local function detectRelics()
    local changes = 0
    for i = 1, 28, 1 do
        if settings.onlyTrackProgressionRelics then
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

    if settings.lightweightMode == false and changes > 0 then
        if comonVariables.hasFlight == false and (relics[1].statuss or 
        (relics[8].statuss and relics[9].statuss) or 
        (relics[13].statuss and relics[14].statuss) or
        (relics[13].statuss and relics[8].statuss) or
        (relics[13].statuss and relics[5].statuss)) then
            comonVariables.hasFlight = true
        end
        if comonVariables.hasJewelOfOpen == false and relics[17].status then
            comonVariables.hasJewelOfOpen = true
        end
        if comonVariables.hasMist == false and relics[8].status then
            comonVariables.hasMist = true
        end
        if comonVariables.hasLeapstone == false and (relics[14].status or comonVariables.hasFlight) then
            comonVariables.hasLeapstone = true
        end
        if comonVariables.hasMermanStatue == false and relics[18].statusthen then
            comonVariables.hasMermanStatue = true
        end
        drawRelics()
    end

    if settings.lightweightMode and changes > 0 then
        console.clear()
        outputRelics()
        outputLocations()
    end
end

local function detectItems()
    local changes = 0
    for i = 1, 4, 1 do
        if progressionItems[i].status == false then
            if mainmemory.readbyte(progressionItems[i].address) ~= 0x00 then
                progressionItems[i].status = true
                changes = changes + 1
            end
        end
    end

    if settings.lightweightMode == false and changes > 0 then
        drawRelics()
    end

    if settings.lightweightMode and changes > 0 then
        outputItems()
    end
end

local function detectLocations()
    local changes = 0
    local debugLocations = "\n\n".. comonVariables.alucardRooms
    for i = 1, 28, 1 do
        if locations[i].status == false then
            for j = 1, #locations[i].mapTiles do
                if settings.debugMode then
                    debugLocations = debugLocations .. ("\n\n" .. locations[i].name .. " " .. locations[i].mapTiles[j].address .. " : " .. mainmemory.readbyte(locations[i].mapTiles[j].address))
                end
                if contains(locations[i].mapTiles[j].values,
                            mainmemory.readbyte(locations[i].mapTiles[j].address)) then
                    locations[i].status = true
                    changes = changes + 1
                    if i < 22 then
                        comonVariables.firstCastleChecksRemaining = comonVariables.firstCastleChecksRemaining - 1
                    else
                        comonVariables.secondCastleChecksRemaining = comonVariables.secondCastleChecksRemaining - 1
                    end
                end
            end
        end
    end

    if settings.debugMode == true then
        print(debugLocations)
    end

    if settings.lightweightMode == true and changes > 0 then
        console.clear()
        outputRelics()
        outputLocations()
    end
end

local function drawLocations()
    local scaling = 1
    local boxSize = 5

    if settings.pixelProMode == false then
        scaling = 0.5
        boxSize = 4
    elseif settings.pixelProMode == true then
        scaling = 1
        boxSize = 7
    end

    local locationColor = constants.locationMapColorReachable

    local mapCheck = memory.readbyte(constants.mapOpenAddress)
    if mapCheck == 1 and mainmemory.read_u8(constants.secondCastleAddress) == 0 then
        for i = 1, 21, 1 do
            locationColor = constants.locationMapColorReachable
            if locations[i].status == false then
                if locations[i].requires ~= nil then
                    if locations[i].requires == 1 and comonVariables.hasFlight == false then
                        locationColor = constants.locationMapColor
                    end
                    if locations[i].requires == 2 and comonVariables.hasJewelOfOpen == false then
                        locationColor = constants.locationMapColor
                    end
                    if locations[i].requires == 3 and comonVariables.hasMist == false then
                        locationColor = constants.locationMapColor
                    end
                    if locations[i].requires == 4 and comonVariables.hasLeapstone == false then
                        locationColor = constants.locationMapColor
                    end
                    if locations[i].requires == 5 and comonVariables.hasMermanStatue == false then
                        locationColor = constants.locationMapColor
                    end
                    if locations[i].requires == 6 and (comonVariables.hasJewelOfOpen == false or comonVariables.hasMermanStatue == false) then
                        locationColor = constants.locationMapColor
                    end
                end
                gui.drawBox((locations[i].mapX * scaling) + tonumber(settings.drawingOffsetX),
                            (locations[i].mapY * scaling) + tonumber(settings.drawingOffsetY),
                            (locations[i].mapX * scaling) + tonumber(settings.drawingOffsetX) + boxSize,
                            (locations[i].mapY * scaling) + tonumber(settings.drawingOffsetY) + boxSize,
                            constants.mapBorderColor, locationColor)
            end
        end
        gui.drawText(0, 0, "First Castle checks: " .. comonVariables.firstCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
        gui.drawText(0, (17 * scaling), "Second Castle checks: " .. comonVariables.secondCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
    elseif mapCheck == 1 then
        locationColor = constants.locationMapColorReachable
        for i = 22, 28, 1 do
            if locations[i].status == false then
                gui.drawBox((locations[i].mapX * scaling) + tonumber(settings.drawingOffsetX),
                            (locations[i].mapY * scaling) + tonumber(settings.drawingOffsetY),
                            (locations[i].mapX * scaling) + tonumber(settings.drawingOffsetX) + boxSize,
                            (locations[i].mapY * scaling) + tonumber(settings.drawingOffsetY) + boxSize,
                            constants.mapBorderColor, locationColor)
            end
        end
        gui.drawText(0, 0, "First Castle checks: " .. comonVariables.firstCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
        gui.drawText(0, (17 * scaling), "Second Castle checks: " .. comonVariables.secondCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
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

--close form on script exit
event.onexit(function () forms.destroy(guiForm.mainForm) end)

while true do
    --end script when the form is closed
    if forms.gettext(guiForm.mainForm) == "" then
        --update ini file settings and save data
        weiteToIni(serializeObject(settings, "settings"), "config.ini")
        return
    end

    updateSettings(settings, guiForm.lightweightModeCheckbox, guiForm.onlyTrackProgressionRelicsCheckbox, guiForm.pixelProModeCheckbox)

    if mainmemory.readbyte(constants.gameStatus) ~= 2 then
       resetAllValues()
    end

    if comonVariables.alucardModeStarted then
        if settings.lightweightMode == false then
            drawLocations()
        end
        if emu.framecount() % 120 == 0 then
             detectRelics()
             detectItems()
        end
        if mainmemory.read_u16_le(constants.alucardRoomsCountAddress) > comonVariables.alucardRooms then
            comonVariables.alucardRooms= mainmemory.read_u16_le(constants.alucardRoomsCountAddress)
            detectLocations()
        end
        if settings.debugMode then outputDebugInfo() end
    else
        if emu.framecount() > 4200 and emu.framecount() % 120 == 0 then
            checkAlucardModeStart()
        end
    end

    emu.frameadvance()
end
