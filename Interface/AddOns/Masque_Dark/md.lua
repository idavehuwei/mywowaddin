--[[Dark skin for Masque]]

local MSQ = LibStub("Masque", true)
if not MSQ then
	return
end


MSQ:AddSkin("Dark", {
	Author = "jeffy162",
	Version = "3.0.0",
	Shape = "Square",
	Masque_Version = 40200,
	Backdrop = {
		Width = 40,
		Height = 40,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Masque_Dark\Textures64\Backdrop_Dark]],
	},
	Icon = {
		Width = 26,
		Height = 26,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 40,
		Height = 40,
		Color = {1, 0, 0, 0.6},
		Texture = [[Interface\AddOns\Masque_Dark\Textures64\Overlay]],
	},
	Cooldown = {
		Width = 26,
		Height = 26,
	},
	Pushed = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\Masque_Dark\Textures64\Pushed]],
	},
	Normal = {
		Width = 40,
		Height = 40,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Masque_Dark\Textures64\Dark]],
		EmptyTexture = [[Interface\AddOns\Masque_Dark\Textures64\Normal]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Masque_Dark\Textures64\Checked]],
	},
	Border = {
		Width = 40,
		Height = 40,
		BlendMode = "BLEND",
		Color = {0, 1, 0, 1},
		Texture = [[Interface\AddOns\Masque_Dark\Textures64\Equipped]],
	},
	AutoCastable = {
		Width = 48,
		Height = 48,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0, 0, 1, 0.9},
		Texture = [[Interface\AddOns\Masque_Dark\Textures64\Highlight]],
	},
	Gloss = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {1, 1, 1, 0.7},
		Texture = [[Interface\AddOns\Masque_Dark\Textures64\Gloss]],
	},
	HotKey = {
		Width = 40,
		Height = 10,
		OffsetX = -6,
		OffsetY = -6,
	},
	Count = {
		Width = 40,
		Height = 10,
		OffsetX = -6,
		OffsetY = 4,
	},
	Name = {		
		Width = 40,
		Height = 10,
		OffsetX = 0,
		OffsetY = 4,
	},
	Duration = {
		Width = 40,
		Height = 10,
    	OffsetX = 0,
		OffsetY = -10,
	},
	AutoCast = {
		Width = 26,
		Height = 26,
		OffsetX = 1,
		OffsetY = -1,
	},
}, true)

--[[Dark Alliance skin for Masque]]
MSQ:AddSkin("Dark-Alliance", {
	Template = "Dark",
	Backdrop = {
		Width = 40,
		Height = 40,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Masque_Dark\Textures64\Backdrop_Alliance]],
	},
	Normal = {
		Width = 40,
		Height = 40,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Masque_Dark\Textures64\ANormal]],
		EmptyTexture = [[Interface\AddOns\Masque_Dark\Textures64\Dark]],
	},
}, true)

--[[Dark Horde skin for Masque]]
MSQ:AddSkin("Dark-Horde", {
	Template = "Dark",
	Backdrop = {
		Width = 40,
		Height = 40,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Masque_Dark\Textures64\Backdrop_Horde]],
	},
	Normal = {
		Width = 40,
		Height = 40,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Masque_Dark\Textures64\HNormal]],
		EmptyTexture = [[Interface\AddOns\Masque_Dark\Textures64\Dark]],
	},
}, true)