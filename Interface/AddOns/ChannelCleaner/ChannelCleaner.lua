local timeint = 60;
local lasttime = {};
local level=UnitLevel("player");
local playername = UnitName("player");

local filter = function(self,event,msg,player,arg1,arg2,arg3,flag,chanid,...)
	local p = RemoveServer(player)
	if p == playername then
		return false
	end
	--if event == "CHAT_MSG_CHANNEL" then 
		if lasttime[self.name] == nil then
			lasttime[self.name] = {}
		end
		if lasttime[self.name][p] ~= nil then
			if GetTime() < lasttime[self.name][p] + timeint then
				return true
			end
		end
		lasttime[self.name][p] = GetTime()
	--end
	
	if FilterMsg(CHANNELCLEANER, msg) then
		return true
	end
	if ChannelCleanerDB == nil then
		ChannelCleanerDB = {}
	end
	if FilterMsg(ChannelCleanerDB, msg) then
		return true
	end
	if FilterLevelMsg(DUNGEONSCLEANER, msg) then
		return true
	end
	if FilterLevelMsg(LEVELCLEANER, msg) then
		return true
	end

	local m, mm, c
	local retmsg=""
	local index = 1
	local ends, endd, start
	local leng = #msg
	local count = 120
	while(index <= leng)
	do
		start = msg:find("|", index)
		if start == nil then
			count = count - (#msg - index + 1)
			if count < 0 then
				retmsg = retmsg .. string.sub(msg, index, #msg + count)
			else
				retmsg = retmsg .. string.sub(msg, index)
			end
			break
		end
		count = count - (start - index)
		if count < 0 then
			retmsg = retmsg .. string.sub(msg, index, start + count)
			break
		else
			retmsg = retmsg .. string.sub(msg, index, start - 1)
		end
		
		ends = msg:find("|r", start+1)
		endd = msg:find("|t", start+1)
		if ends == nil or endd ~=null and ends > endd then
			ends = endd
		end
		if ends == nil then
			ends = leng - 1
		end
		m = string.sub(msg, start, ends+1)
		mm = string.gsub(m, "|h.+|h", "")
		c = #m - #mm - 4
		if c < 3 then
			c = 3
		end
		count = count - c
		retmsg = retmsg .. m
		index = ends + 2
	end

	local s
	local a
	local n = 0
	local su
	local bc
	local msgs = retmsg
	leng = #msgs
	local i = 1
	local j
	local dif = 0
	local bdif

	while(i<=leng)
	do
		a = string.byte(msgs,i,i)
		if a>=192 and a<=223 then
			bc = 2
		elseif a>=224 and a<=239 then
			bc = 3
		elseif a>=240 and a<=247 then
			bc = 4
		else
			bc = 1
		end
		su = string.sub(msgs, i, i+bc-1)
		i = i + bc - 1
		if su == s and i < leng then
			n = n + 1
		else
			if i == leng and su == s then
				n = n + 1
			end
			
			if n > 2 then
				bdif = false
				a = string.byte(s)
				if  a < 48 or a > 58 and a < 65 or a > 75 and a < 97 or a > 102 then
					if n > 2 then
						bdif = true
					end
				else
					if n > 7 then
						bdif = true
					end
				end
				if bdif then
					retmsg = string.sub(retmsg, 1, j-dif) .. string.sub(retmsg, i-dif - bc + 1)
					dif = dif + i - j - bc
				end
			end
			n =0
			j=i
		end
		s = su
		i = i+1
	end
	
	return false, retmsg, player,arg1,arg2,arg3,flag,chanid, ...
end

RemoveServer =  function (name)
	local dash = name:find("-");
    if dash then 
        return name:sub(1, dash-1); 
    end
	return name;
end

FilterMsg = function (keys, msg)
	local lowMsg = msg:lower()
	for i=1, #keys do
		if lowMsg:find(keys[i]:lower()) then
			return true
		end
	end
	return false
end

FilterLevelMsg = function (keys, msg)
	local lowMsg = msg:lower()
	for i=1, #keys do
		if level < keys[i][1] or level > keys[i][2] then
			for j=3, #keys[i] do
				if lowMsg:find(keys[i][j]:lower()) then
					return true
				end
			end
		end
	end
	return false;
end

StringSplit = function(s, p)
    local rt= {}
    string.gsub(s, '[^'..p..']+', function(w) table.insert(rt, w) end )
    return rt

end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", filter)

SLASH_CHANNELCLEANER1 = "/cc"
SLASH_CHANNELCLEANER2 = "/channelcleaner"
SlashCmdList["CHANNELCLEANER"] = function(msg)
	local cmd = StringSplit(msg, " ")
	if #cmd < 2 then
		print("/cc a 关键字  添加过滤关键字");
		print("/cc d 关键字  删除过滤关键字");
		return
	end
	if cmd[1] ~= nil and cmd[2] ~= nil then
		ChannelCleanerDB=ChannelCleanerDB or {};
		if cmd[1] == "a" then
			for i=1, #ChannelCleanerDB do
				if ChannelCleanerDB[i] == cmd[2] then
					print("关键词 "..cmd[2].." 已存在")
					return true
				end
			end
			table.insert(ChannelCleanerDB,cmd[2])
			print("关键词 "..cmd[2].." 添加成功")
		end
		if cmd[1] == "d" then
			for i=1, #ChannelCleanerDB do
				if ChannelCleanerDB[i] == cmd[2] then
					table.remove(ChannelCleanerDB, i)
					print("关键词 "..cmd[2].." 删除成功")
					return true
				end
			end
			print("关键词 "..cmd[2].." 不存在")
		end
	end
end
print("ChannelCleaner 加载成功")