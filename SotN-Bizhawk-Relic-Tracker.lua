-----------------------------------------------------------------
-- Castlevania: Symphony of the Night Relic Tracker for Bizhawk--
-----------------------------------------------------------------
-- By TalicZealot
-----------------
require "Utilities/Serialization"
require "Utilities/UserInterface"

local settings = {
    lightweightMode = false,
    randomCloakColor = true,
    customCloakColor = false,
    onlyTrackProgressionRelics = true,
    pixelProMode = true,
    extendedLocations = true,
    debugMode = false,
    drawingOffsetX = 147,
    drawingOffsetY = 38,
    cloakExteriorR = 0,
    cloakExteriorG = 0,
    cloakExteriorB = 0,
    cloakLiningR = 0,
    cloakLiningG = 0,
    cloakLiningB = 0
}
deserializeToObject(settings, "config.ini")

---UI---
local guiForm = {
    mainForm = nil,
    cloakColorCheckbox = nil,
    onlyTrackProgressionRelicsCheckbox = nil,
    pixelProModeCheckbox = nil,
    extendedLocationsCheckbox = nil,
    relicBox = nil
}
initForm(settings, guiForm)
forms.drawBox(guiForm.relicBox, 0, 0, 320, 374, 0xFF110011, 0xFF110011)
--------

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

local characterMap = {
    [0x43] = ',',
    [0x44] = '.',
    [0x46] = ':',
    [0x47] = ';',
    [0x48] = '?',
    [0x49] = '!',
    [0x4d] = '`',
    [0x4e] = '"',
    [0x4f] = '^',
    [0x51] = '_',
    [0x60] = '~',
    [0x66] = '\'',
    [0x69] = '(',
    [0x6a] = ')',
    [0x6d] = '[',
    [0x6e] = ']',
    [0x6f] = '{',
    [0x70] = '}',
    [0x7b] = '+',
    [0x7c] = '-'
}

local commonVariables = {
    alucardModeStarted = false,
    gameInMainMenu = false,
    gameReset = false,
    alucardRooms = 0,
    allDracRelics = false,
    hasThrustWeapon = false
}

local imagesCached = false

local seedName = ""

local relics = {
    {   --1
        name = "Soul of Bat",
        path = "images/large/SoulOfBat.png",
        status = false,
        progression = true,
        address = 0x97964
    }, {--2
        name = "Fire of Bat",
        path = "images/large/FireOfBat.png",
        status = false,
        progression = false,
        address = 0x97965
    }, {--3
        name = "Echo of Bat",
        path = "images/large/EchoOfBat.png",
        status = false,
        progression = true,
        address = 0x97966
    }, {--4
        name = "Force of Echo",
        path = "images/large/ForceOfEcho.png",
        status = false,
        progression = false,
        address = 0x97967
    }, {--5
        name = "Soul of Wolf",
        path = "images/large/SoulOfWolf.png",
        status = false,
        progression = true,
        address = 0x97968
    }, {--6
        name = "Power of Wolf",
        path = "images/large/PowerOfWolf.png",
        status = false,
        progression = true,
        address = 0x97969
    }, {--7
        name = "Skill of Wolf",
        path = "images/large/SkillOfWolf.png",
        status = false,
        progression = false,
        address = 0x9796A
    }, {--8
        name = "Form of Mist",
        path = "images/large/FormOfMist.png",
        status = false,
        progression = true,
        address = 0x9796B,
    }, {--9
        name = "Power of Msit",
        path = "images/large/PowerOfMist.png",
        status = false,
        progression = true,
        address = 0x9796C
    }, {--10
        name = "Gas Cloud",
        path = "images/large/GasCloud.png",
        status = false,
        progression = false,
        address = 0x9796D
    }, {--11
        name = " Cube of Zoe",
        path = "images/large/CubeOfZoe.png",
        status = false,
        progression = false,
        address = 0x9796E
    }, {--12
        name = "Spirit Orb",
        path = "images/large/SpiritOrb.png",
        status = false,
        progression = false,
        address = 0x9796F
    }, {--13
        name = "Gravity Boots",
        path = "images/large/GravityBoots.png",
        status = false,
        progression = true,
        address = 0x97970
    }, {--14
        name = "Leap Stone",
        path = "images/large/LeapStone.png",
        status = false,
        progression = true,
        address = 0x97971
    }, {--15
        name = "Holy Symbol",
        path = "images/large/HolySymbol.png",
        status = false,
        progression = false,
        address = 0x97972
    }, {--16
        name = "Faerie Scroll",
        path = "images/large/FaerieScroll.png",
        status = false,
        progression = false,
        address = 0x97973
    }, {--17
        name = "Jewel of Open",
        path = "images/large/JewelOfOpen.png",
        status = false,
        progression = true,
        address = 0x97974
    }, {--18
        name = "Merman Statue",
        path = "images/large/MermanStatue.png",
        status = false,
        progression = true,
        address = 0x97975
    }, {--19
        name = "Bat Card",
        path = "images/large/BatCard.png",
        status = false,
        progression = false,
        address = 0x97976
    }, {--20
        name = "Ghost Card",
        path = "images/large/GhostCard.png",
        status = false,
        progression = false,
        address = 0x97977
    }, {--21
        name = "Faerie Card",
        path = "images/large/FaerieCard.png",
        status = false,
        progression = false,
        address = 0x97978
    }, {--22
        name = "Demon Card",
        path = "images/large/DemonCard.png",
        status = false,
        progression = false,
        address = 0x97979
    }, {--23
        name = "Sword Card",
        path = "images/large/SwordCard.png",
        status = false,
        progression = false,
        address = 0x9797A
    }, {--24
        name = "Heart of Vlad",
        path = "images/large/HeartOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797D
    }, {--25
        name = "Tooth of Vlad",
        path = "images/large/ToothOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797E
    }, {--26
        name = "Rib of Vlad",
        path = "images/large/RibOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797F
    }, {--27
        name = "Ring of Vlad",
        path = "images/large/RingOfVlad.png",
        status = false,
        progression = true,
        address = 0x97980
    }, {--28
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
        address = 0x097A7B,
        equippedValue = 72
    }, {
        name = "Silver Ring",
        path = "images/large/SilverRing.png",
        status = false,
        address = 0x097A7C,
        equippedValue = 73
    }, {
        name = "Spike Breaker",
        path = "images/large/SpikeBreaker.png",
        status = false,
        address = 0x097A41,
        equippedValue = 14
    }, {
        name = "Holy Glasses",
        path = "images/large/HolyGlasses.png",
        status = false,
        address = 0x097A55,
        equippedValue = 34
    }
}

local divekickStateItems = {
    {
        name = "Estoc",
        path = "images/large/GoldRing.png",
        status = false,
        address = 0x0979E9,
        equippedValue = 95
    }, {
        name = "Claymore",
        path = "images/large/SilverRing.png",
        status = false,
        address = 0x0979EC,
        equippedValue = 98
    }, {
        name = "Flamberge",
        path = "images/large/SpikeBreaker.png",
        status = false,
        address = 0x0979EF,
        equippedValue = 101
    }, {
        name = "Zweihander",
        path = "images/large/HolyGlasses.png",
        status = false,
        address = 0x0979F1,
        equippedValue = 103
    }, {
        name = "Obsidian Sword",
        path = "images/large/HolyGlasses.png",
        status = false,
        address = 0x0979F5,
        equippedValue = 107
    }
}

local locations = {
    {
        name = "Soul of Bat",--1
        status = false,
        mapTiles = {{address = 0x06BCCF, values = {85}}},
        mapX = 386,
        mapY = 132,
        locks = {{8}}
    }, {
        name = "Fire of Bat",--2
        status = false,
        mapTiles = {{address = 0x06BC32, values = {5, 85, 21, 189}}},
        mapX = 474,
        mapY = 52,
        locks = {{1}, {13, 5}, {13, 8}, {13, 14}, {13, 29}, {8, 9}}
    }, {
        name = "Echo of Bat",--3
        status = false,
        mapTiles = {{address = 0x06BC78, values = {85}}},
        mapX = 130,
        mapY = 92,
        locks = {{1}, {13, 5}, {13, 8}, {8, 9}}
    }, {
        name = "Soul of Wolf",--4
        status = false,
        mapTiles = {
            {address = 0x06BCA3, values = {80, 240}},
            {address = 0x06BC93, values = {16, 240}}
        },
        mapX = 490,
        mapY = 108,
        reachable = true
    }, {
        name = "Power of Wolf",--5
        status = false,
        mapTiles = {{address = 0x06BDE4, values = {1, 5}}},
        mapX = 18,
        mapY = 268,
        locks = {{1}, {13, 5}, {13, 8}, {13, 14}, {13, 29}, {8, 9}}
    }, {
        name = "Skill of Wolf",--6
        status = false,
        mapTiles = {{address = 0x06BD87, values = {85, 213}}},
        mapX = 122,
        mapY = 228,
        locks = {{1}, {13}, {8, 9}}
    }, {
        name = "Form of Mist",--7
        status = false,
        mapTiles = {{address = 0x06BCD9, values = {5, 85}}},
        mapX = 170,
        mapY = 140,
        locks = {{1}, {5}, {8}, {13}, {14}, {29}}
    }, {
        name = "Power of Mist",--8
        status = false,
        mapTiles = {
            {address = 0x06BC0B, values = {1, 3}},
            {address = 0x06BC1B, values = {1}}
        },
        mapX = 250,
        mapY = 36,
        locks = {{1}, {13, 5}, {13, 8}, {13, 14}, {13, 29}, {8, 9}}
    }, {
        name = "Cube of Zoe",--9
        status = false,
        mapTiles = {{address = 0x06BDB8, values = {1, 4, 5, 85, 84, 255}}},
        mapX = 154,
        mapY = 252,
        reachable = true
    }, {
        name = "Spirit Orb",--10
        status = false,
        mapTiles = {
            {address = 0x06BD7A, values = {20, 21, 62}},
            {address = 0x06BD6A, values = {20, 16}}
        },
        mapX = 202,
        mapY = 214,
        reachable = true
    }, {
        name = "Gravity Boots",--11
        status = false,
        mapTiles = {{address = 0x06BCEC, values = {4, 5, 84}}},--note
        mapX = 274,
        mapY = 148,
        locks = {{1}, {13, 5}, {13, 8}, {13, 14}, {13, 29}, {8, 9}}
    }, {
        name = "Leap Stone",--12
        status = false,
        mapTiles = {
            {address = 0x06BC3B, values = {1, 85, 131}},
            {address = 0x06BC2B, values = {1, 171}} ---doesnt trigger, but works on reload
        },
        mapX = 250,
        mapY = 52,
        locks = {{17}, {1}, {5}, {8}, {13}, {14}, {29}}
    }, {
        name = "Holy Symbol",--13
        status = false,
        mapTiles = {{address = 0x06BE11, values = {85}}},
        mapX = 442,
        mapY = 292,
        locks = {{17, 18}}
    }, {
        name = "Faerie Scroll",--14
        status = false,
        mapTiles = {{address = 0x06BCA2, values = {21, 85, 191}}},
        mapX = 474,
        mapY = 108,
        reachable = true
    }, {
        name = "Jewel of Open",--15
        status = false,
        mapTiles = {{address = 0x06BCC0, values = {21, 85, 127}}},
        mapX = 394,
        mapY = 124,
        reachable = true
    }, {
        name = "Merman Statue",--16
        status = false,
        mapTiles = {{address = 0x06BE16, values = {85, 255}}},
        mapX = 66,
        mapY = 300,
        locks = {{17}}
    }, {
        name = "Bat Card",--17
        status = false,
        mapTiles = {{address = 0x06BD27, values = {80, 84, 85, 222}}},
        mapX = 106,
        mapY = 180,
        locks = {{1}, {13}, {8, 9}}
    }, {
        name = "Ghost Card",--18
        status = false,
        mapTiles = {{address = 0x06BBED, values = {20, 21, 69, 81, 181, 85, 17}}},
        mapX = 314,
        mapY = 20,
        locks = {{1}, {13, 5}, {13, 8}, {13, 14}, {13, 29}, {8, 9}}
    }, {
        name = "Faerie Card",--19
        status = false,
        mapTiles = {{address = 0x06BCA1, values = {84, 126, 85}}},
        mapX = 418,
        mapY = 108,
        locks = {{1}, {5}, {8}, {13}, {14}, {29}}
    }, {
        name = "Demon Card",--20
        status = false,
        mapTiles = {{address = 0x06BE3B, values = {21}}},
        mapX = 234,
        mapY = 316,
        locks = {{17, 1}, {17, 14},  {17, 13, 5},  {17, 13, 8},  {17, 13, 29}, {17, 8, 9}, {17, 5, 6}}
    }, {
        name = "Sword Card",--21
        status = false,
        mapTiles = {{address = 0x06BC99, values = {64}}},
        mapX = 162,
        mapY = 108,
        locks = {{1}, {13, 5}, {13, 8}, {13, 14}, {13, 29}, {8, 9}}
    }, {
        name = "Crystal Cloak",--22
        status = false,
        mapTiles = {{address = 0x06BDDE, values = {85}}},
        mapX = 322,
        mapY = 268,
        locks = {{17}}
    }, {
        name = "Mormegil",--23
        status = false,
        mapTiles = {{address = 0x06BE98, values = {81, 85}}},
        mapX = 138,
        mapY = 364,
        locks = {{17, 1}, {17, 14},  {17, 13, 5},  {17, 13, 8},  {17, 13, 29}, {17, 8, 9}, {17, 5, 6}}
    }, {
        name = "Gold Ring",--24
        status = false,
        mapTiles = {{address = 0x06BD8F, values = {80}}},
        mapX = 362,
        mapY = 228,
        locks = {{17, 1}, {17, 14},  {17, 13, 5},  {17, 13, 8},  {17, 13, 29}, {17, 8, 9}, {17, 5, 6}, {17, 4, 7}, {17, 7, 8}, {17, 4, 12}}
    },
    {
        name = "Spikebreaker",--25
        status = false,
        mapTiles = {{address = 0x06BEAE, values = {21}}},
        mapX = 330,
        mapY = 372,
        locks = {{17, 1}, {17, 7, 8}}
    },
    {
        name = "Silver Ring",--26
        status = false,
        mapTiles = {{address = 0x06BC66, values = {21, 85}}},
        mapX = 68,
        mapY = 84,
        locks = {{30, 8}}
    },
    {
        name = "Holy Glasses",--27
        status = false,
        mapTiles = {{address = 0x06BD6C, values = {64, 80}}},
        mapX = 258,
        mapY = 212,
        locks = {{31}}
    }, {
        name = "Heart of Vlad",--28
        status = false,
        mapTiles = {
            {address = 0x06C29D, values = {85}},
            {address = 0x06C29E, values = {85, 64}}
        },
        mapX = 320,
        mapY = 330,
        reachable = true
    }, {
        name = "Tooth of Vlad",--29
        status = false,
        mapTiles = {{address = 0x06C1F5, values = {80, 84, 85, 5, 21}}},
        mapX = 48,
        mapY = 250,
        reachable = true
    }, {
        name = "Rib of Vlad",--30
        status = false,
        mapTiles = {{address = 0x06C26E, values = {85}}},
        mapX = 352,
        mapY = 306,
        reachable = true
    }, {
        name = "Ring of Vlad",--31
        status = false,
        mapTiles = {{address = 0x06C2C9, values = {1, 5, 85}}}, -- 5 doesnt trigger, but works on reload
        mapX = 184,
        mapY = 354,
        reachable = true
    }, {
        name = "Eye of Vlad",--32
        status = false,
        mapTiles = {{address = 0x06C0EC, values = {21, 85}}},
        mapX = 264,
        mapY = 114,
        reachable = true
    }, {
        name = "Force of Echo",--33
        status = false,
        mapTiles = {{address = 0x06C0D6, values = {85}}},
        mapX = 64,
        mapY = 106,
        reachable = true
    }, {
        name = "Gas Cloud",--34
        status = false,
        mapTiles = {{address = 0x06C04F, values = {85}}},
        mapX = 368,
        mapY = 34,
        reachable = true
    }, {
        name = "Ring of Arcana",--35
        status = false,
        mapTiles = {{address = 0x06C1C0, values = {5, 21}}},
        mapX = 400,
        mapY = 218,
        reachable = true
    }, {
        name = "Dark Blade",--36
        status = false,
        mapTiles = {{address = 0x06C109, values = {85}}},
        mapX = 184,
        mapY = 130,
        reachable = true
    }
}

gui.clearImageCache()

local function setcloakColor()
    -- Initialize the pseudo random number generator
    math.randomseed( os.time() )
    math.random(); math.random(); math.random()
    --
    if settings.randomCloakColor then
        local rand1 = math.random(0, 220)
        mainmemory.writebyte(constants.cloakExteriorRaddress, rand1)
        local rand2 = math.random(0, 220)
        mainmemory.writebyte(constants.cloakExteriorGaddress, rand2)
        local rand3 = math.random(0, 220)
        mainmemory.writebyte(constants.cloakExteriorBaddress, rand3)
        local rand4 = math.random(0, 220)
        mainmemory.writebyte(constants.cloakLiningRaddress, rand4)
        local rand5 = math.random(0, 220)
        mainmemory.writebyte(constants.cloakLiningGaddress, rand5)
        local rand6 = math.random(0, 220)
        mainmemory.writebyte(constants.cloakLiningBaddress, rand6)
    elseif settings.customCloakColor then
        mainmemory.writebyte(constants.cloakExteriorRaddress, tonumber(settings.cloakExteriorR))
        mainmemory.writebyte(constants.cloakExteriorGaddress, tonumber(settings.cloakExteriorG))
        mainmemory.writebyte(constants.cloakExteriorBaddress, tonumber(settings.cloakExteriorB))
        mainmemory.writebyte(constants.cloakLiningRaddress, tonumber(settings.cloakLiningR))
        mainmemory.writebyte(constants.cloakLiningGaddress, tonumber(settings.cloakLiningG))
        mainmemory.writebyte(constants.cloakLiningBaddress, tonumber(settings.cloakLiningB))
    end
end

local function contains(table, val)
    for i = 1, #table do if table[i] == val then return true end end
    return false
end

local function resetAllValues()
    for i = 1, #relics, 1 do
        relics[i].status = false
    end
    for i = 1, #progressionItems, 1 do
        progressionItems[i].status = false
    end
    for i = 1, 27, 1 do
        if i ~= 4 and i ~= 9 and i ~= 10 and i ~= 14 and i ~= 15 then
            locations[i].reachable = false
        end
    end
    commonVariables.alucardModeStarted = false
    commonVariables.gameInMainMenu = false
    commonVariables.gameReset = false
    commonVariables.alucardRooms = 0
    commonVariables.allDracRelics = false
    commonVariables.hasThrustWeapon = false
end

local function checkAlucardModeStart()
    local alucardXp = mainmemory.read_u8(constants.alucardCurrentXpAddress)
    if alucardXp > 0 and alucardXp < 80000 then
        commonVariables.alucardModeStarted = true
        setcloakColor()
    end
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

local function cacheImages()
    local rows = 0
    local columns = 0
    forms.clear(guiForm.relicBox, 0xFF110011)

    for i = 1, 23, 1 do
        if columns > 5 then
            rows =  rows + 1
            columns = 0
        end
        forms.drawImage(guiForm.relicBox, relics[i].path, columns * 46, rows * 46 + 34, 60, 60, true)
        columns = columns + 1
    end

    if columns > 5 then
        rows =  rows + 1
        columns = 0
    end
    forms.drawImage(guiForm.relicBox, constants.thrustWeaponImagePath, columns * 46, rows * 46 + 34, 60, 60, true)

    rows =  rows + 1
    columns = 0

    for i = 24, 28, 1 do
        forms.drawImage(guiForm.relicBox, relics[i].path, columns * 46, rows * 46 + 34, 60, 60, true)
        columns = columns + 1
        if columns > 5 then
            rows =  rows + 1
            columns = 0
        end
    end

    rows =  rows + 1
    columns = 0

    for i = 24, 28, 1 do
        local prefix = string.sub(relics[i].path, 1, 13)
        local suffix = string.sub(relics[i].path, 14)
        forms.drawImage(guiForm.relicBox, prefix .. "Unfinished" .. suffix, (columns * 46), (rows * 46) + 34, 60, 60, true)
        columns = columns + 1
        if columns > 5 then
            rows =  rows + 1
            columns = 0
        end
    end

    rows =  rows + 1
    columns = 0

    for i = 1, 4, 1 do
        forms.drawImage(guiForm.relicBox, progressionItems[i].path, columns * 46, rows * 46 + 34, 60, 60, true)
            columns = columns + 1
            if columns > 5 then
                rows =  rows + 1
                columns = 0
            end
    end

    forms.refresh(guiForm.relicBox)
    forms.clear(guiForm.relicBox, 0xFF110011)
    forms.refresh(guiForm.relicBox)
end

local function drawRelics()
    local rows = 0
    local columns = 0
    forms.clear(guiForm.relicBox, 0xFF110011)

    forms.drawString(guiForm.relicBox, 4, 4, seedName, 0xFFFFFFFF, 0xFF110011, 25, "arial", "bold")

    for i = 1, 23, 1 do
        if settings.onlyTrackProgressionRelics then
            if relics[i].status and relics[i].progression then
                if columns > 5 then
                    rows =  rows + 1
                    columns = 0
                end
                forms.drawImage(guiForm.relicBox, relics[i].path, columns * 46, rows * 46 + 34, 60, 60, true)
                columns = columns + 1
            end
        else
            if relics[i].status then
                if columns > 5 then
                    rows =  rows + 1
                    columns = 0
                end
                forms.drawImage(guiForm.relicBox, relics[i].path, columns * 46, rows * 46 + 34, 60, 60, true)
                columns = columns + 1
            end
        end
    end

    if commonVariables.hasThrustWeapon then
        if columns > 5 then
            rows =  rows + 1
            columns = 0
        end
        forms.drawImage(guiForm.relicBox, constants.thrustWeaponImagePath, columns * 46, rows * 46 + 34, 60, 60, true)
    end

    rows =  rows + 1
    columns = 0

    for i = 24, 28, 1 do
        if relics[i].status then
            if commonVariables.allDracRelics then
                forms.drawImage(guiForm.relicBox, relics[i].path, (columns * 46), (rows * 46) + 34, 60, 60, true)
            else
                local prefix = string.sub(relics[i].path, 1, 13)
                local suffix = string.sub(relics[i].path, 14)
                forms.drawImage(guiForm.relicBox, prefix .. "Unfinished" .. suffix, (columns * 46), (rows * 46) + 34, 60, 60, true)
            end
            columns = columns + 1
            if columns > 5 then
                rows =  rows + 1
                columns = 0
            end
        end
    end

    rows =  rows + 1
    columns = 0

    for i = 1, 4, 1 do
        if progressionItems[i].status then
            forms.drawImage(guiForm.relicBox, progressionItems[i].path, columns * 46, rows * 46 + 34, 60, 60, true)
            columns = columns + 1
            if columns > 5 then
                rows =  rows + 1
                columns = 0
            end
        end
    end

    forms.refresh(guiForm.relicBox)
end

local function drawSeedName()
    forms.clear(guiForm.relicBox, 0xFF110011)
    forms.drawString(guiForm.relicBox, 4, 4, seedName, 0xFFFFFFFF, 0xFF110011, 25, "arial", "bold")
    forms.refresh(guiForm.relicBox)
end

local function detectRelics()
    local changes = 0
    for i = 1, 23, 1 do
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

    local dracRelics = 0
    for i = 24, 28, 1 do
        if relics[i].status == false then
            if mainmemory.readbyte(relics[i].address) ~= 0x00 then
                relics[i].status = true
                changes = changes + 1
            end
        elseif commonVariables.allDracRelics == false then
            dracRelics = dracRelics + 1
        end
    end

    if dracRelics == 5 then
        commonVariables.allDracRelics = true
        changes = changes + 1
    end

    if settings.lightweightMode == false and changes > 0 then
        drawRelics()
        for i = 1, #locations, 1 do
            if locations[i].reachable ~= true then
                for j = 1, #locations[i].locks, 1 do
                    local requirements = 0
                    for k = 1, #locations[i].locks[j], 1 do
                        if locations[i].locks[j][k] == 29 then
                            if commonVariables.hasThrustWeapon then
                                requirements = requirements + 1
                            else
                                requirements = 0
                                break
                            end
                        elseif locations[i].locks[j][k] == 30 then
                            if progressionItems[3].status then
                                requirements = requirements + 1
                            else
                                requirements = 0
                                break
                            end
                        elseif locations[i].locks[j][k] == 31 then
                            if progressionItems[1].status and progressionItems[2].status then
                                requirements = requirements + 1
                            else
                                requirements = 0
                                break
                            end
                        elseif relics[locations[i].locks[j][k]].status == false then
                            requirements = 0
                            break
                        elseif relics[locations[i].locks[j][k]].status == true then
                            requirements = requirements + 1
                        end
                    end
                    if requirements == #locations[i].locks[j] then
                        locations[i].reachable = true
                        break
                    end
                end
            end
        end
    end

    if settings.lightweightMode == true and changes > 0 then
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
            elseif i == 1 and (mainmemory.readbyte(constants.accessorySlot1Address) == progressionItems[i].equippedValue or mainmemory.readbyte(constants.accessorySlot2Address) == progressionItems[i].equippedValue) then
                progressionItems[i].status = true
                changes = changes + 1
            elseif i == 2 and (mainmemory.readbyte(constants.accessorySlot1Address) == progressionItems[i].equippedValue or mainmemory.readbyte(constants.accessorySlot2Address) == progressionItems[i].equippedValue) then
                progressionItems[i].status = true
                changes = changes + 1
            elseif i == 3 and mainmemory.readbyte(constants.armorSlotAddress) == progressionItems[i].equippedValue then
                progressionItems[i].status = true
                changes = changes + 1
            elseif i == 4 and mainmemory.readbyte(constants.headSlotAddress) == progressionItems[i].equippedValue then
                progressionItems[i].status = true
                changes = changes + 1
            end
        end
    end

    if commonVariables.hasThrustWeapon == false then
        for i = 1, 5, 1 do
            if divekickStateItems[i].status == false then
                if mainmemory.readbyte(divekickStateItems[i].address) ~= 0x00 or mainmemory.readbyte(constants.rightHandSlotAddress) == divekickStateItems[i].equippedValue then
                    divekickStateItems[i].status = true
                    commonVariables.hasDivekick = true
                    commonVariables.hasThrustWeapon = true
                    changes = changes + 1
                    if commonVariables.hasGravityBoots then
                        commonVariables.hasFlight = true
                    end
                end
            end
        end
    end

    if settings.lightweightMode == false and changes > 0 then
        drawRelics()
        for i = 1, #locations, 1 do
            if locations[i].reachable ~= true then
                for j = 1, #locations[i].locks, 1 do
                    local requirements = 0
                    for k = 1, #locations[i].locks[j], 1 do
                        if locations[i].locks[j][k] == 29 then
                            if commonVariables.hasThrustWeapon then
                                requirements = requirements + 1
                            else
                                requirements = 0
                                break
                            end
                        elseif locations[i].locks[j][k] == 30 then
                            if progressionItems[3].status then
                                requirements = requirements + 1
                            else
                                requirements = 0
                                break
                            end
                        elseif locations[i].locks[j][k] == 31 then
                            if progressionItems[1].status and progressionItems[2].status then
                                requirements = requirements + 1
                            else
                                requirements = 0
                                break
                            end
                        elseif relics[locations[i].locks[j][k]].status == false then
                            requirements = 0
                            break
                        elseif relics[locations[i].locks[j][k]].status == true then
                            requirements = requirements + 1
                        end
                    end
                    if requirements == #locations[i].locks[j] then
                        locations[i].reachable = true
                        break
                    end
                end
            end
        end
    end

    if settings.lightweightMode == true and changes > 0 then
        outputItems()
    end

    return changes
end

local function detectLocations()
    local changes = 0
    local debugLocations = "\n\n".. commonVariables.alucardRooms
    for i = 1, 32, 1 do
        if locations[i].status == false then
            for j = 1, #locations[i].mapTiles do
                if settings.debugMode then
                    debugLocations = debugLocations .. ("\n\n" .. locations[i].name .. " " .. locations[i].mapTiles[j].address .. " : " .. mainmemory.readbyte(locations[i].mapTiles[j].address))
                end
                if contains(locations[i].mapTiles[j].values,
                            mainmemory.readbyte(locations[i].mapTiles[j].address)) then
                    locations[i].status = true
                    changes = changes + 1
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
    local adjustedOffsetX = tonumber(settings.drawingOffsetX)
    local adjustedOffsetY = tonumber(settings.drawingOffsetY)
    local firstCastleLocations = 21
    local secondCastleLocations = 34
    local firstCastleChecksRemaining = 0
    local secondCastleChecksRemaining = 0

    if settings.extendedLocations == true then
        firstCastleLocations = 27
        secondCastleLocations = 36
    end

    if settings.pixelProMode == false then
        scaling = 0.5
        boxSize = 4
    elseif settings.pixelProMode == true then
        scaling = 1
        boxSize = 9
    end

    local locationColor = constants.locationMapColorReachable

    local mapCheck = memory.readbyte(constants.mapOpenAddress)
    if mapCheck == 1 and mainmemory.read_u8(constants.secondCastleAddress) == 0 then
        for i = 1, firstCastleLocations, 1 do
            locationColor = constants.locationMapColorReachable
            if locations[i].status == false then

                if locations[i].reachable ~= true then
                    locationColor = constants.locationMapColor
                end

                firstCastleChecksRemaining = firstCastleChecksRemaining + 1

                gui.drawBox((locations[i].mapX * scaling) + adjustedOffsetX,
                            (locations[i].mapY * scaling) + adjustedOffsetY,
                            (locations[i].mapX * scaling) + adjustedOffsetX + boxSize,
                            (locations[i].mapY * scaling) + adjustedOffsetY + boxSize,
                            constants.mapBorderColor, locationColor)
            end
        end

        for i = 24, secondCastleLocations, 1 do
            if locations[i].status == false then
                secondCastleChecksRemaining = secondCastleChecksRemaining + 1
            end
        end

        gui.drawText(0, 0, "First Castle checks: " .. firstCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
        gui.drawText(0, (17 * scaling), "Second Castle checks: " .. secondCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
    elseif mapCheck == 1 then
        locationColor = constants.locationMapColorReachable
        for i = 24, secondCastleLocations, 1 do
            if locations[i].status == false then

                secondCastleChecksRemaining = secondCastleChecksRemaining + 1

                gui.drawBox((locations[i].mapX * scaling) + adjustedOffsetX,
                            (locations[i].mapY * scaling) + adjustedOffsetY,
                            (locations[i].mapX * scaling) + adjustedOffsetX + boxSize,
                            (locations[i].mapY * scaling) + adjustedOffsetY + boxSize,
                            constants.mapBorderColor, locationColor)
            end
        end

        for i = 1, firstCastleLocations, 1 do
            if locations[i].status == false then
                firstCastleChecksRemaining = firstCastleChecksRemaining + 1
            end
        end

        gui.drawText(0, 0, "First Castle checks: " .. firstCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
        gui.drawText(0, (17 * scaling), "Second Castle checks: " .. secondCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
    end
end

local function outputDebugInfo()
    local inputs = input.get()

    if inputs["Comma"] == true and inputs["Period"] == true then
        local locationsData = "commonVariables: \n\n "
        print(commonVariables)
    end
end

--close form on script exit
event.onexit(
    function ()
         forms.destroy(guiForm.mainForm)
         --update ini file settings and save data
         writeToIni(serializeObject(settings, "settings"), "config.ini")
    end
)

while true do
    --end script when the form is closed
    if forms.gettext(guiForm.mainForm) == "" then
        return
    end

    if emu.framecount() % 120 == 0 then
        updateSettings(settings, guiForm.cloakColorCheckbox, guiForm.onlyTrackProgressionRelicsCheckbox, guiForm.pixelProModeCheckbox, guiForm.extendedLocationsCheckbox)
    end

    if imagesCached == false then
        cacheImages()
        imagesCached = true
    end

    --get seed name from ram
    if seedName == "" and gameinfo.getromhash() ~= "" and mainmemory.readbyte(constants.gameStatus) == 8 then
        local digit = false
        local symbol = false
        for i = 0, 28, 1 do
            local currentByte = mainmemory.readbyte(constants.seedNameStartAddress + i)
            if currentByte == 130 then
                digit = true
            elseif currentByte == 129 or currentByte == 130 then
                symbol = true
            else
                if digit then
                    digit = false
                    seedName = seedName .. (currentByte - 79);
                elseif symbol then
                    symbol = false
                    seedName = seedName .. characterMap[currentByte]
                else
                    seedName = seedName .. string.char(currentByte);
                end
            end
        end
        drawSeedName()
    end

    if commonVariables.gameInMainMenu == false and gameinfo.getromhash() ~= "" and mainmemory.readbyte(constants.gameStatus) ~= 2 then
        commonVariables.gameInMainMenu = true
        commonVariables.gameReset = false
    end

    if commonVariables.gameReset == true then
        commonVariables.gameReset = false
        resetAllValues()
        setcloakColor()
        drawSeedName()
    end

    if commonVariables.gameInMainMenu == true and mainmemory.readbyte(constants.gameStatus) == 2 then
        commonVariables.gameReset = true
        commonVariables.gameInMainMenu = false
    end

    if commonVariables.alucardModeStarted then
        if settings.lightweightMode == false then
            drawLocations()
        end
        if emu.framecount() % 120 == 0 then
            if mainmemory.read_u16_le(constants.alucardRoomsCountAddress) > commonVariables.alucardRooms then
                commonVariables.alucardRooms = mainmemory.read_u16_le(constants.alucardRoomsCountAddress)
                detectLocations()
            end
            detectItems()
            detectRelics()
        end
        if settings.debugMode then outputDebugInfo() end
    else
        if emu.framecount() > 4200 and emu.framecount() % 120 == 0 then
            checkAlucardModeStart()
        end
    end

    emu.frameadvance()
end