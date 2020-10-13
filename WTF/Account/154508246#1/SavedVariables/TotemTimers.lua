
TotemTimers_GlobalSettings = {
	["Sink"] = {
	},
	["Version"] = 11,
	["Profiles"] = {
		["冬天吃栗子"] = {
			{
				["party"] = "default",
				["scenario"] = "default",
				["pvp"] = "default",
				["raid"] = "default",
				["arena"] = "default",
				["none"] = "default",
			}, -- [1]
			{
				["party"] = "default",
				["scenario"] = "default",
				["pvp"] = "default",
				["raid"] = "default",
				["arena"] = "default",
				["none"] = "default",
			}, -- [2]
			{
				["party"] = "default",
				["scenario"] = "default",
				["pvp"] = "default",
				["raid"] = "default",
				["arena"] = "default",
				["none"] = "default",
			}, -- [3]
		},
	},
}
TotemTimers_Profiles = {
	["default"] = {
		["ShowTimerBars"] = true,
		["CrowdControlHex"] = true,
		["EnhanceCDsTimeHeight"] = 12,
		["TimerSpacing"] = 5,
		["EnhanceCDs_Spells"] = {
			{
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
				true, -- [5]
				true, -- [6]
				true, -- [7]
				true, -- [8]
				true, -- [9]
				true, -- [10]
				true, -- [11]
				[20] = true,
			}, -- [1]
			{
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
				true, -- [5]
				true, -- [6]
				true, -- [7]
				true, -- [8]
				true, -- [9]
				true, -- [10]
				true, -- [11]
				true, -- [12]
				[21] = true,
				[22] = true,
				[20] = true,
			}, -- [2]
			{
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
				true, -- [5]
				true, -- [6]
				true, -- [7]
				[20] = true,
			}, -- [3]
		},
		["LastWeaponEnchant"] = "风怒武器",
		["HideInVehicle"] = true,
		["EnhanceCDsOOCAlpha"] = 0.4,
		["TotemTimerBarWidth"] = 36,
		["TooltipsAtButtons"] = true,
		["TimeFont"] = "Friz Quadrata TT",
		["FulminationAura"] = true,
		["FlashRed"] = true,
		["Show"] = true,
		["EnhanceCDs"] = true,
		["EnhanceCDs_Clickthrough"] = false,
		["Warnings"] = {
			["TotemWarning"] = {
				["a"] = 1,
				["b"] = 0,
				["r"] = 1,
				["g"] = 0,
				["text"] = "Totem Expiring",
				["sound"] = "",
				["enabled"] = true,
			},
			["Shield"] = {
				["a"] = 1,
				["b"] = 0,
				["r"] = 1,
				["g"] = 0,
				["text"] = "Shield removed",
				["sound"] = "",
				["enabled"] = true,
			},
			["TotemExpiration"] = {
				["a"] = 1,
				["b"] = 0,
				["r"] = 1,
				["g"] = 0,
				["text"] = "Totem Expired",
				["sound"] = "",
				["enabled"] = true,
			},
			["TotemDestroyed"] = {
				["a"] = 1,
				["b"] = 0,
				["r"] = 1,
				["g"] = 0,
				["text"] = "Totem Destroyed",
				["sound"] = "",
				["enabled"] = true,
			},
			["EarthShield"] = {
				["a"] = 1,
				["b"] = 0,
				["r"] = 1,
				["g"] = 0,
				["text"] = "Shield removed",
				["sound"] = "",
				["enabled"] = true,
			},
			["Maelstrom"] = {
				["a"] = 1,
				["b"] = 0,
				["r"] = 1,
				["g"] = 0,
				["text"] = "Maelstrom Notifier",
				["sound"] = "",
				["enabled"] = true,
			},
			["Weapon"] = {
				["a"] = 1,
				["b"] = 0,
				["r"] = 1,
				["g"] = 0,
				["text"] = "Shield removed",
				["sound"] = "",
				["enabled"] = true,
			},
		},
		["ColorTimerBars"] = false,
		["TimerTimePos"] = "BOTTOM",
		["TimerTimeHeight"] = 12,
		["ShieldLeftButton"] = "闪电之盾",
		["LastOffEnchants"] = {
		},
		["HiddenTotems"] = {
		},
		["Lock"] = false,
		["LavaSurgeAura"] = true,
		["CrowdControlArrange"] = "horizontal",
		["Tracker_Clickthrough"] = false,
		["StopPulse"] = true,
		["TrackerArrange"] = "horizontal",
		["EarthShieldTracker"] = true,
		["AnkhTracker"] = true,
		["CheckRaidRange"] = true,
		["ProcFlash"] = true,
		["EarthShieldButton4"] = "player",
		["FlameShockDurationOnTop"] = false,
		["CrowdControlSize"] = 30,
		["CrowdControlClickthrough"] = false,
		["LavaSurgeGlow"] = true,
		["EnhanceCDsMaelstromHeight"] = 14,
		["CheckPlayerRange"] = true,
		["LongCooldownsArrange"] = "horizontal",
		["ShowKeybinds"] = true,
		["TimerBarTexture"] = "Blizzard",
		["TimerBarColor"] = {
			["a"] = 1,
			["r"] = 0.5,
			["g"] = 0.5,
			["b"] = 1,
		},
		["ShowCooldowns"] = true,
		["TotemMenuSpacing"] = 0,
		["TimerPositions"] = {
			{
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				-50, -- [4]
				-40, -- [5]
			}, -- [1]
			{
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				-70, -- [4]
				0, -- [5]
			}, -- [2]
			{
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				-30, -- [4]
				0, -- [5]
			}, -- [3]
			{
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				-50, -- [4]
				40, -- [5]
			}, -- [4]
		},
		["ESMainTankMenu"] = true,
		["ReverseBarBindings"] = false,
		["ShowOmniCCOnEnhanceCDs"] = true,
		["TrackerTimeHeight"] = 12,
		["TimerSize"] = 32,
		["ShowRaidRangeTooltip"] = true,
		["ActivateHiddenTimers"] = false,
		["CrowdControlTimePos"] = "BOTTOM",
		["FulminationGlow"] = true,
		["ESMainTankMenuDirection"] = "auto",
		["TrackerTimeSpacing"] = 0,
		["TimerTimeSpacing"] = 0,
		["EarthShieldLeftButton"] = "recast",
		["CooldownSpacing"] = 5,
		["TimeColor"] = {
			["r"] = 1,
			["g"] = 1,
			["b"] = 1,
		},
		["TrackerSize"] = 30,
		["Arrange"] = "horizontal",
		["TrackerTimePos"] = "BOTTOM",
		["CrowdControlBindElemental"] = true,
		["ShieldChargesOnly"] = true,
		["TotemSets"] = {
			{
				"灼热图腾", -- [1]
				"石肤图腾", -- [2]
				"治疗之泉图腾", -- [3]
				"根基图腾", -- [4]
			}, -- [1]
			{
				"灼热图腾", -- [1]
				"石肤图腾", -- [2]
				"治疗之泉图腾", -- [3]
				"根基图腾", -- [4]
			}, -- [2]
			{
				"灼热图腾", -- [1]
				"石肤图腾", -- [2]
				"治疗之泉图腾", -- [3]
				"根基图腾", -- [4]
			}, -- [3]
			{
				"灼热图腾", -- [1]
				"石肤图腾", -- [2]
				"治疗之泉图腾", -- [3]
				"风怒图腾", -- [4]
			}, -- [4]
		},
		["TrackerTimerBarWidth"] = 36,
		["Order"] = {
			1, -- [1]
			2, -- [2]
			3, -- [3]
			4, -- [4]
		},
		["EnhanceCDs_Order"] = {
			{
				1, -- [1]
				2, -- [2]
				3, -- [3]
				4, -- [4]
				5, -- [5]
				6, -- [6]
				7, -- [7]
				8, -- [8]
				9, -- [9]
				10, -- [10]
				11, -- [11]
			}, -- [1]
			{
				1, -- [1]
				2, -- [2]
				3, -- [3]
				4, -- [4]
				5, -- [5]
				6, -- [6]
				7, -- [7]
				8, -- [8]
				9, -- [9]
				10, -- [10]
				11, -- [11]
				12, -- [12]
			}, -- [2]
			{
				1, -- [1]
				2, -- [2]
				3, -- [3]
				4, -- [4]
				5, -- [5]
				6, -- [6]
				7, -- [7]
				8, -- [8]
				9, -- [9]
			}, -- [3]
		},
		["MiniIcons"] = true,
		["ESChargesOnly"] = false,
		["ShieldTracker"] = true,
		["WeaponTracker"] = true,
		["MenusAlwaysVisible"] = false,
		["HideBlizzTimers"] = true,
		["EarthShieldTargetName"] = true,
		["CastBarDirection"] = "auto",
		["WeaponMenuOnRightclick"] = false,
		["BarBindings"] = true,
		["WeaponBarDirection"] = "auto",
		["Tooltips"] = true,
		["LastMainEnchants"] = {
			[7730] = {
				"风怒武器", -- [1]
				136018, -- [2]
			},
			[2291] = {
				"风怒武器", -- [1]
				136018, -- [2]
			},
			[6472] = {
				"石化武器", -- [1]
				136086, -- [2]
			},
			[2915] = {
				"风怒武器", -- [1]
				136018, -- [2]
			},
			[1263] = {
				"风怒武器", -- [1]
				136018, -- [2]
			},
			[10750] = {
				"风怒武器", -- [1]
				136018, -- [2]
			},
			[7752] = {
				"石化武器", -- [1]
				136086, -- [2]
			},
			[15278] = {
				"风怒武器", -- [1]
				136018, -- [2]
			},
			[17073] = {
				"风怒武器", -- [1]
				136018, -- [2]
			},
			[2243] = {
				"风怒武器", -- [1]
				136018, -- [2]
			},
			[870] = {
				"风怒武器", -- [1]
				136018, -- [2]
			},
		},
		["TimersOnButtons"] = false,
		["TimeStyle"] = "mm:ss",
		["FramePositions"] = {
			["TotemTimers_CastBar2"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				-199.999984741211, -- [4]
				-225.000030517578, -- [5]
			},
			["TotemTimers_CastBar4"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				49.9999961853027, -- [4]
				-225.000030517578, -- [5]
			},
			["TotemTimers_LongCooldownsFrame"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				150, -- [4]
				-80, -- [5]
			},
			["TotemTimers_EnhanceCDsFrame"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				0, -- [4]
				-170, -- [5]
			},
			["TotemTimers_CastBar3"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				49.9999961853027, -- [4]
				-189.999969482422, -- [5]
			},
			["TotemTimers_CrowdControlFrame"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				-50, -- [4]
				-50, -- [5]
			},
			["TotemTimersFrame"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				137.648330688477, -- [4]
				-120.616874694824, -- [5]
			},
			["TotemTimers_TrackerFrame"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				286.604064941406, -- [4]
				-97.8653945922852, -- [5]
			},
			["TotemTimers_CastBar1"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				-199.999984741211, -- [4]
				-189.999969482422, -- [5]
			},
		},
		["CrowdControlEnable"] = true,
		["EarthShieldRightButton"] = "target",
		["OpenOnRightclick"] = false,
		["CDTimersOnButtons"] = true,
		["LastTotems"] = {
			"火舌图腾", -- [1]
			"石肤图腾", -- [2]
			"法力之泉图腾", -- [3]
			"风怒图腾", -- [4]
		},
		["TrackerSpacing"] = 5,
		["EarthShieldMiddleButton"] = "targettarget",
		["EnhanceCDsSize"] = 30,
		["Timer_Clickthrough"] = false,
		["TotemOrder"] = {
			{
				8181, -- [1]
				1535, -- [2]
				3599, -- [3]
				8190, -- [4]
				8227, -- [5]
			}, -- [1]
			{
				5730, -- [1]
				8071, -- [2]
				8075, -- [3]
				2484, -- [4]
				8143, -- [5]
			}, -- [2]
			{
				5394, -- [1]
				16190, -- [2]
				8166, -- [3]
				8170, -- [4]
				8184, -- [5]
				5675, -- [6]
			}, -- [3]
			{
				10595, -- [1]
				25908, -- [2]
				8177, -- [3]
				8835, -- [4]
				6495, -- [5]
				15107, -- [6]
				8512, -- [7]
			}, -- [4]
		},
	},
}
