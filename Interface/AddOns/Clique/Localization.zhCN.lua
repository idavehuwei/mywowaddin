-- by yaroot (yaroot#gmail.com)

if(GetLocale() ~= 'zhCN') then return end

local _, addon = ...
local baseLocale = {
    ["A binding that belongs to the 'default' binding-set will always be active on your unit frames, unless you override it with another binding."] = "默认组别, 设置将对所有框体有效, 除非有其他组别的相同的按键设置",
    ["A binding that belongs to the 'enemy' binding-set will always be active when clicking on unit frames that display enemy units, i.e. those you can attack. If you click on a unit that you cannot attack, nothing will happen."] = "敌对组别, 设置只对敌对的框体有效, 当你对敌对的框体点击施法时, 这个设置将被触发.",
    ["A binding that belongs to the 'frield' binding-set will only be active when clicking on unit frames that display friendly units, i.e. those you can heal and assist. If you click on a unit that you cannot heal or assist, nothing will happen."] = "友善组别, 该组别设置只对友善的框体有效, 当你对友善的框体点击施法时, 该设置将被触发.",
	["A binding that belongs to the 'global' binding-set is always active. If the spell requires a target, you will be given the 'casting hand', otherwise the spell will be cast. If the spell is an AOE spell, then you will be given the ground targeting circle."] = "全局组别, 这个组别的绑定总是有效. 如果法术需要目标来施放, 你会获得相当于点击法术并选择目标的效果. 如果是AOE法术, 你会获得选择目标区域的效果.",
    ["A binding that belongs to the 'hovercast' binding-set is active whenever the mouse is over a unit frame, or a character in the 3D world. This allows you to use 'hovercasting', where you hover over a unit in the world and press a key to cast a spell on them. THese bindings are also active over unit frames."] = "全局组别, 该组别按键设置为悬浮式施法, 将鼠标移动到其他玩家/怪物或者头像框体上将可以直接对其施法.",
    ["A binding that belongs to the 'ooc' binding-set will only be active when the player is out-of-combat. As soon as the player enters combat, these bindings will no longer be active, so be careful when choosing this binding-set for any spells you use frequently."] = "非战斗组别, 这个组别的设置只在不战斗时有效.",
    ["Accept"] = "接受",
    ["Action"] = "动作",
    ["Add new profile"] = "添加新配置",
	["Alt"] = "Alt",
    ["Arena enemy frames"] = "竞技场敌对框体",
    ["Bind other"] = "绑定其他",
    ["Bind spell"] = "绑定技能",
    ["Binding"] = "绑定",
	["Blizzard frame integration options"] = "暴雪默认框体选项",
    ["Boss target frames"] = "首领目标框体",
    ["Cancel"] = "取消",
    ["Cast %s"] = "施放 %s",
    ["Change binding"] = "修改绑定",
    ["Change binding: %s"] = "修改绑定: %s",
    ["Clique Binding Configuration"] = "Clique 设置",
    ["Clique binding configuration"] = "Clique 设置",
	["Clique general options"] = "综合选项",
    ["Clique: 'default' binding-set"] = "组别: 默认",
    ["Clique: 'enemy' binding-set"] = "组别: 敌对",
    ["Clique: 'friend' binding-set"] = "组别: 友善",
    ["Clique: 'global' binding-set"] = "组别: 全局",
	["Clique: 'hovercast' binding-set"] = "组别: 悬浮施法",
    ["Clique: 'ooc' binding-set"] = "组别: 非战斗",
    ["Compact party frames"] = "小队框体",
    ["Compact raid frames"] = "团队框体",
    ["Configure binding: '%s'"] = "设置绑定: '%s'",
	["Ctrl"] = "Ctrl",
    ["Current: "] = "当前: ",
    ["Default"] = "默认",
    ["Delete binding"] = "删除绑定",
    ["Delete profile '%s'"] = "删除配置: '%s'",
	["Delete profile: %s"] = "删除配置: %s",
    ["Disable out of combat clicks when party members enter combat"] = "当队友进入战斗时禁用 '非战斗' 组别的快捷键",
	["Edit macro"] = "编辑宏",
    ["Enable/Disable click-sets"] = "设置组别...",
    ["Enemy"] = "敌对",
	["Frame blacklist"] = "框体黑名单",
    ["Frame name"] = "框体名",
    ["Friend"] = "友善",
	["Global bindings (no target)"] = "全局按键 (无目标)",
	["Hovercast bindings (target required)"] = "悬浮按键 (需要目标)",
    ["In order to specify a binding, move your mouse over the button labelled 'Set binding' and either click with your mouse or press a key on your keyboard. You can modify the binding by holding down a combination of the alt, control and shift keys on your keyboard."] = "设置绑定先要将鼠标移动到 '设置绑定' 按钮上, 然后点击需要设置的快捷键. 你可以使用crtl/shift/alt之类的组合键.",
    ["LAlt"] = '左Alt',
    ["LCtrl"] = '左Ctrl',
    ["LShift"] = '左Shift',
    ["LeftButton"] = "左键点击",
    ["MiddleButton"] = "中间点击",
    ["MousewheelDown"] = "滚轮向下滚动",
    ["MousewheelUp"] = "滚轮向上滚动",
    ["No binding set"] = "无组别",
    ["Open unit menu"] = "打开右键菜单",
    ["Options"] = "设置",
    ["Out-of-combat only"] = "非战斗",
    ["Party member frames"] = "小队框体",
    ["Player frame"] = "玩家头像",
    ["Player's focus frame"] = "焦点头像",
    ["Player's pet frame"] = "宠物头像",
    ["Player's target frame"] = "目标头像",
    ["Primary talent spec profile:"] = "主天赋配置",
    ["Profile Management:"] = "配置管理",
    ["RAlt"] = '右Alt',
    ["RCtrl"] = '右Ctrl',
    ["RShift"] = '右Shift',
    ["RightButton"] = "右键点击",
    ["Run custom macro"] = "运行自定义宏",
    ["Run macro"] = "运行宏",
    ["Run macro '%s'"] = "运行宏 '%s'",
    ["Save"] = "保存",
    ["Secondary talent spec profile:"] = "第二天赋配置: ",
    ["Select All"] = "选择所有",
    ["Select None"] = "清除所有选择",
    ["Select a binding type"] = "选择绑定类型",
	["Select an options category"] = "设置一个可选分类组别",
    ["Select profile: %s"] = "选择配置: %s",
    ["Set binding"] = "设置绑定",
    ["Set binding: %s"] = "设置绑定: %s",
	["Shift"] = "Shift",
    ["Show unit menu"] = "打开右键菜单",
    ["Swap profiles based on talent spec"] = "随天赋切换配置",
    ["Target clicked unit"] = "选中点击单位",
    ["Target of focus frame"] = "焦点的目标",
    ["Target of target frame"] = "目标的目标",
    ["These options control whether or not Clique automatically registers certain Blizzard-created frames for binding. Changes made to these settings will not take effect until the user interface is reloaded."] = "这些设置将决定 Clique 是否将原始界面的框体注册按键绑定. 修改该设置将只在重载界面后有效.",
    ["This binding is DISABLED"] = "此项设置已被 >禁用<",
	["This binding is invalid, please delete"] = "非法设置, 请删除",
    ["This panel allows you to blacklist certain frames from being included for Clique bindings. Any frames that are selected in this list will not be registered, although you may have to reload your user interface to have them return to their original bindings."] = "在这页设置里, 你可以勾选框体以将其加入黑名单来防止 Clique 设置其点击施法. 任何你选中的框体都不会被 Clique 注册, 该页设置改动将在重载后生效.",
    ["Trigger bindings on the 'down' portion of the click (requires reload)"] = "在'按下'按键时触发(需要重载)",
	["Unknown"] = "未知",
    ["Unknown binding type '%s'"] = "未知绑定类型 '%s'",
    ["When both the Clique binding configuration window and the spellbook are open, you can set new bindings simply by performing them on the spell icon in your spellbook. Simply move your mouse over a spell and then click or press a key on your keyboard along with any combination of the alt, control, and shift keys. The new binding will be added to your binding configuration."] = "当 Clique 设置界面 和 法术书 同时打开时, 你只要用需要设置的快捷键点击法术就可以将其添加到 Clique 设置中. 将鼠标移动到法术图标上, 同时可以按下 ctrl, alt 和 shift 中的一个或多个, 然后点击鼠标的某一个按键, 这项设置就会被添加.",
	["You are in Clique binding mode"] = "你现在处于 Clique 设置模式中",
    ["You can use this page to create a custom macro to be run when activating a binding on a unit. When creating this macro you should keep in mind that you will need to specify the target of any actions in the macro by using the 'mouseover' unit, which is the unit you are clicking on. For example, you can do any of the following:\n\n/cast [target=mouseover] Regrowth\n/cast [@mouseover] Regrowth\n/cast [@mouseovertarget] Taunt\n\nHover over the 'Set binding' button below and either click or press a key with any modifiers you would like included. Then edit the box below to contain the macro you would like to have run when this binding is activated."] = "你可以在这页创建一个用于点击施放的自定义宏. 撰写宏时需要注意, 你必须将施法动作的目标指定为 'mouseover'. 例如, 你可以使用以下内容:\n\n/cast [target=mouseover] 愈合\n/cast [@mouseovertarget] 嘲讽\n\n将鼠标移动到 设置绑定 按钮上然后按下鼠标和ctrl/alt/shift键来创建绑定. 然后撰写你需要运行的宏",
}

addon:RegisterLocale('zhCN', baseLocale)