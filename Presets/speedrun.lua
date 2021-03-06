local differences = {
    locations = {
        {
            index = 1,
            locks = {{"FORM_OF_MIST"}},
        }, {
            index = 2,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"},
             {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}, {"GRAVITY_BOOTS", "THRUST_SWORD"}},
            allowed = {{"FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            index = 3,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, 
            {"GRAVITY_BOOTS", "FORM_OF_MIST"}, {"FORM_OF_MIST", "POWER_OF_MIST"}}
        }, {
            index = 5,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"},
             {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}, {"GRAVITY_BOOTS", "THRUST_SWORD"}}
        }, {
            index = 6,
            allowed = {{"FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            index = 7,
            locks = {{"SOUL_OF_BAT"}, {"SOUL_OF_WOLF"}, {"FORM_OF_MIST"}, {"GRAVITY_BOOTS"}, {"LEAP_STONE"}, {"THRUST_SWORD"}}
        }, {
            index = 8,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"}, 
            {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}, {"GRAVITY_BOOTS", "THRUST_SWORD"}},
            allowed = {{"FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            name = "Gravity Boots",--11
            index = 11,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"}, 
            {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}, {"GRAVITY_BOOTS", "THRUST_SWORD"}}
        }, {
            index = 12,
            locks = {},
            reachable = true
        }, {
            index = 17,
            allowed = {{"FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            index = 18,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"},
             {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}, {"GRAVITY_BOOTS", "THRUST_SWORD"}},
            allowed = {{"FORM_OF_MIST", "SOUL_OF_WOLF"}}
        }, {
            index = 19,
            locks = {{"SOUL_OF_BAT"}, {"SOUL_OF_WOLF"}, {"FORM_OF_MIST"}, {"GRAVITY_BOOTS"}, {"LEAP_STONE"}, {"THRUST_SWORD"}}
        }, {
            index = 20,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "LEAP_STONE"},  {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"}, 
             {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "POWER_OF_WOLF"},
            {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "SKILL_OF_WOLF"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}}
        }, {
            index = 21,
            locks = {{"SOUL_OF_BAT"}, {"GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"GRAVITY_BOOTS", "FORM_OF_MIST"}, 
            {"GRAVITY_BOOTS", "LEAP_STONE"}, {"FORM_OF_MIST", "POWER_OF_MIST"}, {"GRAVITY_BOOTS", "THRUST_SWORD"}}
        }, {
            index = 23,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "LEAP_STONE"},  {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"},
              {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "POWER_OF_WOLF"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "SKILL_OF_WOLF"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}}
        }, {
            index = 24,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "SOUL_OF_WOLF"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "LEAP_STONE"},  {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "FORM_OF_MIST"}, 
             {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "LEAP_STONE", "FORM_OF_MIST"}, {"JEWEL_OF_OPEN", "SOUL_OF_WOLF", "SKILL_OF_WOLF"}, {"JEWEL_OF_OPEN", "GRAVITY_BOOTS", "THRUST_SWORD"}}
        }, {
            index = 25,
            locks = {{"JEWEL_OF_OPEN", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "SPIKE_BREAKER", "LEAP_STONE"}, {"JEWEL_OF_OPEN", "SPIKE_BREAKER"}, {"JEWEL_OF_OPEN", "SPIKE_BREAKER", "THRUST_SWORD", "FORM_OF_MIST"}}
        }, {
            index = 26,
            locks = {{"JEWEL_OF_OPEN", "FORM_OF_MIST", "POWER_OF_MIST"}, {"JEWEL_OF_OPEN", "FORM_OF_MIST", "SOUL_OF_BAT"}, {"JEWEL_OF_OPEN", "SPIKE_BREAKER", "FORM_OF_MIST"}}
        }
    },
    --set relics as progression
    relics = {
        {
            index = 6
        },
        {
            index = 7
        }
    }
}

return differences