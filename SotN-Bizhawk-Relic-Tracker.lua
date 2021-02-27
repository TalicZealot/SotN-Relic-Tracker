require "Utilities/Serialization"
require "UserInterface"
local constants = require "constants"

local settings = {
    trackAllRelics = false,
    pixelPro = true
}
deserializeToObject(settings, "config.ini")

---UI---
local guiForm = {
    version = "1.8.3",
    mainForm = nil,
    relicBox = nil,
    toggle = nil,
    toggleDisplay = nil,
    toggleOnPath = "images/toggleOn.png",
    toggleOffPath = "images/toggleOff.png",
    toggleWidth = 20,
    toggleHeight = 11
}
initForm(settings, guiForm)
forms.drawBox(guiForm.relicBox, 0, 0, 320, 374, 0xFF110011, 0xFF110011)
--------

local common = {
    drawingOffsetX = 148,
    drawingOffsetY = 38,
    --displayMode = tostring(client.getconfig().CoreSettings['BizHawk.Emulation.Cores.Sony.PSX.Octoshock'].ResolutionMode),
    alucardModeStarted = false,
    gameInMainMenu = false,
    gameReset = false,
    alucardRooms = 0,
    allDracRelics = false,
    hasThrustWeapon = false,
    imagesCached = false,
    seedName = "none",
    preset = "none",
    secondCastleStart = 28,
    squareLocations = true,
    fontSize = 20
}

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
        name = "Cube of Zoe",
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
        name = "Sprite Card",
        path = "images/large/FaerieCard.png",
        status = false,
        progression = false,
        address = 0x9797B
    }, {--25
        name = "Nose Devil",
        path = "images/large/DemonCard.png",
        status = false,
        progression = false,
        address = 0x9797C
    }, {--26
        name = "Heart of Vlad",
        path = "images/large/HeartOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797D
    }, {--27
        name = "Tooth of Vlad",
        path = "images/large/ToothOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797E
    }, {--28
        name = "Rib of Vlad",
        path = "images/large/RibOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797F
    }, {--29
        name = "Ring of Vlad",
        path = "images/large/RingOfVlad.png",
        status = false,
        progression = true,
        address = 0x97980
    }, {--30
        name = "Eye of Vlad",
        path = "images/large/EyeOfVlad.png",
        status = false,
        progression = true,
        address = 0x97981
    }
    --31 Gold Ring
    --32 Silver Ring
    --33 Spike Breaker
    --34 Holy Glasses
    --35 Thrust Sword
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
        path = "images/large/Claymore.png",
        status = false,
        address = 0x0979E9,
        equippedValue = 95
    }, {
        name = "Claymore",
        status = false,
        address = 0x0979EC,
        equippedValue = 98
    }, {
        name = "Flamberge",
        status = false,
        address = 0x0979EF,
        equippedValue = 101
    }, {
        name = "Zweihander",
        status = false,
        address = 0x0979F1,
        equippedValue = 103
    }, {
        name = "Obsidian Sword",
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
        locks = {{"FORM_OF_MIST", "LEAP_STONE"}, {"FORM_OF_MIST", "GRAVITY_BOOTS"}, {"FORM_OF_MIST", "SOUL_OF_BAT"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
        allowed = {{"FORM_OF_MIST"}}
    }, {
        name = "Fire of Bat",--2
        status = false,
        mapTiles = {{address = 0x06BC32, values = {5, 85, 21, 189, 253}}},
        mapX = 474,
        mapY = 52,
        locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
        allowed = {{"GRAVITY_BOOTS", "THRUST_SWORD"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"}}
    }, {
        name = "Echo of Bat",--3
        status = false,
        mapTiles = {{address = 0x06BC78, values = {85}}},
        mapX = 130,
        mapY = 92,
        locks = {{"SOUL_OF_BAT"}, {"LEAP_STONE", "GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"LEAP_STONE", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
        allowed = {{"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"}}
    }, {
        name = "Soul of Wolf",--4
        status = false,
        mapTiles = {
            {address = 0x06BCA3, values = {80, 240}},
            {address = 0x06BC93, values = {16, 240}}
        },
        mapX = 490,
        mapY = 108,
        locks = {},
        reachable = true
    }, {
        name = "Power of Wolf",--5
        status = false,
        mapTiles = {{address = 0x06BDE4, values = {1, 5, 11}}},
        mapX = 18,
        mapY = 268,
        locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
        allowed = {{"GRAVITY_BOOTS", "THRUST_SWORD"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"}}
    }, {
        name = "Skill of Wolf",--6
        status = false,
        mapTiles = {{address = 0x06BD87, values = {85, 213, 21}}},
        mapX = 122,
        mapY = 228,
        locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}}
    }, {
        name = "Form of Mist",--7
        status = false,
        mapTiles = {{address = 0x06BCD9, values = {5, 85}}},
        mapX = 170,
        mapY = 140,
        locks = {{"SOUL_OF_BAT"}, {"SOUL_OF_WOLF"}, {"FORM_OF_MIST", "POWER_OF_MIST"}, {"GRAVITY_BOOTS"}, {"LEAP_STONE"}},
        allowed = {{"THRUST_SWORD"}, {"FORM_OF_MIST"}}
    }, {
        name = "Power of Mist",--8
        status = false,
        mapTiles = {
            {address = 0x06BC0B, values = {1, 3}},
            {address = 0x06BC1B, values = {1, 131}}
        },
        mapX = 250,
        mapY = 36,
        locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
        allowed = {{"GRAVITY_BOOTS", "THRUST_SWORD"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"}}
    }, {
        name = "Cube of Zoe",--9
        status = false,
        mapTiles = {{address = 0x06BDB8, values = {1, 4, 5, 85, 84, 255}}},
        mapX = 154,
        mapY = 252,
        locks = {},
        reachable = true
    }, {
        name = "Spirit Orb",--10
        status = false,
        mapTiles = {
            {address = 0x06BD7A, values = {20, 21, 62}},
            {address = 0x06BD6A, values = {20, 16, 56, 60}}
        },
        mapX = 202,
        mapY = 214,
        locks = {},
        reachable = true
    }, {
        name = "Gravity Boots",--11
        status = false,
        mapTiles = {{address = 0x06BCEC, values = {4, 5, 84}}},
        mapX = 274,
        mapY = 148,
        locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
        allowed = {{"GRAVITY_BOOTS", "THRUST_SWORD"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"}}
    }, {
        name = "Leap Stone",--12
        status = false,
        mapTiles = {
            {address = 0x06BC3B, values = {1, 85, 131, 255}},
            {address = 0x06BC2B, values = {1, 171, 131}}
        },
        mapX = 250,
        mapY = 52,
        locks = {{"JEWEL_OF_OPEN"}, {"SOUL_OF_BAT"}, {"FORM_OF_MIST", "POWER_OF_MIST"}, {"GRAVITY_BOOTS"}, {"LEAP_STONE"}},
        allowedReachable = true
    }, {
        name = "Holy Symbol",--13
        status = false,
        mapTiles = {{address = 0x06BE11, values = {85}}},
        mapX = 442,
        mapY = 292,
        locks = {{"JEWEL_OF_OPEN", "MERMAN_STATUE"}}
    }, {
        name = "Faerie Scroll",--14
        status = false,
        mapTiles = {{address = 0x06BCA2, values = {21, 85, 191}}},
        mapX = 474,
        mapY = 108,
        locks = {},
        reachable = true
    }, {
        name = "Jewel of Open",--15
        status = false,
        mapTiles = {{address = 0x06BCC0, values = {21, 85, 127}}},
        mapX = 394,
        mapY = 124,
        locks = {},
        reachable = true
    }, {
        name = "Merman Statue",--16
        status = false,
        mapTiles = {{address = 0x06BE16, values = {85, 255}}},
        mapX = 66,
        mapY = 300,
        locks = {{"JEWEL_OF_OPEN"}}
    }, {
        name = "Bat Card",--17
        status = false,
        mapTiles = {{address = 0x06BD27, values = {80, 84, 85, 222}}},
        mapX = 106,
        mapY = 180,
        locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}}
    }, {
        name = "Ghost Card",--18
        status = false,
        mapTiles = {{address = 0x06BBED, values = {20, 21, 69, 81, 181, 85, 17, 245}}},
        mapX = 314,
        mapY = 20,
        locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
        allowed = {{"GRAVITY_BOOTS", "THRUST_SWORD"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"}}
    }, {
        name = "Faerie Card",--19
        status = false,
        mapTiles = {{address = 0x06BCA1, values = {84, 85, 126, 127}}},
        mapX = 418,
        mapY = 108,
        locks = {{"SOUL_OF_BAT"}, {"FORM_OF_MIST", "POWER_OF_MIST"}, {"GRAVITY_BOOTS"}},
        allowed = {{"THRUST_SWORD"}, {"SOUL_OF_WOLF"}, {"FORM_OF_MIST"}, {"LEAP_STONE"}}
    }, {
        name = "Demon Card",--20
        status = false,
        mapTiles = {{address = 0x06BE3B, values = {21}}},
        mapX = 234,
        mapY = 316,
        locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "LEAP_STONE"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "POWER_OF_WOLF"}},
        allowed = {{"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "SKILL_OF_WOLF"}}
    }, {
        name = "Sword Card",--21
        status = false,
        mapTiles = {{address = 0x06BC99, values = {64}}},
        mapX = 162,
        mapY = 108,
        locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
        allowed = {{"GRAVITY_BOOTS", "THRUST_SWORD"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"}}
    }, {
        name = "Crystal Cloak",--22
        status = false,
        mapTiles = {{address = 0x06BDDE, values = {85, 255}}},
        mapX = 322,
        mapY = 268,
        locks = {{"JEWEL_OF_OPEN"}}
    }, {
        name = "Mormegil",--23
        status = false,
        mapTiles = {{address = 0x06BE98, values = {81, 85}}},
        mapX = 138,
        mapY = 364,
        locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "LEAP_STONE"},  {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"},
          {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "POWER_OF_WOLF"}},
        allowed = {{"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "SKILL_OF_WOLF"}}
    }, {
        name = "Gold Ring",--24
        status = false,
        mapTiles = {{address = 0x06BD8F, values = {80}}},
        mapX = 362,
        mapY = 228,
        locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "LEAP_STONE"}},
        allowed = {{"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "LEAP_STONE", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "SKILL_OF_WOLF"}}
    },
    {
        name = "Spikebreaker",--25
        status = false,
        mapTiles = {{address = 0x06BEAE, values = {21, 85}}},
        mapX = 330,
        mapY = 372,
        locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT", "ECHO_OF_BAT"}},
        allowed = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "SPIKE_BREAKER", "LEAP_STONE"}, {"JEWEL_OF_OPEN", "SPIKE_BREAKER", "THRUST_SWORD", "FORM_OF_MIST"}}
    },
    {
        name = "Silver Ring",--26
        status = false,
        mapTiles = {{address = 0x06BC66, values = {21, 85}}},
        mapX = 68,
        mapY = 84,
        locks = {{"JEWEL_OF_OPEN", "SPIKE_BREAKER", "FORM_OF_MIST"}},
        allowed = {{"JEWEL_OF_OPEN", "FORM_OF_MIST"}},
    },
    {
        name = "Holy Glasses",--27
        status = false,
        mapTiles = {{address = 0x06BD6C, values = {64, 80}}},
        mapX = 258,
        mapY = 212,
        locks = {{"GOLD_RING", "SILVER_RING"}}
    }, {
        name = "Heart of Vlad",--28
        status = false,
        mapTiles = {
            {address = 0x06C29D, values = {85}},
            {address = 0x06C29E, values = {85, 64}}
        },
        mapX = 320,
        mapY = 330,
        locks = {},
        reachable = true
    }, {
        name = "Tooth of Vlad",--29
        status = false,
        mapTiles = {{address = 0x06C1F5, values = {80, 84, 85, 5, 21, 69}}},
        mapX = 48,
        mapY = 250,
        locks = {},
        reachable = true
    }, {
        name = "Rib of Vlad",--30
        status = false,
        mapTiles = {{address = 0x06C26E, values = {85}}},
        mapX = 352,
        mapY = 306,
        reachable = false,
        locks = {{"SOUL_OF_BAT"}, {"SOUL_OF_WOLF"}, {"FORM_OF_MIST"}}
    }, {
        name = "Ring of Vlad",--31
        status = false,
        mapTiles = {{address = 0x06C2C9, values = {1, 5, 85}}},
        mapX = 184,
        mapY = 354,
        locks = {},
        reachable = true
    }, {
        name = "Eye of Vlad",--32
        status = false,
        mapTiles = {{address = 0x06C0EC, values = {21, 85}}},
        mapX = 264,
        mapY = 114,
        locks = {},
        reachable = true
    }, {
        name = "Force of Echo",--33
        status = false,
        mapTiles = {{address = 0x06C0D6, values = {85}}},
        mapX = 64,
        mapY = 106,
        locks = {},
        reachable = true
    }, {
        name = "Gas Cloud",--34
        status = false,
        mapTiles = {{address = 0x06C04F, values = {85}}},
        mapX = 368,
        mapY = 34,
        locks = {},
        reachable = true
    }, {
        name = "Ring of Arcana",--35
        status = false,
        mapTiles = {{address = 0x06C1C0, values = {5, 21, 85}}},
        mapX = 400,
        mapY = 218,
        locks = {},
        reachable = true
    }, {
        name = "Dark Blade",--36
        status = false,
        mapTiles = {{address = 0x06C109, values = {85}}},
        mapX = 184,
        mapY = 130,
        locks = {},
        reachable = true
    }, {
        name = "Trio",--37
        status = false,
        mapTiles = {
            {address = 0x06C20F, values = {64, 80, 84, 85}},
            {address = 0x06C20E, values = {5}}
        },
        mapX = 344,
        mapY = 258,
        locks = {},
        reachable = true
    }
}

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
    for i = 1, #locations, 1 do
        if table.getn(locations[i].locks) > 0 then
            locations[i].reachable = false
        end
    end
    common.alucardModeStarted = false
    common.gameInMainMenu = false
    common.gameReset = false
    common.alucardRooms = 0
    common.allDracRelics = false
    common.hasThrustWeapon = false
end

local function checkAlucardModeStart()
    local alucardXp = mainmemory.read_u8(constants.ramAddresses.alucardCurrentXpAddress)
    if alucardXp > 0 and alucardXp < 80000 then
        common.alucardModeStarted = true
    end
end

local function cacheImages()
    local rows = 0
    local columns = 0
    forms.clear(guiForm.relicBox, 0xFF110011)

    for i = 1, 25, 1 do
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
    forms.drawImage(guiForm.relicBox, divekickStateItems[1].path, columns * 46, rows * 46 + 34, 60, 60, true)

    rows =  rows + 1
    columns = 0

    for i = 26, 30, 1 do
        forms.drawImage(guiForm.relicBox, relics[i].path, columns * 46, rows * 46 + 34, 60, 60, true)
        columns = columns + 1
        if columns > 5 then
            rows =  rows + 1
            columns = 0
        end
    end

    rows =  rows + 1
    columns = 0

    for i = 26, 30, 1 do
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

    forms.drawString(guiForm.relicBox, 0, 29, common.seedName .. "(" .. common.preset ..")", 0xFFFFFFFF, 0xFF110011, common.fontSize, "arial", "bold")
    drawControls(guiForm, settings)

    for i = 1, 25, 1 do
        if settings.trackAllRelics == false then
            if relics[i].status and relics[i].progression then
                if columns > 5 then
                    rows =  rows + 1
                    columns = 0
                end
                forms.drawImage(guiForm.relicBox, relics[i].path, (columns * 46) - 5, rows * 46 + 34 + 15, 60, 60, true)
                columns = columns + 1
            end
        else
            if relics[i].status then
                if columns > 5 then
                    rows =  rows + 1
                    columns = 0
                end
                forms.drawImage(guiForm.relicBox, relics[i].path, (columns * 46) - 5, rows * 46 + 34 + 15, 60, 60, true)
                columns = columns + 1
            end
        end
    end

    if common.hasThrustWeapon then
        if columns > 5 then
            rows =  rows + 1
            columns = 0
        end
        forms.drawImage(guiForm.relicBox, divekickStateItems[1].path, (columns * 46) - 5, rows * 46 + 34 + 15, 60, 60, true)
    end

    rows =  rows + 1
    columns = 0

    for i = 26, 30, 1 do
        if relics[i].status then
            if common.allDracRelics then
                forms.drawImage(guiForm.relicBox, relics[i].path, (columns * 46) - 5, (rows * 46) + 34 + 15, 60, 60, true)
            else
                local prefix = string.sub(relics[i].path, 1, 13)
                local suffix = string.sub(relics[i].path, 14)
                forms.drawImage(guiForm.relicBox, prefix .. "Unfinished" .. suffix, (columns * 46) - 5, (rows * 46) + 34 + 15, 60, 60, true)
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
            forms.drawImage(guiForm.relicBox, progressionItems[i].path, (columns * 46) - 5, rows * 46 + 34 + 15, 60, 60, true)
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
    forms.drawString(guiForm.relicBox, 0, 29, common.seedName .. "(" .. common.preset ..")", 0xFFFFFFFF, 0xFF110011, common.fontSize, "arial", "bold")
    drawControls(guiForm, settings)
    forms.refresh(guiForm.relicBox)
end

local function unlockLocations(changes)
    if changes > 0 then
        drawRelics()
        for i = 1, #locations, 1 do
            if locations[i].reachable ~= true then
                for j = 1, #locations[i].locks, 1 do
                    local requirements = 0
                    for k = 1, #locations[i].locks[j], 1 do
                        local lock = locations[i].locks[j][k]

                        if lock == "THRUST_SWORD" then
                            if common.hasThrustWeapon then
                                requirements = requirements + 1
                            else
                                requirements = 0
                                break
                            end
                        elseif lock == "SPIKE_BREAKER" then
                            if progressionItems[3].status then
                                requirements = requirements + 1
                            else
                                requirements = 0
                                break
                            end
                        elseif lock == "GOLD_RING" then
                            if progressionItems[1].status then
                                requirements = requirements + 1
                            else
                                requirements = 0
                                break
                            end
                        elseif lock == "SILVER_RING" then
                            if progressionItems[2].status then
                                requirements = requirements + 1
                            else
                                requirements = 0
                                break
                            end
                        elseif lock == "HOLY_GLASSES" then
                            if progressionItems[4].status then
                                requirements = requirements + 1
                            else
                                requirements = 0
                                break
                            end
                        elseif constants.RELIC[lock] < 31 and relics[constants.RELIC[lock]].status == false then
                            requirements = 0
                            break
                        elseif constants.RELIC[lock] < 31 and relics[constants.RELIC[lock]].status == true then
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
        for i = 1, #locations, 1 do
            if locations[i].reachable ~= true then
                if locations[i].allowed then
                    for j = 1, #locations[i].allowed, 1 do
                        local requirements = 0
                        for k = 1, #locations[i].allowed[j], 1 do
                            local lock = locations[i].allowed[j][k]

                            if lock == "THRUST_SWORD" then
                                if common.hasThrustWeapon then
                                    requirements = requirements + 1
                                else
                                    requirements = 0
                                    break
                                end
                            elseif lock == "SPIKE_BREAKER" then
                                if progressionItems[3].status then
                                    requirements = requirements + 1
                                else
                                    requirements = 0
                                    break
                                end
                            elseif lock == "GOLD_RING" then
                                if progressionItems[1].status then
                                    requirements = requirements + 1
                                else
                                    requirements = 0
                                    break
                                end
                            elseif lock == "SILVER_RING" then
                                if progressionItems[2].status then
                                    requirements = requirements + 1
                                else
                                    requirements = 0
                                    break
                                end
                            elseif lock == "HOLY_GLASSES" then
                                if progressionItems[4].status then
                                    requirements = requirements + 1
                                else
                                    requirements = 0
                                    break
                                end
                            elseif constants.RELIC[lock] < 31 and relics[constants.RELIC[lock]].status == false then
                                requirements = 0
                                break
                            elseif constants.RELIC[lock] < 31 and relics[constants.RELIC[lock]].status == true then
                                requirements = requirements + 1
                            end
                        end
                        if requirements == #locations[i].allowed[j] then
                            locations[i].allowedReachable = true
                            break
                        end
                    end
                end
            end
        end
    end
end

local function detectRelics()
    local changes = 0
    for i = 1, 25, 1 do
        if settings.trackAllRelics == false then
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
    for i = 26, 30, 1 do
        if relics[i].status == false then
            if mainmemory.readbyte(relics[i].address) ~= 0x00 then
                relics[i].status = true
                changes = changes + 1
            end
        elseif common.allDracRelics == false then
            dracRelics = dracRelics + 1
        end
    end

    if dracRelics == 5 then
        common.allDracRelics = true
        changes = changes + 1
    end

    unlockLocations(changes)
end

local function detectItems()
    local changes = 0
    for i = 1, 4, 1 do
        if progressionItems[i].status == false then
            if mainmemory.readbyte(progressionItems[i].address) ~= 0x00 then
                progressionItems[i].status = true
                changes = changes + 1
            elseif i == 1 and (mainmemory.readbyte(constants.ramAddresses.accessorySlot1Address) == progressionItems[i].equippedValue or mainmemory.readbyte(constants.ramAddresses.accessorySlot2Address) == progressionItems[i].equippedValue) then
                progressionItems[i].status = true
                changes = changes + 1
            elseif i == 2 and (mainmemory.readbyte(constants.ramAddresses.accessorySlot1Address) == progressionItems[i].equippedValue or mainmemory.readbyte(constants.ramAddresses.accessorySlot2Address) == progressionItems[i].equippedValue) then
                progressionItems[i].status = true
                changes = changes + 1
            elseif i == 3 and mainmemory.readbyte(constants.ramAddresses.armorSlotAddress) == progressionItems[i].equippedValue then
                progressionItems[i].status = true
                changes = changes + 1
            elseif i == 4 and mainmemory.readbyte(constants.ramAddresses.headSlotAddress) == progressionItems[i].equippedValue then
                progressionItems[i].status = true
                changes = changes + 1
            end
        end
    end

    if common.hasThrustWeapon == false then
        for i = 1, 5, 1 do
            if divekickStateItems[i].status == false then
                if mainmemory.readbyte(divekickStateItems[i].address) ~= 0x00 or mainmemory.readbyte(constants.ramAddresses.rightHandSlotAddress) == divekickStateItems[i].equippedValue then
                    divekickStateItems[i].status = true
                    common.hasDivekick = true
                    common.hasThrustWeapon = true
                    changes = changes + 1
                    if common.hasGravityBoots then
                        common.hasFlight = true
                    end
                end
            end
        end
    end

    unlockLocations(changes)

    return changes
end

local function detectLocations()
    local changes = 0
    local debugLocations = "\n\n".. common.alucardRooms

    for i = 1, #locations, 1 do
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
end

local function drawLocations()
    local scaling = 0
    local boxSize = 0
    local circleSize = 0
    local firstCastleChecksRemaining = 0
    local secondCastleChecksRemaining = 0

    if settings.pixelPro == true then
        scaling = 1
        boxSize = 9
        circleSize = 6
        common.drawingOffsetX = 148
        common.drawingOffsetY = 38
    else
        scaling = 0.5
        boxSize = 4
        circleSize = 3
        common.drawingOffsetX = 13
        common.drawingOffsetY = 19
    end

    local locationColor

    if mainmemory.read_u8(constants.ramAddresses.secondCastleAddress) == 0 then
        for i = 1, common.secondCastleStart - 1, 1 do
            if locations[i].status == false and not locations[i].skip  then

                if locations[i].reachable == true then
                    locationColor = constants.colors.locationMapColorReachable
                elseif locations[i].allowedReachable == true then
                    locationColor = constants.colors.locationMapColorAllowed
                else
                    locationColor = constants.colors.locationMapColor
                end

                firstCastleChecksRemaining = firstCastleChecksRemaining + 1

                if common.squareLocations then
                    gui.drawBox((locations[i].mapX * scaling) + common.drawingOffsetX,
                            (locations[i].mapY * scaling) + common.drawingOffsetY,
                            (locations[i].mapX * scaling) + common.drawingOffsetX + boxSize,
                            (locations[i].mapY * scaling) + common.drawingOffsetY + boxSize,
                            constants.colors.mapBorderColor, locationColor)
                else
                    gui.drawEllipse(((locations[i].mapX + 2) * scaling) + common.drawingOffsetX,
                            ((locations[i].mapY + 2) * scaling) + common.drawingOffsetY,
                            circleSize, circleSize, constants.colors.mapBorderColor, locationColor)
                end
            end
        end

        for i = common.secondCastleStart, #locations, 1 do
            if locations[i].status == false and not locations[i].skip then
                secondCastleChecksRemaining = secondCastleChecksRemaining + 1
            end
        end

        gui.drawText(0, 0, "First Castle checks: " .. firstCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
        gui.drawText(0, (17 * scaling), "Second Castle checks: " .. secondCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
    else
        for i = common.secondCastleStart, #locations, 1 do
            if locations[i].status == false and not locations[i].skip then

                if locations[i].reachable == true then
                    locationColor = constants.colors.locationMapColorReachable
                elseif locations[i].allowedReachable == true then
                    locationColor = constants.colors.locationMapColorAllowed
                else
                    locationColor = constants.colors.locationMapColor
                end

                secondCastleChecksRemaining = secondCastleChecksRemaining + 1

                if common.squareLocations then
                    gui.drawBox((locations[i].mapX * scaling) + common.drawingOffsetX,
                            (locations[i].mapY * scaling) + common.drawingOffsetY,
                            (locations[i].mapX * scaling) + common.drawingOffsetX + boxSize,
                            (locations[i].mapY * scaling) + common.drawingOffsetY + boxSize,
                            constants.colors.mapBorderColor, locationColor)
                else
                    gui.drawEllipse(((locations[i].mapX + 2) * scaling) + common.drawingOffsetX,
                            ((locations[i].mapY + 2) * scaling) + common.drawingOffsetY,
                            circleSize, circleSize, constants.colors.mapBorderColor, locationColor)
                end
            end
        end

        for i = 1, common.secondCastleStart - 1, 1 do
            if locations[i].status == false and not locations[i].skip then
                firstCastleChecksRemaining = firstCastleChecksRemaining + 1
            end
        end

        gui.drawText(0, 0, "First Castle checks: " .. firstCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
        gui.drawText(0, (17 * scaling), "Second Castle checks: " .. secondCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
    end
end

local function drawAdventureLocations()
    local scaling = 1
    local boxSize = 5
    local firstCastleLocations = 21
    local secondCastleLocations = 34
    local firstCastleChecksRemaining = 0
    local secondCastleChecksRemaining = 0

    if common.preset ~= 'Casual' then
        firstCastleLocations = 27
        secondCastleLocations = 36
    end

    if settings.pixelPro == true then
        scaling = 1
        boxSize = 9
        common.drawingOffsetX = 148
        common.drawingOffsetY = 38
    else
        scaling = 0.5
        boxSize = 4
        common.drawingOffsetX = 13
        common.drawingOffsetY = 19
    end

    local locationColor

    if mainmemory.read_u8(constants.ramAddresses.secondCastleAddress) == 0 then
        for i = 1, firstCastleLocations, 1 do
            locationColor = constants.colors.locationMapColorReachable
            if locations[i].status == false and not locations[i].skip  then

                if locations[i].reachable == true then
                    locationColor = constants.colors.locationMapColorReachable
                elseif locations[i].allowedReachable == true then
                    locationColor = constants.colors.locationMapColorAllowed
                else
                    locationColor = constants.colors.locationMapColor
                end

                firstCastleChecksRemaining = firstCastleChecksRemaining + 1

                gui.drawBox((locations[i].mapX * scaling) + common.drawingOffsetX,
                            (locations[i].mapY * scaling) + common.drawingOffsetY,
                            (locations[i].mapX * scaling) + common.drawingOffsetX + boxSize,
                            (locations[i].mapY * scaling) + common.drawingOffsetY + boxSize,
                            constants.colors.mapBorderColor, locationColor)
            end
        end

        for i = firstCastleLocations + 1, secondCastleLocations, 1 do
            if locations[i].status == false then
                secondCastleChecksRemaining = secondCastleChecksRemaining + 1
            end
        end

        gui.drawText(0, 0, "First Castle checks: " .. firstCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
        gui.drawText(0, (17 * scaling), "Second Castle checks: " .. secondCastleChecksRemaining, 0xFFFFFFFF, 0xFF000000, (16 * scaling))
    else
        for i = firstCastleLocations + 1, secondCastleLocations, 1 do
            if locations[i].status == false and not locations[i].skip then

                if locations[i].reachable == true then
                    locationColor = constants.colors.locationMapColorReachable
                elseif locations[i].allowedReachable == true then
                    locationColor = constants.colors.locationMapColorAllowed
                else
                    locationColor = constants.colors.locationMapColor
                end

                secondCastleChecksRemaining = secondCastleChecksRemaining + 1

                gui.drawBox((locations[i].mapX * scaling) + common.drawingOffsetX,
                            (locations[i].mapY * scaling) + common.drawingOffsetY,
                            (locations[i].mapX * scaling) + common.drawingOffsetX + boxSize,
                            (locations[i].mapY * scaling) + common.drawingOffsetY + boxSize,
                            constants.colors.mapBorderColor, locationColor)
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

    --initialize
    if common.imagesCached == false then
        gui.clearImageCache()
        if settings.pixelPro == true then
            common.drawingOffsetX = 148
            common.drawingOffsetY = 38
        else
            common.drawingOffsetX = 13
            common.drawingOffsetY = 19
        end
        cacheImages()
        common.imagesCached = true
        drawControls(guiForm, settings)
        forms.refresh(guiForm.relicBox)
    end

    --get seed name from ram
    if common.seedName == "none" and gameinfo.getromhash() ~= "" and mainmemory.readbyte(constants.ramAddresses.gameStatus) == 8 then
        local digit = false
        local symbol = false
        common.seedName = ""
        for i = 0, 31, 1 do
            local currentByte = mainmemory.readbyte(constants.ramAddresses.seedNameStartAddress + i)
            if currentByte == 255 then
                break
            elseif currentByte == 130 then
                digit = true
            elseif currentByte == 129 or currentByte == 130 then
                symbol = true
            else
                if digit then
                    digit = false
                    common.seedName = common.seedName .. (currentByte - 79);
                elseif symbol then
                    symbol = false
                    if constants.characterMap[currentByte] then
                        common.seedName = common.seedName .. constants.characterMap[currentByte]
                    end
                elseif currentByte > 0 then
                    common.seedName = common.seedName .. string.char(currentByte);
                end
            end
        end
    end

    --get preset from ram
    if common.preset == "none" and gameinfo.getromhash() ~= "" and mainmemory.readbyte(constants.ramAddresses.gameStatus) == 8 then
        local digit = false
        local symbol = false
        common.preset = ""
        for i = 0, 20, 1 do
            local currentByte = mainmemory.readbyte(constants.ramAddresses.presetStartAddress + i)
            if currentByte == 255 then
                break
            elseif currentByte == 130 then
                digit = true
            elseif currentByte == 129 or currentByte == 130 then
                symbol = true
            else
                if digit then
                    digit = false
                    common.preset = common.preset .. (currentByte - 79);
                elseif symbol then
                    symbol = false
                    common.preset = common.preset .. constants.characterMap[currentByte]
                elseif currentByte > 0 then
                    common.preset = common.preset .. string.char(currentByte);
                end
            end
        end

        common.preset = common.preset:gsub(" tournament", "")
        common.preset = common.preset:gsub(" tourname", "")

        local successful 
        local presetFile

        if common.preset ~= "safe" and common.preset ~= "scavenger" and common.preset ~= "glitch" and common.preset ~= "empty-hand" then
            successful, presetFile = pcall(function()
                return dofile("Presets\\" .. common.preset .. ".lua")
            end)
        
            if not successful then
                print("Preset file: " .. common.preset .. ".lua could not be loaded.")
            end
        end

        if presetFile and presetFile.locations then
            for i = 1, #presetFile.locations, 1 do
                if presetFile.locations[i].reachable then
                    locations[presetFile.locations[i].index].reachable = true
                end
                if presetFile.locations[i].skip then
                    locations[presetFile.locations[i].index].skip = true
                end
                if presetFile.locations[i].allowed then
                        locations[presetFile.locations[i].index].allowed = presetFile.locations[i].allowed
                end
                if presetFile.locations[i].locks then
                    locations[presetFile.locations[i].index].locks = presetFile.locations[i].locks
                end
            end
        end

        if presetFile and presetFile.relics then
            for i = 1, #presetFile.relics, 1 do
                relics[presetFile.relics[i].index].progression = true
            end
        end

        if presetFile and presetFile.squareLocations ~= nil then
            common.squareLocations = presetFile.squareLocations
        end

        if presetFile and presetFile.newLocationsFirstCastle then
            for i = 1, #presetFile.newLocationsFirstCastle, 1 do
                table.insert(locations, 2, presetFile.newLocationsFirstCastle[i])
            end
            common.secondCastleStart = common.secondCastleStart + #presetFile.newLocationsFirstCastle
        end

        if presetFile and presetFile.newLocationsSecondCastle then
            for i = 1, #presetFile.newLocationsSecondCastle, 1 do
                table.insert(locations, presetFile.newLocationsSecondCastle[i])
            end
        end

        if #common.seedName + #common.preset > 24 and #common.seedName + #common.preset < 28 then
            common.fontSize = 18
        elseif #common.seedName + #common.preset > 27 and #common.seedName + #common.preset < 32 then
            common.fontSize = 16
        elseif #common.seedName + #common.preset > 31 and #common.seedName + #common.preset < 36 then
            common.fontSize = 14
        elseif #common.seedName + #common.preset > 35 then
            common.fontSize = 12
        end

        drawSeedName()
    end

    if common.gameInMainMenu == false and gameinfo.getromhash() ~= "" and mainmemory.readbyte(constants.ramAddresses.gameStatus) ~= 2 then
        common.gameInMainMenu = true
        common.gameReset = false
    end

    if common.gameReset == true then
        common.gameReset = false
        resetAllValues()
        drawSeedName()
    end

    if common.gameInMainMenu == true and mainmemory.readbyte(constants.ramAddresses.gameStatus) == 2 then
        common.gameReset = true
        common.gameInMainMenu = false
    end

    if common.alucardModeStarted then
        if memory.readbyte(constants.ramAddresses.mapOpenAddress) == 1 then
            drawLocations()
        end
        if emu.framecount() % 120 == 0 then
            if mainmemory.read_u16_le(constants.ramAddresses.alucardRoomsCountAddress) > common.alucardRooms then
                common.alucardRooms = mainmemory.read_u16_le(constants.ramAddresses.alucardRoomsCountAddress)
                detectLocations()
            end
            detectItems()
            detectRelics()
        end
    else
        if emu.framecount() > 4200 and emu.framecount() % 120 == 0 and common.gameInMainMenu == false then
            checkAlucardModeStart()
        end
    end

    emu.frameadvance()
end