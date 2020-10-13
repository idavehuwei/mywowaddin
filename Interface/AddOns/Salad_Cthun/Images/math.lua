local tab= {
    [1] = {-26,59}, --melee        		--
    [2] = {-48,113}, --melee/ranged	-|
    [3] = {-99,153}, --healer/ranged	-|Group 1
    [4] = {-44,177},--ranged     		-|
    [5] = {-93,215}, --ranged           --
}

local tab_2 = {}
local tab_3 = {}
local tab_4 = {}
local tab_5 = {}
local tab_6 = {}
local tab_7 = {}
local tab_8 = {}

for k,v in pairs(tab) do
    tab_2[k+5] = {-v[1],v[2]}
end

for k,v in pairs(tab) do
    tab_3[k+10] = {-v[2],-v[1]}
end

for k,v in pairs(tab_2) do
    tab_4[k+10] = {v[2],v[1]}
end

for k,v in pairs(tab) do
    tab_8[k+((8-1)*5)] = {-v[1],-v[2]}
end
for k,v in pairs(tab_2) do
    tab_7[k+((7-2)*5)] = {-v[1],-v[2]}
end
for k,v in pairs(tab_3) do
    tab_6[k+((6-3)*5)] = {-v[1],-v[2]}
end
for k,v in pairs(tab_4) do
    tab_5[k+((5-4)*5)] = {-v[1],-v[2]}
end
local function con(x,y)
    local mid = 534/2
    local X,Y = 0,0
    X = x- mid
    Y = mid - y
    return string.format("{%d,%d},",X,Y)
end

print(con(151,223))
--[[
for k,v in pairs(tab_4) do
    print("["..k.."]".." = ".."{"..v[1]..","..v[2].."}"..",")
end
for k,v in pairs(tab_5) do
    print("["..k.."]".." = ".."{"..v[1]..","..v[2].."}"..",")
end
for k,v in pairs(tab_6) do
    print("["..k.."]".." = ".."{"..v[1]..","..v[2].."}"..",")
end
for k,v in pairs(tab_7) do
print("["..k.."]".." = ".."{"..v[1]..","..v[2].."}"..",")
    end
for k,v in pairs(tab_8) do
print("["..k.."]".." = ".."{"..v[1]..","..v[2].."}"..",")
    end

]]
--[[
- 2_/x2+y2 = -17









]]