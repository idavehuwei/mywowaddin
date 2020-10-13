
TDDB_PACK2 = {
	["profileKeys"] = {
		["Erza - 龙之召唤"] = "Default",
		["牛魔术师 - 龙之召唤"] = "Default",
		["春天的栗子 - 龙之召唤"] = "Default",
		["夏天的栗子 - 龙之召唤"] = "Default",
		["秋天的栗子 - 龙之召唤"] = "Default",
		["九呜呜 - 龙之召唤"] = "Default",
		["哈哈牛往 - 龙之召唤"] = "Default",
		["五二七 - 龙之召唤"] = "Default",
		["无小小 - 龙之召唤"] = "Default",
		["哈哈呜呜 - 龙之召唤"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["TDPack2PatchVersion"] = "2019-12-18-02",
			["saving"] = false,
			["rules"] = {
				["sorting"] = {
					6948, -- [1]
					{
						["comment"] = "坐骑",
						["rule"] = "tip:使用： 召唤或解散",
						["icon"] = 132261,
					}, -- [2]
					{
						["icon"] = 134065,
						["comment"] = "工具",
						["children"] = {
							5060, -- [1]
							2901, -- [2]
							5956, -- [3]
							7005, -- [4]
							9149, -- [5]
							16207, -- [6]
							11145, -- [7]
							11130, -- [8]
							6339, -- [9]
							6218, -- [10]
							6219, -- [11]
							10498, -- [12]
							19727, -- [13]
							{
								["comment"] = "鱼竿",
								["rule"] = "type:鱼竿",
								["icon"] = 132932,
							}, -- [14]
						},
					}, -- [3]
					{
						["comment"] = "装备",
						["rule"] = "equip",
						["icon"] = 132722,
						["children"] = {
							{
								["comment"] = "双手",
								["rule"] = "slot:双手",
								["icon"] = 135324,
							}, -- [1]
							{
								["comment"] = "主手",
								["rule"] = "slot:主手",
								["icon"] = 133045,
							}, -- [2]
							{
								["comment"] = "单手",
								["rule"] = "slot:单手",
								["icon"] = 135641,
							}, -- [3]
							{
								["comment"] = "副手",
								["rule"] = "slot:副手",
								["icon"] = 134955,
							}, -- [4]
							{
								["comment"] = "副手物品",
								["rule"] = "slot:副手物品",
								["icon"] = 134333,
							}, -- [5]
							{
								["comment"] = "远程",
								["rule"] = "slot:远程",
								["icon"] = 135498,
							}, -- [6]
							{
								["comment"] = "枪械",
								["rule"] = "type:枪械",
								["icon"] = 135610,
							}, -- [7]
							{
								["comment"] = "弩",
								["rule"] = "type:弩",
								["icon"] = 135533,
							}, -- [8]
							{
								["comment"] = "投掷武器",
								["rule"] = "type:投掷武器",
								["icon"] = 135427,
							}, -- [9]
							{
								["comment"] = "圣物",
								["rule"] = "slot:圣物",
								["icon"] = 134915,
							}, -- [10]
							{
								["comment"] = "头部",
								["rule"] = "slot:头部",
								["icon"] = 133136,
							}, -- [11]
							{
								["comment"] = "颈部",
								["rule"] = "slot:颈部",
								["icon"] = 133294,
							}, -- [12]
							{
								["comment"] = "肩部",
								["rule"] = "slot:肩部",
								["icon"] = 135033,
							}, -- [13]
							{
								["comment"] = "背部",
								["rule"] = "slot:背部",
								["icon"] = 133768,
							}, -- [14]
							{
								["comment"] = "胸部",
								["rule"] = "slot:胸部",
								["icon"] = 132644,
							}, -- [15]
							{
								["comment"] = "手腕",
								["rule"] = "slot:手腕",
								["icon"] = 132608,
							}, -- [16]
							{
								["comment"] = "手",
								["rule"] = "slot:手",
								["icon"] = 132948,
							}, -- [17]
							{
								["comment"] = "腰部",
								["rule"] = "slot:腰部",
								["icon"] = 132511,
							}, -- [18]
							{
								["comment"] = "腿部",
								["rule"] = "slot:腿部",
								["icon"] = 134588,
							}, -- [19]
							{
								["comment"] = "脚",
								["rule"] = "slot:脚",
								["icon"] = 132541,
							}, -- [20]
							{
								["comment"] = "手指",
								["rule"] = "slot:手指",
								["icon"] = 133345,
							}, -- [21]
							{
								["comment"] = "饰品",
								["rule"] = "slot:饰品",
								["icon"] = 134010,
							}, -- [22]
							{
								["comment"] = "衬衣",
								["rule"] = "slot:衬衣",
								["icon"] = 135022,
							}, -- [23]
							{
								["comment"] = "公会徽章",
								["rule"] = "slot:公会徽章",
								["icon"] = 135026,
							}, -- [24]
						},
					}, -- [4]
					{
						["comment"] = "容器",
						["rule"] = "type:容器",
						["icon"] = 133652,
					}, -- [5]
					{
						["comment"] = "箭袋",
						["rule"] = "type:箭袋",
						["icon"] = 134407,
					}, -- [6]
					{
						["comment"] = "弹药",
						["rule"] = "type:弹药",
						["icon"] = 132382,
					}, -- [7]
					{
						["comment"] = "配方",
						["rule"] = "type:配方",
						["icon"] = 134939,
					}, -- [8]
					{
						["comment"] = "商品",
						["rule"] = "type:商品",
						["icon"] = 132905,
						["children"] = {
							{
								["comment"] = "职业物品",
								["rule"] = "tip:职业：",
								["icon"] = 132273,
							}, -- [1]
						},
					}, -- [9]
					{
						["comment"] = "消耗品",
						["rule"] = "type:消耗品 & tip:!任务",
						["icon"] = 134829,
						["children"] = {
							{
								["comment"] = "职业物品",
								["rule"] = "tip:职业：",
								["icon"] = 132273,
							}, -- [1]
							{
								["comment"] = "急救",
								["rule"] = "spell:急救",
								["icon"] = 133685,
							}, -- [2]
							{
								["comment"] = "进食",
								["rule"] = "spell:进食",
								["icon"] = 133945,
							}, -- [3]
							{
								["comment"] = "喝水",
								["rule"] = "spell:喝水",
								["icon"] = 132794,
							}, -- [4]
							{
								["comment"] = "治疗药水",
								["rule"] = "spell:治疗药水",
								["icon"] = 134830,
							}, -- [5]
							{
								["comment"] = "恢复法力",
								["rule"] = "spell:恢复法力",
								["icon"] = 134851,
							}, -- [6]
						},
					}, -- [10]
					{
						["comment"] = "材料",
						["rule"] = "type:材料",
						["icon"] = 133587,
					}, -- [11]
					{
						["comment"] = "其它",
						["rule"] = "type:!任务 & tip:!任务",
						["icon"] = 134237,
						["children"] = {
							{
								["comment"] = "其它",
								["rule"] = "type:其它",
								["icon"] = 134400,
							}, -- [1]
							{
								["comment"] = "钥匙",
								["rule"] = "type:钥匙",
								["icon"] = 134237,
							}, -- [2]
						},
					}, -- [12]
					{
						["comment"] = "任务",
						["rule"] = "type:任务 | tip:任务",
						["icon"] = 133469,
						["children"] = {
							{
								["comment"] = "该物品将触发一个任务",
								["rule"] = "tip:该物品将触发一个任务",
								["icon"] = 132836,
							}, -- [1]
							{
								["icon"] = 133942,
								["rule"] = "spell",
							}, -- [2]
						},
					}, -- [13]
				},
				["saving"] = {
					16885, -- [1]
					{
						["comment"] = "商品",
						["rule"] = "type:商品 & !spell & !bop",
						["icon"] = 132905,
					}, -- [2]
				},
			},
		},
	},
}
