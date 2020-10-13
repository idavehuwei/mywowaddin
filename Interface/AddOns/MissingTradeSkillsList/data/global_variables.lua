-------------------------------------------
-- Creates all global variables for DATA --
-------------------------------------------

-- Holds all the data filled by the data luas
MTSL_DATA = {
    -- Each profession has 4 ranks to learn (1-75, 75-150, 150-225, 225-300), execpt poisons (only 1)
    ["AMOUNT_RANKS"] = {
        ["Alchemy"] = 4,
        ["Blacksmithing"] = 4,
        ["Cooking"] = 4,
        ["Enchanting"] = 4,
        ["Engineering"] = 4,
        ["First Aid"] = 4,
        ["Leatherworking"] = 4,
        ["Mining"] = 4,
        ["Poisons"] = 1,
        ["Tailoring"] = 4,
    },
    -- Counters keeping track of total amount of skill (this includes AMOUNT_TRADESKILL_LEVELS)
    ["AMOUNT_SKILLS_PHASE_1"] = {
        ["Tailoring"] = {
            ["no_specialisation"] = 197,
        },
        ["Blacksmithing"] = {
            [9788] = 21,
            ["no_specialisation"] = 171,
            [9787] = 13,
            -- added numbers of Weaponsmith as well
            [17040] = 21,
            [17041] = 21,
            [17039] = 22,
        },
        ["Alchemy"] = {
            ["no_specialisation"] = 109,
        },
        ["Mining"] = {
            ["no_specialisation"] = 15,
        },
        ["First Aid"] = {
            ["no_specialisation"] = 16,
        },
        ["Cooking"] = {
            ["no_specialisation"] = 82,
        },
        ["Engineering"] = {
            [20219] = 16,
            ["no_specialisation"] = 143,
            [20222] = 16,
        },
        ["Leatherworking"] = {
            [10656] = 16,
            ["no_specialisation"] = 165,
            [10660] = 20,
            [10658] = 14,
        },
        ["Poisons"] = {
            ["no_specialisation"] = 21,
        },
        ["Enchanting"] = {
            ["no_specialisation"] = 130,
        },
    },
    ["AMOUNT_SKILLS_PHASE_2"] = {
        ["Tailoring"] = {
            ["no_specialisation"] = 203,
        },
        ["Blacksmithing"] = {
            [9788] = 24,
            ["no_specialisation"] = 171,
            [9787] = 13,
            -- added numbers of Weaponsmith as well
            [17040] = 21,
            [17041] = 21,
            [17039] = 22,
        },
        ["Alchemy"] = {
            ["no_specialisation"] = 109,
        },
        ["Mining"] = {
            ["no_specialisation"] = 15,
        },
        ["First Aid"] = {
            ["no_specialisation"] = 16,
        },
        ["Cooking"] = {
            ["no_specialisation"] = 83,
        },
        ["Engineering"] = {
            [20219] = 16,
            ["no_specialisation"] = 144,
            [20222] = 16,
        },
        ["Leatherworking"] = {
            [10656] = 17,
            ["no_specialisation"] = 171,
            [10660] = 21,
            [10658] = 14,
        },
        ["Poisons"] = {
            ["no_specialisation"] = 21,
        },
        ["Enchanting"] = {
            ["no_specialisation"] = 130,
        },
    },
    ["AMOUNT_SKILLS_PHASE_3"] = {
        ["Tailoring"] = {
            ["no_specialisation"] = 209,
        },
        ["Blacksmithing"] = {
            [9788] = 26,
            ["no_specialisation"] = 175,
            [9787] = 15,
            -- added numbers of Weaponsmith as well
            [17040] = 24,
            [17041] = 24,
            [17039] = 25,
        },
        ["Alchemy"] = {
            ["no_specialisation"] = 109,
        },
        ["Mining"] = {
            ["no_specialisation"] = 16,
        },
        ["First Aid"] = {
            ["no_specialisation"] = 17,
        },
        ["Cooking"] = {
            ["no_specialisation"] = 83,
        },
        ["Engineering"] = {
            [20219] = 16,
            ["no_specialisation"] = 144,
            [20222] = 16,
        },
        ["Leatherworking"] = {
            [10656] = 18,
            ["no_specialisation"] = 176,
            [10660] = 22,
            [10658] = 15,
        },
        ["Poisons"] = {
            ["no_specialisation"] = 21,
        },
        ["Enchanting"] = {
            ["no_specialisation"] = 136,
        },
    },
    ["AMOUNT_SKILLS_PHASE_4"] = {
        ["Tailoring"] = {
            ["no_specialisation"] = 215,
        },
        ["Blacksmithing"] = {
            [9788] = 27,
            ["no_specialisation"] = 184,
            [9787] = 15,
            -- added numbers of Weaponsmith as well
            [17040] = 24,
            [17041] = 24,
            [17039] = 25,
        },
        ["Alchemy"] = {
            ["no_specialisation"] = 113,
        },
        ["Mining"] = {
            ["no_specialisation"] = 16,
        },
        ["First Aid"] = {
            ["no_specialisation"] = 17,
        },
        ["Cooking"] = {
            ["no_specialisation"] = 83,
        },
        ["Engineering"] = {
            [20219] = 16,
            ["no_specialisation"] = 146,
            [20222] = 16,
        },
        ["Leatherworking"] = {
            [10656] = 18,
            ["no_specialisation"] = 181,
            [10660] = 22,
            [10658] = 15,
        },
        ["Poisons"] = {
            ["no_specialisation"] = 21,
        },
        ["Enchanting"] = {
            ["no_specialisation"] = 136,
        },
    },
    ["AMOUNT_SKILLS_PHASE_5"] = {
        ["Tailoring"] = {
            ["no_specialisation"] = 226,
        },
        ["Blacksmithing"] = {
            [9788] = 28,
            ["no_specialisation"] = 193,
            [9787] = 15,
            -- added numbers of Weaponsmith as well
            [17040] = 25,
            [17041] = 24,
            [17039] = 26,
        },
        ["Alchemy"] = {
            ["no_specialisation"] = 115,
        },
        ["Mining"] = {
            ["no_specialisation"] = 16,
        },
        ["First Aid"] = {
            ["no_specialisation"] = 17,
        },
        ["Cooking"] = {
            ["no_specialisation"] = 85,
        },
        ["Engineering"] = {
            [20219] = 16,
            ["no_specialisation"] = 146,
            [20222] = 16,
        },
        ["Leatherworking"] = {
            [10656] = 19,
            ["no_specialisation"] = 190,
            [10660] = 22,
            [10658] = 16,
        },
        ["Poisons"] = {
            ["no_specialisation"] = 22,
        },
        ["Enchanting"] = {
            ["no_specialisation"] = 155,
        },
    },
    ["AMOUNT_SKILLS_PHASE_6"] = {
        ["Tailoring"] = {
            ["no_specialisation"] = 230,
        },
        ["Blacksmithing"] = {
            ["no_specialisation"] = 196,
            [9788] = 28,
            [9787] = 15,
            -- added numbers of Weaponsmith as well
            [17040] = 25,
            [17041] = 24,
            [17039] = 26,
        },
        ["Alchemy"] = {
            ["no_specialisation"] = 115,
        },
        ["Mining"] = {
            ["no_specialisation"] = 16,
        },
        ["First Aid"] = {
            ["no_specialisation"] = 17,
        },
        ["Cooking"] = {
            ["no_specialisation"] = 85,
        },
        ["Engineering"] = {
            [20219] = 16,
            ["no_specialisation"] = 146,
            [20222] = 16,
        },
        ["Leatherworking"] = {
            [10656] = 19,
            ["no_specialisation"] = 196,
            [10660] = 22,
            [10658] = 16,
        },
        ["Poisons"] = {
            ["no_specialisation"] = 22,
        },
        ["Enchanting"] = {
            ["no_specialisation"] = 155,
        },
    },
    MIN_PATCH_LEVEL = 1,
    CURRENT_PATCH_LEVEL = 3,
    MAX_PATCH_LEVEL = 6,
}