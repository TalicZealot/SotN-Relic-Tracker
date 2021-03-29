local constants = {
  RELIC = {
    SOUL_OF_BAT = 1,
    FIRE_OF_BAT = 2,
    ECHO_OF_BAT = 3,
    FORCE_OF_ECHO = 4,
    SOUL_OF_WOLF = 5,
    POWER_OF_WOLF = 6,
    SKILL_OF_WOLF = 7,
    FORM_OF_MIST = 8,
    POWER_OF_MIST = 9,
    GAS_CLOUD = 10,
    CUBE_OF_ZOE = 11,
    SPIRIT_ORB = 12,
    GRAVITY_BOOTS = 13,
    LEAP_STONE = 14,
    HOLY_SYMBOL = 15,
    FAERIE_SCROLL = 16,
    JEWEL_OF_OPEN = 17,
    MERMAN_STATUE = 18,
    BAT_CARD = 19,
    GHOST_CARD = 20,
    FAERIE_CARD = 21,
    DEMON_CARD = 22,
    SWORD_CARD = 23,
    SPRITE_CARD = 24,
    NOSEDEVIL_CARD = 25,
    HEART_OF_VLAD = 26,
    TOOTH_OF_VLAD = 27,
    RIB_OF_VLAD = 28,
    RING_OF_VLAD = 29,
    EYE_OF_VLAD = 30,
    GOLD_RING = 31,
    SILVER_RING = 32,
    SPIKE_BREAKER = 33,
    HOLY_GLASSES = 34,
    THRUST_SWORD = 35
  },
  ramAddresses = {
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
    locationMapColorAllowed = 0xFF33129c,
    locationMapColorReachable = 0xFF6FD400,
    locationMapColor = 0xFF696969,
    mapBorderColor = 0xFFC0C0C0,
    settingsSubmenuOpenAddress = 0x03D04E,
    seedNameStartAddress = 0x1A78B4,
    presetStartAddress = 0x1A78E1,
  },
  colors = {
    locationMapColorAllowed = 0xFF33129c,
    locationMapColorReachable = 0xFF6FD400,
    locationMapColor = 0xFF696969,
    mapBorderColor = 0xFFC0C0C0,
  },
  characterMap = {
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
}

return constants