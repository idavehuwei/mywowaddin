--[[
BWL专用提示小插件
作者：深蓝（Aoikaze)-零界
鸣谢：零界的各位会员

我们现在在无畏服务器，欢迎来参观。
]]
local Version = GetAddOnMetadata("Nefarian", "Version") 

local UnitName = UnitName
local UnitGUID = UnitGUID
local UnitClass = UnitClass
local SendChatMessage = SendChatMessage

local NefarianSwitch  = "off" --AddOn Switch
local WhisperSwitch = "on" -- Whisper Switch

local TaskTime = 0
local LastScan = 0

local Channel = "Raid_Warning"

--创建窗体
local f=Nefarian or CreateFrame("Frame","Nefarian")  --Register AddOn Frame (Default)
f:Hide()

f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("CHAT_MSG_MONSTER_YELL")
f:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("UNIT_TARGET")
f:RegisterEvent("RAID_ROSTER_UPDATE")

--f:RegisterEvent("CHAT_MSG_RAID_LEADER") --测试用事件


f:SetScript("OnEvent", function(self, event, ...)
--  print(event)
    if type(self[event]) == "function" then
        return self[event](self, ...)
    end
end)

f:SetScript("OnUpdate", function(self, lastupdate)
    if NefarianSwitch == "off" then
        f:Hide()
        return
    end
    if TaskTime == 0 then
        return
    end
    local NowScan = math.floor(GetTime()*10)
    if NowScan == LastScan then
        return
    end
    LastScan = NowScan
    if LastScan >= TaskTime then
        SendChatMessage(string.format(MSG_WARNING_NEXTCALL,5),Channel)
        TaskTime = 0
        LastScan = 0
    end
end)

function f:ADDON_LOADED(...)
	local arg = {...}
	if arg[1] == "Nefarian" then
		--加载提示
		print(string.format(NEFARIAN_LOAD,Version))
	end
end

function f:RAID_ROSTER_UPDATE(...)
    if UnitIsGroupLeader("player") then
        NefarianSwitch = "on"
        f:Show()
    end
end


function f:CHAT_MSG_MONSTER_EMOTE(...)
    if NefarianSwitch == "off" then
        return
    end
    local arg ={...}
    if GetRealZoneText() == ZONE_NAME and (UnitIsGroupAssistant("player") or UnitIsGroupLeader("player")) then
        if arg[2] == BOSS_NAME_CHROMAGGUS or arg[2] == BOSS_NAME_FLAMEGOR then
            if string.match(arg[1],EMOTION_BOSS_CHROMAGGUS) then
                FindWeakPoint()
            elseif string.match(arg[1],EMOTION_BOSS_FRENZY1) or string.match(arg[1],EMOTION_BOSS_FRENZY2) then
                SendChatMessage(string.format(MSG_WARNING_FRENZY,arg[2]),Channel)
                if WhisperSwitch == "off" then
                    return
                end
                for i=1,40 do
                    local u="raid"..i
                    if UnitName(u) and UnitClass(u) == CLASS_HNT then
                        SendChatMessage(string.format(MSG_WARNING_FRENZY_HNT,arg[2]),"whisper",nil,UnitName(u))
                    end
                end
            end
        end
    end
end

function f:UNIT_TARGET(...)
    if NefarianSwitch == "off" then
        return
    end
    local arg={...}
    if GetRealZoneText() == ZONE_NAME and (UnitIsGroupAssistant("player") or UnitIsGroupLeader("player")) and arg[1] == "player" then
        FindWeakPoint()
    end
end

function f:CHAT_MSG_MONSTER_YELL(...) --NEF点名提示
    if NefarianSwitch == "off" then
        return
    end
    local arg = {...}
    if GetRealZoneText() == ZONE_NAME and (UnitIsGroupAssistant("player") or UnitIsGroupLeader("player")) then
        if string.match(arg[1],YELL_MSG_P1) then
            SendChatMessage(GROUP_WARNING_P1,Channel)
        elseif string.match(arg[1],YELL_MSG_P2) then
            SendChatMessage(GROUP_WARNING_P2,Channel)
        elseif string.match(arg[1],YELL_MSG_P3) then
            SendChatMessage(GROUP_WARNING_P3,Channel)
        elseif string.match(arg[1],CLASS_SHM) then
            SendChatMessage(GROUP_WARNING_SHM,Channel)
            if WhisperSwitch == "off" then
                return
            end
 			for i=1,40 do
				local u="raid"..i
                if UnitClass(u) == CLASS_PRI then
                    SendChatMessage(MSG_TIPS_PRI,"whisper",nil,UnitName(u))
                elseif UnitClass(u) == CLASS_DRU then
                    SendChatMessage(MSG_TIPS_DRU,"whisper",nil,UnitName(u))
                elseif UnitClass(u) == CLASS_PLA then
                end
			end
        elseif string.match(arg[1],CLASS_PAL) then
            if TaskTime == 0 then
                SetWarningTime(25)
            end
            SendChatMessage(GROUP_WARNING_PAL,Channel)
        elseif string.match(arg[1],CLASS_DRU) then
            if TaskTime == 0 then
                SetWarningTime(25)
            end
            SendChatMessage(GROUP_WARNING_DRU,Channel)
            if WhisperSwitch == "off" then
                return
            end
			for i=1,40 do
				local u="raid"..i
                if(UnitName(u)) then
                    if UnitClass(u) == CLASS_PRI then
                        SendChatMessage(MSG_TIPS_PRI,"whisper",nil,UnitName(u))
                    elseif UnitClass(u) == CLASS_PLA then
                        SendChatMessage(MSG_TIPS_PLA,"whisper",nil,UnitName(u))
                    elseif UnitClass(u) == CLASS_SHM then
                        SendChatMessage(MSG_TIPS_SHM,"whisper",nil,UnitName(u))
                    end
                end
			end
        elseif string.match(arg[1],CLASS_PRI) then
            if TaskTime == 0 then
                SetWarningTime(25)
            end
            SendChatMessage(GROUP_WARNING_PRI,Channel)
            if WhisperSwitch == "off" then
                return
            end
 			for i=1,40 do
				local u="raid"..i
                if(UnitName(u)) then
                    if UnitClass(u) == CLASS_PRI then
                        SendChatMessage(MSG_WARNING_PRI,"whisper",nil,UnitName(u))
                    elseif UnitClass(u) == CLASS_DRU then
                        SendChatMessage(MSG_TIPS_DRU,"whisper",nil,UnitName(u))
                    elseif UnitClass(u) == CLASS_PLA then
                        SendChatMessage(MSG_TIPS_PLA,"whisper",nil,UnitName(u))
                    elseif UnitClass(u) == CLASS_SHM then
                        SendChatMessage(MSG_TIPS_SHM,"whisper",nil,UnitName(u))
                    end
                end
			end
        elseif string.match(arg[1],CLASS_WAR) then
            if TaskTime == 0 then
                SetWarningTime(25)
            end
            SendChatMessage(GROUP_WARNING_WAR,Channel)
        elseif string.match(arg[1],CLASS_ROG) then
            if TaskTime == 0 then
                SetWarningTime(25)
            end
            SendChatMessage(GROUP_WARNING_ROG,Channel)
        elseif string.match(arg[1],CLASS_WLK) then
            if TaskTime == 0 then
                SetWarningTime(25)
            end
            SendChatMessage(GROUP_WARNING_WLK,Channel)
        elseif string.match(arg[1],CLASS_HNT) then
            if TaskTime == 0 then
                SetWarningTime(25)
            end
            SendChatMessage(GROUP_WARNING_HNT,Channel)
            if WhisperSwitch == "off" then
                return
            end
            for i=1, 40 do
                local u="raid"..i
                if UnitName(u) then
                    if UnitClass(u) == CLASS_HNT then
                        SendChatMessage(MSG_WARNING_HNT,"whisper",nil,UnitName(u))
                    end
                end
            end
        elseif string.match(arg[1],CLASS_MAG) then
            if TaskTime == 0 then
                SetWarningTime(25)
            end
            SendChatMessage(GROUP_WARNING_MAG,Channel)
            if WhisperSwitch == "off" then
                return
            end
			for i=1,40 do
				local u="raid"..i
                if(UnitName(u)) then
                    if UnitClass(u) == CLASS_MAG then
                        SendChatMessage(MSG_WARNING_MAG,"whisper",nil,UnitName(u))
                    end
                end
			end
        end
    end
end

function f:COMBAT_LOG_EVENT_UNFILTERED(...) --BWL专有DEBUFF提示
    if NefarianSwitch == "off" then
        return
    end
	local arg ={CombatLogGetCurrentEventInfo()} --COMBAT_LOG_EVENT_UNFILTERED 事件参数
    if GetRealZoneText() == ZONE_NAME and (UnitIsGroupAssistant("player") or UnitIsGroupLeader("player")) then
    	if arg[2] == "SPELL_AURA_APPLIED" and arg[13] == SPELL_SHADOWMIST then
            for i=1, 40 do
                local u = "raid"..i
                if UnitName(u) then
                    if UnitGUID(u) == arg[8] and UnitClass(u) == CLASS_WAR then
                        local msg = string.format(MSG_WARNING_DIS,UnitName(u),SPELL_SHADOWMIST)
                        SendChatMessage(msg,Channel)
                        if WhisperSwitch == "off" then
                            return
                        end
                        for j=1, 40 do
                            local v = "raid"..j
                            if UnitName(v) then
                                if UnitClass(v) == CLASS_DRU or UnitClass(v) == CLASS_MAG then
                                    SendChatMessage(msg,"whisper",nil,UnitName(v))
                                end
                            end
                        end
                        return
                    end
                end
            end
        elseif arg[2] == "SPELL_AURA_APPLIED" and arg[13] == SPELL_ADRENALINE then
            for i=1, 40 do
                local u = "raid"..i
                if UnitName(u) then
                    if UnitGUID(u) == arg[8] then
                        local msg1 = string.format(MSG_WARNING_ADRENALINE_GROUP,UnitName(u),SPELL_ADRENALINE)
                        local msg2 = string.format(MSG_WARNING_ADRENALINE_WHISPER,SPELL_ADRENALINE)
                        SendChatMessage(msg1,Channel)
                        if WhisperSwitch == "off" then
                            return
                        end
                        SendChatMessage(msg2,"whisper",nil,UnitName(u))
                        return
                    end
                end
            end
        elseif arg[2] == "SPELL_AURA_APPLIED" and arg[13] == SPELL_EBONROCSHADOW then
            for i=1, 40 do
                local u = "raid"..i
                if UnitName(u) then
                    if UnitGUID(u) == arg[8] then
                        local msg1 = string.format(MSG_WARNING_EBONROC_GROUP,UnitName(u),SPELL_EBONROCSHADOW)
                        local msg2 = string.format(MSG_WARNING_EBONROC_TARGET,SPELL_EBONROCSHADOW)
                        local msg3 = string.format(MSG_WARNING_EBONROC_WAR,UnitName(u),SPELL_EBONROCSHADOW)
                        SendChatMessage(msg1,Channel)
                        if WhisperSwitch == "off" then
                            return
                        end
                        SendChatMessage(msg2,"whisper",nil,UnitName(u))
                        for j=1, 40 do
                            local v = "raid"..j
                            if UnitName(v) then
                                if UnitClass(v) == CLASS_WAR and v~=u then
                                    SendChatMessage(msg3,"whisper",nil,UnitName(v))
                                end
                            end
                        end
                        return
                    end
                end
            end
        elseif arg[2] == "SPELL_AURA_APPLIED" and arg[13] == SPELL_MORTALSTRIKE and arg[5] == BOSS_NAME_LASHLAYER then
            for i=1, 40 do
                local u = "raid"..i
                if UnitName(u) then
                    if UnitGUID(u) == arg[8] then
                        local msg = string.format(MSG_WARNING_MORTALSTRIKE,arg[9],arg[13])
                        if WhisperSwitch == "off" then
                            return
                        end
                        for j=1, 40 do
                            local v = "raid"..j
                            if UnitName(v) then
                                if UnitClass(v) == CLASS_PRI then
                                    SendChatMessage(msg,"whisper",nil,UnitName(v))
                                end
                            end
                        end
                        return
                    end
                end
            end                     
        elseif arg[2] == "SPELL_MISSED" and (arg[13] == SPELL_TAUNT or arg[13] == SPELL_CHALLENGINGSHOUT or arg[13] == SPELL_MOCKINGBLOW) and arg[15] == "RESIST" and (arg[9] == BOSS_NAME_FIREMAW or arg[9] == BOSS_NAME_EBONROC or arg[9] == BOSS_NAME_FLAMEGOR) then --嘲讽抵抗
            local msg1 = string.format(MSG_WARNING_RESIST,arg[5],arg[13],arg[9])
            local msg2 = string.format(MSG_WARNING_TAUNT_RESIST,arg[5],arg[13],arg[9])
            SendChatMessage(msg1,Channel)
            if WhisperSwitch == "off" then
                return
            end
            for i=1, 40 do
                local u,t = "raid"..i,"target"
                if UnitName(u) then
                    if UnitClass(u) == CLASS_WAR and not UnitIsUnit(u,u..t..t) and not (UnitName(u) == arg[9]) then
                        SendChatMessage(msg2,"whisper",nil,UnitName(u))
                    end
                end
            end
        elseif arg[2] == "SPELL_CAST_START" then --暗影烈焰、龙翼打击、克洛玛古斯技能提示
            if arg[13] == SPELL_INCINERATE or arg[13] == SPELL_CORROSIVEACID or arg[13] == SPELL_FROSTBURN  or arg[13] == SPELL_IGNITEFLESH or arg[13] == SPELL_SHADOWFLAME then
                local msg = string.format(MSG_WARNING_SPELLSTART,arg[5],arg[13])
                SendChatMessage(msg,Channel)
            elseif arg[13] == SPELL_WINGBUFFET then
                local msg1 = string.format(MSG_WARNING_SPELLWINGBUFFET,arg[5],arg[13])
                local msg2 = string.format(MSG_WARNING_SPELLWINGBUFFET_WHISPER,arg[5],arg[13])
                SendChatMessage(msg1,Channel)
                if WhisperSwitch == "off" then
                    return
                end
                for i=1, 40 do
                    local u,t = "raid"..i,"target"
                    if UnitName(u) then
                        if UnitClass(u) == CLASS_WAR and not UnitIsUnit(u,u..t..t) then
                            SendChatMessage(msg2,"whisper",nil,UnitName(u))
                        end
                    end
                end
            elseif arg[13] == SPELL_TIMELAPSE then
                SendChatMessage(MSG_WARNING_TIMELAPSE,Channel)
            end
        end
    end
end

function FindWeakPoint() --弱点侦测
    local t = nil
    local d = nil
    if UnitName("target") == BOSS_NAME_CHROMAGGUS or UnitName("target") == MOB_NAME_OVERSEER or UnitName("target") == MOB_NAME_WYRMGUARD then
        t = "target"
    elseif UnitName("targettarget") == BOSS_NAME_CHROMAGGUS or UnitName("targettarget") == MOB_NAME_OVERSEER or UnitName("targettarget") == MOB_NAME_WYRMGUARD then
        t = "targettarget"
    end
    if t and not UnitIsDead(t) then
        for i=1, 40 do 
            if UnitDebuff(t,i) == SPELL_DETECTMAGIC then
                d = SPELL_DETECTMAGIC
                break
            end
        end
        if d then
            local msg = nil
            for i=1, 40 do
                if UnitBuff(t,i) == SPELL_NAME_ELEMENTALSHIELD then
                    local _,_,_,_,_,_,_,_,_,type = UnitBuff(t,i)
                    local tName = nil
                    if UnitName(t) then
                        if GetRaidTargetIndex(t) then
                            tName = RaidIcon[GetRaidTargetIndex(t)]..UnitName(t)
                        else
                            tName = UnitName(t)
                        end
                    end
                    if type == SPELL_ELEMENTALSHIELD_FIRE then
                        msg = string.format(MSG_WARNING_WEAKENPOINT,tName,MSG_WEAKENPOINT_FIRE)
                    elseif type == SPELL_ELEMENTALSHIELD_FROST then
                        msg = string.format(MSG_WARNING_WEAKENPOINT,tName,MSG_WEAKENPOINT_FROST)
                    elseif type == SPELL_ELEMENTALSHIELD_SHADOW then
                        msg = string.format(MSG_WARNING_WEAKENPOINT,tName,MSG_WEAKENPOINT_SHADOW)
                    elseif type == SPELL_ELEMENTALSHIELD_NATURE then
                        msg = string.format(MSG_WARNING_WEAKENPOINT,tName,MSG_WEAKENPOINT_NATURE)
                    elseif type == SPELL_ELEMENTALSHIELD_ARCANE then
                        msg = string.format(MSG_WARNING_WEAKENPOINT,tName,MSG_WEAKENPOINT_ARCANE)
                    end
                    break
                end
            end
            SendChatMessage(msg,Channel)                            
        else
            if GetRaidTargetIndex(t) then
                SendChatMessage(string.format(MSG_WARNING_NODETECT,RaidIcon[GetRaidTargetIndex(t)]..UnitName(t)),Channel)
            else
                SendChatMessage(string.format(MSG_WARNING_NODETECT,UnitName(t)),Channel)
            end
        end
    end
end

function SetWarningTime(delay)
    if delay > 0.1 then
        TaskTime = math.floor((GetTime()+delay)*10)
    end
end

SLASH_NEFARIANCMD1 = "/nefarian"
SLASH_NEFARIANCMD2 = "/nef"

SlashCmdList.NEFARIANCMD = function(msg)
    if string.lower(msg) == "on" then
		NefarianSwitch = "on"
        f:Show()
		print(NEFARIAN_ON)
    elseif string.lower(msg) == "off" then
		NefarianSwitch = "off"
        f:Hide()
		print(NEFARIAN_OFF)
    elseif string.lower(msg) == "whisper on" then
        WhisperSwitch = "on"
        print(NEFARIAN_WHISPER_ON)
    elseif string.lower(msg) == "whisper off" then
        WhisperSwitch = "off"
        print(NEFARIAN_WHISPER_OFF)
    elseif string.lower(msg) == "say" then
        Channel = "say"
        print(string.format(CURRENT_CHANNEL_IS,Channel))
    elseif string.lower(msg) == "yell" then
        Channel = "yell"
        print(string.format(CURRENT_CHANNEL_IS,Channel))
    elseif string.lower(msg) == "guild" then
        Channel = "guild"
        print(string.format(CURRENT_CHANNEL_IS,Channel))
    elseif string.lower(msg) == "emote" then
        Channel = "emote"
        print(string.format(CURRENT_CHANNEL_IS,Channel))
    elseif string.lower(msg) == "raid" then
        Channel = "raid"
        print(string.format(CURRENT_CHANNEL_IS,Channel))
    elseif string.lower(msg) == "raid_warning" then
        Channel = "Raid_Warning"
        print(string.format(CURRENT_CHANNEL_IS,Channel))
    else
        print(NEFARIAN_TIPS)
    end
end 