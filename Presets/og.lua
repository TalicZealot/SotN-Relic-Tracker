local differences = {
    locations = {
        {
            index = 22,
            locks = {{"FORM_OF_MIST"}},
            skip = true
        }, {
            index = 23,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"},
             {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}, {"GRAVITY_BOOTS", "THRUST_SWORD"}},
            allowed = {{"FORM_OF_MIST", "SOUL_OF_WOLF"}},
            skip = true
        }, {
            index = 26,
            locks = {{"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST", "SPIKE_BREAKER"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "SOUL_OF_BAT", "SPIKE_BREAKER"}, {"JEWEL_OF_OPEN", "SPIKE_BREAKER", "FORM_OF_MIST"}},
            allowed = {},
        }, {
            index = 35,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"},
             {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}, {"GRAVITY_BOOTS", "THRUST_SWORD"}},
             skip = true
        }, {
            index = 36,
            allowed = {{"FORM_OF_MIST", "SOUL_OF_WOLF"}},
            skip = true
        }, {
            index = 37,
            locks = {{"SOUL_OF_BAT"}, {"SOUL_OF_WOLF"}, {"FORM_OF_MIST"}, {"GRAVITY_BOOTS"}, {"LEAP_STONE"}, {"THRUST_SWORD"}},
            skip = true
        }
    },
}

return differences