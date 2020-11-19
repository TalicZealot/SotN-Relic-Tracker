local differences = {
    relics = {
        {
            index = 22
        }, {
            index = 25
        }, {
            index = 11
        }, {
            index = 7
        },
    },
    newLocationsFirstCastle = {
        {
            name = "Walk Armor",
            status = false,
            mapTiles = {{address = 0x06BE99, values = {21, 85}}},
            mapX = 186,
            mapY = 364,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "LEAP_STONE"},  {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"},
            {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "POWER_OF_WOLF"}},
            allowed = {{"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}}
        }, {
            name = "Icebrand",
            status = false,
            mapTiles = {{address = 0x06BE9A, values = {80, 84, 85}}},
            mapX = 194,
            mapY = 364,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "LEAP_STONE"},  {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"},
            {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "POWER_OF_WOLF"}},
            allowed = {{"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}}
        }, {
            name = "Balroom Mask",
            status = false,
            mapTiles = {{address = 0x06BE9A, values = {4, 20, 84}}},
            mapX = 210,
            mapY = 364,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "LEAP_STONE"},  {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"},
            {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "POWER_OF_WOLF"}},
            allowed = {{"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}}
        }, {
            name = "Bloodstone",
            status = false,
            mapTiles = {{address = 0x06BE9B, values = {85}}},
            mapX = 226,
            mapY = 364,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "LEAP_STONE"},  {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"},
            {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "POWER_OF_WOLF"}},
            allowed = {{"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}}
        }, {
            name = "Combat Knife",
            status = false,
            mapTiles = {{address = 0x06BE7B, values = {1}}},
            mapX = 250,
            mapY = 348,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "LEAP_STONE"},  {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"},
            {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "POWER_OF_WOLF"}},
            allowed = {{"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}}
        }, {
            name = "Ring of Ares",
            status = false,
            mapTiles = {{address = 0x06BE0D, values = {16, 17, 80}}},
            mapX = 298,
            mapY = 292,
            locks = {{"DEMON_CARD", "JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"DEMON_CARD", "JEWEL_OF_OPEN", "LEAP_STONE"},  {"DEMON_CARD", "JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"},
            {"DEMON_CARD", "JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"DEMON_CARD", "JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"DEMON_CARD", "JEWEL_OF_OPEN", "SOUL_OF_WOLF", "POWER_OF_WOLF"},
            {"NOSEDEVIL_CARD", "JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"NOSEDEVIL_CARD", "JEWEL_OF_OPEN", "LEAP_STONE"},  {"NOSEDEVIL_CARD", "JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"},
            {"NOSEDEVIL_CARD", "JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"NOSEDEVIL_CARD", "JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"NOSEDEVIL_CARD", "JEWEL_OF_OPEN", "SOUL_OF_WOLF", "POWER_OF_WOLF"}},
            allowed = {{"DEMON_CARD", "JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}, {"NOSEDEVIL_CARD", "JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}}
        }, {
            name = "Knuckle Duster",
            status = false,
            mapTiles = {{address = 0x06BE0E, values = {64, 85}}},
            mapX = 322,
            mapY = 300,
            locks = {{"JEWEL_OF_OPEN"}}
        }, {
            name = "Onyx Caverns",
            status = false,
            mapTiles = {{address = 0x06BE0F, values = {64, 80, 84, 85}}},
            mapX = 370,
            mapY = 292,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "LEAP_STONE"},  {"JEWEL_OF_OPEN", "GRAVITY_BOOTS"},{"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"}}
        }, {
            name = "Scimitar",
            status = false,
            mapTiles = {{address = 0x06BDEF, values = {80}}},
            mapX = 362,
            mapY = 276,
            locks = {{"JEWEL_OF_OPEN"}}
        }, {
            name = "Moonstone",
            status = false,
            mapTiles = {{address = 0x06BD8F, values = {64, 80}}},
            mapX = 354,
            mapY = 228,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "LEAP_STONE"}},
            allowed = {{"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "LEAP_STONE", "FORM_OF_MIST"}}
        }, {
            name = "Claymore",
            status = false,
            mapTiles = {{address = 0x06BD4E, values = {85}}},
            mapX = 346,
            mapY = 196,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "LEAP_STONE"}},
            allowed = {{"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "LEAP_STONE", "FORM_OF_MIST"}}
        }, {
            name = "Bandana",
            status = false,
            mapTiles = {{address = 0x06BD2C, values = {1}}},
            mapX = 282,
            mapY = 180,
            locks = {{"JEWEL_OF_OPEN"}}
        }, {
            name = "Nunchaku",
            status = false,
            mapTiles = {{address = 0x06BDCD, values = {21, 85, 5}}},
            mapX = 306,
            mapY = 268,
            locks = {{"JEWEL_OF_OPEN", "HOLY_SYMBOL"}},
            allowed = {{"JEWEL_OF_OPEN"}}
        }, {
            name = "Secret Boots",
            status = false,
            mapTiles = {{address = 0x06BDE9, values = {17, 81, 85}}},
            mapX = 194,
            mapY = 276,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "LEAP_STONE", "GRAVITY_BOOTS"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}}
        }, {
            name = "Herald Shield",
            status = false,
            mapTiles = {{address = 0x06BDC9, values = {5, 69}}},
            mapX = 178,
            mapY = 260,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "LEAP_STONE"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "POWER_OF_WOLF"}}
        }, {
            name = "Holy Mail",
            status = false,
            mapTiles = {{address = 0x06BDD5, values = {20}}},
            mapX = 42,
            mapY = 268,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"GRAVITY_BOOTS", "THRUST_SWORD"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"}}
        }, {
            name = "Jewel Sword",
            status = false,
            mapTiles = {{address = 0x06BE06, values = {5}}},
            mapX = 82,
            mapY = 292,
            locks = {{"SOUL_OF_BAT", "SOUL_OF_WOLF"}}
        }, {
            name = "Hide Cuirass",
            status = false,
            mapTiles = {{address = 0x06BDB7, values = {5}}},
            mapX = 114,
            mapY = 252,
            locks = {},
            reachable = true
        }, {
            name = "Leather Shield",
            status = false,
            mapTiles = {{address = 0x06BDB7, values = {5}}},
            mapX = 106,
            mapY = 244,
            locks = {},
            reachable = true
        }, {
            name = "Sunglasses",
            status = false,
            mapTiles = {{address = 0x06BD68, values = {80}}},
            mapX = 130,
            mapY = 212,
            locks = {},
            reachable = true
        }, {
            name = "Basilard",
            status = false,
            mapTiles = {{address = 0x06BD98, values = {63, 64, 80}}},
            mapX = 130,
            mapY = 236,
            locks = {},
            reachable = true
        }, {
            name = "Cloth Cape",
            status = false,
            mapTiles = {{address = 0x06BD46, values = {5, 69}}},
            mapX = 82,
            mapY = 196,
            locks = {},
            reachable = true
        }, {
            name = "Mystic Pendant",
            status = false,
            mapTiles = {{address = 0x06BD15, values = {80}}},
            mapX = 34,
            mapY = 172,
            locks = {{"SOUL_OF_BAT"}, {"LEAP_STONE"},  {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"JEWEL_OF_OPEN", "FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            name = "Ankh of Life",
            status = false,
            mapTiles = {{address = 0x06BCF5, values = {5, 21}}},
            mapX = 50,
            mapY = 156,
            locks = {{"SOUL_OF_BAT"}, {"LEAP_STONE"},  {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"JEWEL_OF_OPEN", "FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            name = "Morningstar",
            status = false,
            mapTiles = {{address = 0x06BCC6, values = {21, 85,  84}}, {address = 0x06BCD6, values = {21, 85,  84}}},
            mapX = 66,
            mapY = 132,
            locks = {{"SOUL_OF_BAT"}, {"LEAP_STONE"},  {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"JEWEL_OF_OPEN", "FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            name = "Goggles",
            status = false,
            mapTiles = {{address = 0x06BCC6, values = {5, 4, 21, 84, 85}}},
            mapX = 82,
            mapY = 132,
            locks = {{"JEWEL_OF_OPEN"}, {"SOUL_OF_BAT"}, {"LEAP_STONE"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"JEWEL_OF_OPEN", "FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            name = "Silver Plate",
            status = false,
            mapTiles = {{address = 0x06BC47, values = {4, 5}}},
            mapX = 114,
            mapY = 60,
            locks = {{"JEWEL_OF_OPEN"}, {"SOUL_OF_BAT"}, {"LEAP_STONE"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"JEWEL_OF_OPEN", "FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            name = "Cutlass",
            status = false,
            mapTiles = {{address = 0x06BC2B, values = {64, 5}}, {address = 0x06BC2A, values = {1}}},
            mapX = 218,
            mapY = 44,
            locks = {{"JEWEL_OF_OPEN"}, {"SOUL_OF_BAT"}, {"LEAP_STONE"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"JEWEL_OF_OPEN", "FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            name = "Platinum Mail",
            status = false,
            mapTiles = {{address = 0x06BBDC, values = {5, 21}}},
            mapX = 282,
            mapY = 12,
            locks = {{"SOUL_OF_BAT"}, {"LEAP_STONE"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"FORM_OF_MIST", "SOUL_OF_WOLF"}, {"FORM_OF_MIST", "THRUST_SWORD"}}
        }, {
            name = "Falchion",
            status = false,
            mapTiles = {{address = 0x06BBFD, values = {5, 85}}},
            mapX = 314,
            mapY = 28,
            locks = {{"SOUL_OF_BAT"}, {"LEAP_STONE"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            name = "Gear Puzzle",
            status = false,
            mapTiles = {{address = 0x06BC60, values = {21}}},
            mapX = 394,
            mapY = 76,
            locks = {{"SOUL_OF_BAT"}, {"LEAP_STONE"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowedReachable = true
        }, {
            name = "Shaman Shield",
            status = false,
            mapTiles = {{address = 0x06BC61, values = {1, 84, 85, 4}}, {address = 0x06BC51, values = {21, 1, 4, 5, 85}},
             {address = 0x06BC52, values = {64, 85}}},
            mapX = 446,
            mapY = 76,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            name = "Gladius",
            status = false,
            mapTiles = {{address = 0x06BCF2, values = {1, 5, 21, 85}}},
            mapX = 474,
            mapY = 184,
            locks = {},
            reachable = true
        }, {
            name = "Jewel Knuckles",
            status = false,
            mapTiles = {{address = 0x06BD32, values = {1, 85}}},
            mapX = 474,
            mapY = 180,
            locks = {},
            reachable = true
        }, {
            name = "Bronze Cuirass",
            status = false,
            mapTiles = {{address = 0x06BCD0, values = {21, 85}}},
            mapX = 394,
            mapY = 132,
            locks = {},
            reachable = true
        }, {
            name = "Holy Rod",
            status = false,
            mapTiles = {{address = 0x06BCA0, values = {84, 85}}},
            mapX = 402,
            mapY = 108,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"FORM_OF_MIST", "SOUL_OF_WOLF"}}
        },  {
            name = "Onyx Library",
            status = false,
            mapTiles = {{address = 0x06BCCF, values = {84, 85}}},
            mapX = 378,
            mapY = 132,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"SOUL_OF_WOLF"}, {"FORM_OF_MIST"}, {"THRUST_SWORD"}}
        }, {
            name = "Alucart",
            status = false,
            mapTiles = {{address = 0x06BD0C, values = {84}}},
            mapX = 274,
            mapY = 164,
            locks = {{"CUBE_OF_ZOE", "SOUL_OF_BAT"}, {"CUBE_OF_ZOE", "GRAVITY_BOOTS"}, {"CUBE_OF_ZOE", "FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"CUBE_OF_ZOE", "THRUST_SWORD"}, {"CUBE_OF_ZOE", "SOUL_OF_WOLF"}, {"CUBE_OF_ZOE", "FORM_OF_MIST"}}
        }, {
            name = "Broadsword",
            status = false,
            mapTiles = {{address = 0x06BCDC, values = {64}}},
            mapX = 258,
            mapY = 140,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"THRUST_SWORD"}, {"SOUL_OF_WOLF"}, {"FORM_OF_MIST"}}
        }, {
            name = "Estoc",
            status = false,
            mapTiles = {{address = 0x06BC9C, values = {1, 5, 81}}},
            mapX = 242,
            mapY = 84,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"GRAVITY_BOOTS", "THRUST_SWORD"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"}}
        }, {
            name = "Garnet Olrox",
            status = false,
            mapTiles = {{address = 0x06BC9C, values = {80, 81}}},
            mapX = 266,
            mapY = 108,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"GRAVITY_BOOTS", "THRUST_SWORD"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"}}
        }, {
            name = "Holy Sword",
            status = false,
            mapTiles = {{address = 0x06BCB8, values = {1}}},
            mapX = 154,
            mapY = 124,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            name = "Knight Shield",
            status = false,
            mapTiles = {{address = 0x06BCD7, values = {5, 21, 69, 85}}},
            mapX = 114,
            mapY = 140,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"THRUST_SWORD"}, {"SOUL_OF_WOLF"}, {"FORM_OF_MIST"}}
        }, {
            name = "Shield Rod",
            status = false,
            mapTiles = {{address = 0x06BCF7, values = {21}}},
            mapX = 106,
            mapY = 156,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"THRUST_SWORD"}, {"SOUL_OF_WOLF"}, {"FORM_OF_MIST"}}
        }, {
            name = "Blood Cloak",
            status = false,
            mapTiles = {{address = 0x06BCF9, values = {80, 84, 85}}},
            mapX = 162,
            mapY = 156,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS"}, {"FORM_OF_MIST", "POWER_OF_MIST"}},
            allowed = {{"THRUST_SWORD"}, {"SOUL_OF_WOLF"}, {"FORM_OF_MIST"}}
        }
    },
    newLocationsSecondCastle = {
        {
            name = "Bastard Sword",
            status = false,
            mapTiles = {{address = 0x06C30B, values = {20, 84}}},
            mapX = 240,
            mapY = 386,
            locks = {},
            reachable = true
        }, {
            name = "Royal Cloak",
            status = false,
            mapTiles = {{address = 0x06C30B, values = {80, 84, 85}}},
            mapX = 224,
            mapY = 386,
            locks = {},
            reachable = true
        }, {
            name = "Lightning Mail",
            status = false,
            mapTiles = {{address = 0x06C2BA, values = {80, 84, 85}}},
            mapX = 192,
            mapY = 346,
            locks = {},
            reachable = true
        }, {
            name = "Sword of Dawn",
            status = false,
            mapTiles = {{address = 0x06C2BC, values = {64, 65}}, {address = 0x06C2BB, values = {21, 85}},},
            mapX = 256,
            mapY = 346,
            locks = {},
            reachable = true
        }, {
            name = "Moon Rod",
            status = false,
            mapTiles = {{address = 0x06C2B9, values = {80, 84, 85}}},
            mapX = 256,
            mapY = 346,
            locks = {},
            reachable = true
        }, {
            name = "Sunstone",
            status = false,
            mapTiles = {{address = 0x06C287, values = {84, 4}}},
            mapX = 112,
            mapY = 322,
            locks = {},
            reachable = true
        }, {
            name = "Luminus",
            status = false,
            mapTiles = {{address = 0x06C296, values = {64, 80, 84, 85}}},
            mapX = 64,
            mapY = 328,
            locks = {},
            reachable = true
        }, {
            name = "Dragon Helm",
            status = false,
            mapTiles = {{address = 0x06C2B5, values = {80, 84, 85}}},
            mapX = 32,
            mapY = 346,
            locks = {},
            reachable = true
        }, {
            name = "Shotel",
            status = false,
            mapTiles = {{address = 0x06C1B5, values = {64}}},
            mapX = 32,
            mapY = 218,
            locks = {{"FORM_OF_MIST"}}
        }, {
            name = "Badelaire",
            status = false,
            mapTiles = {{address = 0x06C247, values = {21}}},
            mapX = 104,
            mapY = 290,
            locks = {},
            reachable = true
        }, {
            name = "Staroulite",
            status = false,
            mapTiles = {{address = 0x06C218, values = {85}}},
            mapX = 118,
            mapY = 264,
            locks = {{"FORM_OF_MIST"}}
        },{
            name = "Diamond Rev Caverns",
            status = false,
            mapTiles = {{address = 0x06C1BB, values = {64, 65}}},
            mapX = 224,
            mapY = 218,
            locks = {},
            reachable = true
        }, {
            name = "Opal Rev Caverns",
            status = false,
            mapTiles = {{address = 0x06C16A, values = {68, 84, 85, 20}}},
            mapX = 208,
            mapY = 178,
            locks = {},
            reachable = true
        }, {
            name = "Garnet Rev Caverns",
            status = false,
            mapTiles = {{address = 0x06C11E, values = {80}}},
            mapX = 328,
            mapY = 138,
            locks = {},
            reachable = true
        }, {
            name = "Osafune Katana",
            status = false,
            mapTiles = {{address = 0x06C0CD, values = {5}}},
            mapX = 304,
            mapY = 98,
            locks = {},
            reachable = true
        }, {
            name = "Alucard Shield",
            status = false,
            mapTiles = {{address = 0x06C0D1, values = {85}}},
            mapX = 440,
            mapY = 98,
            locks = {},
            reachable = true
        }, {
            name = "Alucard Sword",
            status = false,
            mapTiles = {{address = 0x06C0AC, values = {84, 85}}},
            mapX = 272,
            mapY = 82,
            locks = {},
            reachable = true
        }, {
            name = "Necklace of J",
            status = false,
            mapTiles = {{address = 0x06C04D, values = {21}}},
            mapX = 312,
            mapY = 34,
            locks = {},
            reachable = true
        }, {
            name = "Diamond Rev Catacombs",
            status = false,
            mapTiles = {{address = 0x06C04E, values = {84, 85}}},
            mapX = 320,
            mapY = 34,
            locks = {},
            reachable = true
        }, {
            name = "Talwar",
            status = false,
            mapTiles = {{address = 0x06C2AE, values = {1}}},
            mapX = 352,
            mapY = 346,
            locks = {},
            reachable = true
        }, {
            name = "Twilight Cloak",
            status = false,
            mapTiles = {{address = 0x06C281, values = {84, 85}}},
            mapX = 440,
            mapY = 314,
            locks = {{"FORM_OF_MIST", "SOUL_OF_BAT"}, {"FORM_OF_MIST", "POWER_OF_MIST"}}
        }, {
            name = "Alucard Mail",
            status = false,
            mapTiles = {{address = 0x06C24B, values = {5, 69, 85}}},
            mapX = 240,
            mapY = 290,
            locks = {},
            reachable = true
        }, {
            name = "Sword of Hador",
            status = false,
            mapTiles = {{address = 0x06C20B, values = {1}}},
            mapX = 248,
            mapY = 258,
            locks = {},
            reachable = true
        }, {
            name = "Fury Plate",
            status = false,
            mapTiles = {{address = 0x06C22F, values = {64, 85}}},
            mapX = 352,
            mapY = 274,
            locks = {},
            reachable = true
        }, {
            name = "Gram",
            status = false,
            mapTiles = {{address = 0x06C1EE, values = {5, 85, 21}}},
            mapX = 344,
            mapY = 242,
            locks = {},
            reachable = true
        }, {
            name = "Goddess Shield",
            status = false,
            mapTiles = {{address = 0x06C17F, values = {5}}},
            mapX = 376,
            mapY = 186,
            locks = {},
            reachable = true
        }, {
            name = "Katana",
            status = false,
            mapTiles = {{address = 0x06C130, values = {1}}},
            mapX = 408,
            mapY = 146,
            locks = {},
            reachable = true
        }, {
            name = "Talisman",
            status = false,
            mapTiles = {{address = 0x06C11E, values = {1, 81}}},
            mapX = 344,
            mapY = 138,
            locks = {},
            reachable = true
        }, {
            name = "Beryl Circlet",
            status = false,
            mapTiles = {{address = 0x06C0E1, values = {80}}},
            mapX = 424,
            mapY = 106,
            locks = {{"SOUL_OF_BAT", "SOUL_OF_WOLF"}}
        }
    },
    squareLocations = false
}

return differences