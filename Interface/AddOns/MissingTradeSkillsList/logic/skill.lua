--------------------------------------------------------
-- Contains all functions for a skill of a profession --
--------------------------------------------------------

MTSL_LOGIC_SKILL = {
    ----------------------------------------------------------------------------------------
    -- Checks if a skill is available in this content phase
    --
    -- @skill				Object			The skill
    -- @profession_name		String			The name of the profession
    -- @max_phase			Number			The number of content phase that is maximal allowed
    --
    -- return				Boolean			Flag indicating availability
    -----------------------------------------------------------------------------------------
    IsSkillAvailableInPhase = function(self, skill, max_phase)
        return tonumber(skill.phase) <= tonumber(max_phase)
    end,

    VerifyPhasesForAllSkills = function(self)
        for k, v in pairs(MTSL_DATA["skills"]) do
            for _, skill in pairs(v) do
                local min_current_phase = skill.phase
                if min_current_phase == nil then min_current_phase = MTSL_DATA.MIN_PATCH_LEVEL end
                local max_current_phase = min_current_phase

                if skill.trainers then
                    local trainers = MTSL_LOGIC_PLAYER_NPC:GetNpcsByIds(skill.trainers.sources)
                    for _, t in pairs(trainers) do
                        if t.phase ~= nil and t.phase > max_current_phase then
                            max_current_phase = t.phase
                        end
                    end
                end

                if skill.quests then
                    local quests = MTSL_LOGIC_QUEST:GetQuestsByIds(skill.quests)
                    for _, q in pairs(quests) do
                        if q.phase ~= nil and q.phase > max_current_phase then
                            max_current_phase = q.phase
                        end
                    end
                end

                if skill.items then
                    local skill_item = MTSL_LOGIC_ITEM_OBJECT:GetItemForProfessionById(skill.items[1], k)
                    if skill_item ~= nil and skill_item.phase ~= nil and skill_item.phase  > max_current_phase then
                        max_current_phase = skill_item.phase
                    end
                    -- TODO, check vendors & drops & objects
                end

                if skill.objects then
                    local objects = MTSL_LOGIC_ITEM_OBJECT:GetObjectsByIds(skill.objects)
                    for _, o in pairs(objects) do
                        if o.phase ~= nil and o.phase > max_current_phase then
                            max_current_phase = o.phase
                        end
                    end
                end
            end

            if tonumber(min_current_phase) < tonumber(max_current_phase) then
                print(k .. " " .. v.name.English .. " " .. min_current_phase .. "-" .. max_current_phase)
            end
        end
    end,

    ----------------------------------------------------------------------------------------
    -- Checks if a skill is available in a certain zone
    --
    -- @skill				Object			The skill
    -- @profession_name		String			The name of the profession
    -- @zone_id				Number			The id of the zone (0 = all)
    --
    -- return				Boolean			Flag indicating availability
    -----------------------------------------------------------------------------------------
    IsSkillAvailableInZone = function(self, skill, profession_name, zone_id)
        local available = true
        -- check fot at least one source in the zone (skip zone if id = 0 => all are good)
        if zone_id ~= 0 then
            local at_least_one_source = false
            -- if trainers, loop em
            if skill.trainers ~= nil then
                local npcs = MTSL_LOGIC_PLAYER_NPC:GetNpcsByIds(skill.trainers.sources)
                at_least_one_source = self:HasAtleastOneNpcInZoneById(npcs, zone_id)
            end
            -- keep going if still no valid source found
            if not at_least_one_source and skill.quests ~= nil then
                at_least_one_source = self:HasAtleastOneObtainableQuestInZone(skill.quests, profession_name, zone_id)
            end
            -- keep going if still no valid source found
            if not at_least_one_source and skill.objects ~= nil then
                at_least_one_source = self:HasAtleastOneObtainableObjectInZone(skill.objects, zone_id)
            end
            -- keep going if still no valid source found
            if not at_least_one_source and skill.items ~= nill then
                at_least_one_source = self:HasAtleastOneObtainableItemInZone(skill.items, profession_name, zone_id)
            end
            available = at_least_one_source
        end
        return available
    end,

    ----------------------------------------------------------------------------------------
    -- Checks if a at least one npc is located in a certain zone
    --
    -- @npcs				Array			The list of NPCs
    -- @zone_id		        Number			The id of the zone
    --
    -- return				Boolean			Flag indicating if at least one is found
    -----------------------------------------------------------------------------------------
    HasAtleastOneNpcInZoneById = function(self, npcs, zone_id)
        -- Get the first npc found for the given zone
        local npc = MTSL_TOOLS:GetItemFromArrayByKeyValue(npcs, "zone_id", zone_id)
        -- return if we found one or not
        return npc ~= nil
    end,

    ----------------------------------------------------------------------------------------
    -- Checks if at least one of the quests is available in a certain zone
    --
    -- @quest_ids			Array			Contains all different quest_ids (Alliance and horde can have different ones)
    -- @zone_id				Number			The id of the zone (0 = all)
    --
    -- return				Boolean			Flag indicating obtainable
    -----------------------------------------------------------------------------------------
    HasAtleastOneObtainableQuestInZone = function(self, quest_ids, tradeskill_name, zone_id)
        local quest = MTSL_LOGIC_QUEST:GetQuestByIds(quest_ids)
        -- Quest has many sources (npcs, objects or items)
        -- check npcs
        local is_obtainable = false
        if quest ~= nil then
            if quest.npcs ~= nil then
                local npcs = MTSL_LOGIC_PLAYER_NPC:GetNpcsByIds(quest.npcs)
                is_obtainable = self:HasAtleastOneNpcInZoneById(npcs, zone_id)
            end
            -- Check objects
            if not is_obtainable and quest.objects ~= nil then
                is_obtainable = self:HasAtleastOneObtainableObjectInZone(quest.objects, zone_id)
            end
            -- check items
            if not is_obtainable and quest.items ~= nil then
                is_obtainable = self:HasAtleastOneObtainableItemInZone(quest.items, tradeskill_name, zone_id)
            end
        end

        return is_obtainable
    end,

    ----------------------------------------------------------------------------------------
    -- Checks if at least one of the objects is available in a certain zone
    --
    -- @item_ids			Array			Contains the ids of the items to check
    -- @zone_id				Number			The id of the zone (0 = all)
    --
    -- return				Boolean			Flag indicating obtainable
    -----------------------------------------------------------------------------------------
    HasAtleastOneObtainableObjectInZone = function(self, object_ids, zone_id)
        local objects = MTSL_LOGIC_ITEM_OBJECT:GetObjectsByIds(object_ids)
        local object = MTSL_TOOLS:GetItemFromArrayByKeyValue(objects, "zone_id", zone_id)
        return object ~= nil
    end,

    ----------------------------------------------------------------------------------------
    -- Checks if at least one of the items is available in a certain zone
    --
    -- @item_ids			Array			Contains the ids of the items to check
    -- @profession_name		String			The name of the profession for which the item is valid
    -- @zone_id				Number			The id of the zone (0 = all)
    --
    -- return				Boolean			Flag indicating obtainable
    -----------------------------------------------------------------------------------------
    HasAtleastOneObtainableItemInZone = function(self, item_ids, profession_name, zone_id)
        local i = 1
        local is_obtainable = false
        while item_ids[i] ~= nil and is_obtainable == false do
            local skill_item = MTSL_LOGIC_ITEM_OBJECT:GetItemForProfessionById(item_ids[i], profession_name)
            if skill_item ~= nil then
                -- item has many sources (drops, quests, vendors)
                -- check quests
                if skill_item.quests ~= nil then
                    is_obtainable = self:HasAtleastOneObtainableQuestInZone(skill_item.quests, profession_name, zone_id)
                end
                -- check vendors
                if not is_obtainable and skill_item.vendors ~= nil then
                    local vendors = MTSL_LOGIC_PLAYER_NPC:GetNpcsByIds(skill_item.vendors.sources)
                    is_obtainable = self:HasAtleastOneNpcInZoneById(vendors, zone_id)
                end
                -- check drops only if not a world drop
                if not is_obtainable and skill_item.drops ~= nil then
                    -- Exclude world drops
                    if skill_item.drops.range ~= nil then
                        is_obtainable = false
                    else
                        local mobs = MTSL_LOGIC_PLAYER_NPC:GetMobsByIds(skill_item.drops.sources)
                        is_obtainable = self:HasAtleastOneNpcInZoneById(mobs, zone_id)
                    end
                end
            end
            i = i + 1
        end
        return is_obtainable
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns a skill for a certain profession based on the recipe id its learned from
    --
    -- @item_id			Number		The id of the item (source of the skill)
    -- @prof_name		String		Name of the profession
    --
    -- returns	 		Array		The skills
    ------------------------------------------------------------------------------------------------
    GetSkillForProfessionByItemId = function(self, item_id, profession_name)
        local skill = MTSL_TOOLS:GetItemFromArrayByKeyValue(MTSL_DATA["skills"][profession_name], "item", item_id)
        -- try a level if nil
        if skill == nil then
            skill = MTSL_TOOLS:GetItemFromArrayByKeyValue(MTSL_DATA["levels"][profession_name], "item", item_id)
        end
        return skill
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns a skill for a certain profession by id
    --
    -- @skill_id			Number		The id of the skill
    -- @prof_name		String		Name of the profession
    --
    -- returns	 		Array		The skills
    ------------------------------------------------------------------------------------------------
    GetSkillForProfessionById = function(self, skill_id, profession_name)
        local skill = MTSL_TOOLS:GetItemFromArrayByKeyValue(MTSL_DATA["skills"][profession_name], "id", skill_id)
        -- try a level if nil
        if skill == nil then
            skill = MTSL_TOOLS:GetItemFromArrayByKeyValue(MTSL_DATA["levels"][profession_name], "id", skill_id)
        end
        return skill
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns a list of source types for a skill for a certain profession by id
    --
    -- @skill_id		    Number		The id of the skill
    -- @profession_name		String		Name of the profession
    --
    -- returns	 		    Array		The sourcetypes
    ------------------------------------------------------------------------------------------------
    GetSourcesForSkillForProfessionById = function(self, skill_id, profession_name)
        local source_types = {}
        local skill = MTSL_TOOLS:GetItemFromArrayByKeyValue(MTSL_DATA["skills"][profession_name], "id", skill_id)
        -- try a level if nil
        if skill == nil then
            skill = MTSL_TOOLS:GetItemFromArrayByKeyValue(MTSL_DATA["levels"][profession_name], "id", skill_id)
        end
        if skill ~= nil then
            -- try types on skill itself
            if skill.trainers ~= nil then
                table.insert(source_types, "trainer")
            end
            if skill.quests ~= nil then
                table.insert(source_types, "quest")
            end
            -- if learned from item, determine the source types based on the item source
            if skill.items ~= nil then
                local item = MTSL_LOGIC_ITEM_OBJECT:GetItemForProfessionById(skill.items[1], profession_name)
                if item ~= nil then
                    if item.vendors ~= nil then
                        table.insert(source_types, "vendor")
                    end
                    if item.quests ~= nil then
                        table.insert(source_types, "quest")
                    end
                    if item.drops ~= nil then
                        table.insert(source_types, "drop")
                    end
                    -- if only obtainable during holiday event
                    if item.holiday ~= nil then
                        table.insert(source_types, "holiday")
                    end
                end
            end
            -- if we learned from object
            if skill.objects ~= nil then
                table.insert(source_types, "object")
            end
            -- if only obtainable during holiday event
            if skill.holiday ~= nil then
                table.insert(source_types, "holiday")
            end
        end

        return source_types
    end,

    ----------------------------------------------------------------------------------------
    -- Checks if at skill is avaiable through a source type
    --
    -- @skill_id		    Number		The id of the skill
    -- @profession_name		String		Name of the profession
    -- @source_type         String      The type of source want
    --
    -- return				Boolean		Flag indicating obtainable
    -----------------------------------------------------------------------------------------
    IsAvailableForSourceType = function(self, skill_id, profession_name, source_type)
        local source_types = self:GetSourcesForSkillForProfessionById(skill_id, profession_name)
        return MTSL_TOOLS:ListContainsKey(source_types, source_type)
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns a list of factions for a skill for a certain profession by id
    --
    -- @skill_id		    Number		The id of the skill
    -- @profession_name		String		Name of the profession
    --
    -- returns	 		    Array		The factions
    ------------------------------------------------------------------------------------------------
    GetFactionsForSkillForProfessionById = function(self, skill_id, profession_name)
        local factions = {}
        local skill = MTSL_TOOLS:GetItemFromArrayByKeyValue(MTSL_DATA["skills"][profession_name], "id", skill_id)
        -- try a level if nil
        if skill == nil then
            skill = MTSL_TOOLS:GetItemFromArrayByKeyValue(MTSL_DATA["levels"][profession_name], "id", skill_id)
        end
        -- if we find the skill of the profession, search for factions
        if skill ~= nil then
            -- loop trainers
            if skill.trainers ~= nil then
                local trainers = MTSL_LOGIC_PLAYER_NPC:GetNpcsIgnoreFactionByIds(skill.trainers.sources)
                for _, t in pairs(trainers) do
                    self:AddFactionForDataToArray(factions, t)
                end
            end
            if skill.objects then
                table.insert(factions, MTSL_LOGIC_FACTION_REPUTATION:GetFactionIdByName("Alliance"))
                table.insert(factions, MTSL_LOGIC_FACTION_REPUTATION:GetFactionIdByName("Horde"))
            end
            -- try reputation/reacts on skill itself
            self:AddFactionForDataToArray(factions, skill)
            -- if learned from item, add the factions based on the item source
            if skill.items ~= nil then
                local item = MTSL_LOGIC_ITEM_OBJECT:GetItemForProfessionById(skill.items[1], profession_name)
                if item ~= nil then
                    self:AddFactionForDataToArray(factions, item)
                    if item.vendors ~= nil then
                        local vendors = MTSL_LOGIC_PLAYER_NPC:GetNpcsIgnoreFactionByIds(item.vendors.sources)
                        -- loop all the vendors
                        for _, v in pairs(vendors) do
                            self:AddFactionForDataToArray(factions, v)
                        end
                    end
                    -- it is is a drop of mobs or learned from object or special action, add both alliance and horde
                    if item.drops or item.objects or item.special_action then
                        table.insert(factions, MTSL_LOGIC_FACTION_REPUTATION:GetFactionIdByName("Alliance"))
                        table.insert(factions, MTSL_LOGIC_FACTION_REPUTATION:GetFactionIdByName("Horde"))
                    end
                    -- if its from quest, add NPC/questgivers
                    if item.quests then
                        -- loop all quests
                        for _, v in pairs(item.quests) do
                            local quest = MTSL_TOOLS:GetItemFromUnsortedListById(MTSL_DATA["quests"], v)
                            if quest ~= nil then
                                self:AddFactionForDataToArray(factions, quest)
                                -- loop all the NPC/questgivers
                                if quest.npcs ~= nil then
                                    local npcs = MTSL_LOGIC_PLAYER_NPC:GetNpcsIgnoreFactionByIds(quest.npcs)
                                    -- loop all the vendors
                                    for _, n in pairs(npcs) do
                                        self:AddFactionForDataToArray(factions, n)
                                    end
                                -- no questgivers so assume alliance and horde can get it
                                else
                                    table.insert(factions, MTSL_LOGIC_FACTION_REPUTATION:GetFactionIdByName("Alliance"))
                                    table.insert(factions, MTSL_LOGIC_FACTION_REPUTATION:GetFactionIdByName("Horde"))
                                end
                            end
                        end
                    end
                end
            end
            -- if we learned from object
            if skill.quests ~= nil then
                -- loop all quests
                for _, v in pairs(skill.quests) do
                    local quest = MTSL_TOOLS:GetItemFromUnsortedListById(MTSL_DATA["quests"], v)
                    if quest ~= nil then
                        self:AddFactionForDataToArray(factions, quest)
                        -- loop all the NPC/questgivers
                        if quest.npcs ~= nil then
                            local npcs = MTSL_LOGIC_PLAYER_NPC:GetNpcsIgnoreFactionByIds(quest.npcs)
                            -- loop all the vendors
                            for _, n in pairs(npcs) do
                                self:AddFactionForDataToArray(factions, n)
                            end
                            -- no questgivers so assume alliance and horde can get it
                        else
                            table.insert(factions, MTSL_LOGIC_FACTION_REPUTATION:GetFactionIdByName("Alliance"))
                            table.insert(factions, MTSL_LOGIC_FACTION_REPUTATION:GetFactionIdByName("Horde"))
                        end
                    end
                end
            end
        end

        return factions
    end,

    AddFactionForDataToArray = function (self, array, data)
        if data.reputation ~= nil then
            table.insert(array, tonumber(data.reputation.faction_id))
        end
        if data.reacts ~= nil then
            table.insert(array, tonumber(MTSL_LOGIC_FACTION_REPUTATION:GetFactionIdByName(data.reacts)))
        end
    end,

    ----------------------------------------------------------------------------------------
    -- Checks if at skill is avaiable through a source type
    --
    -- @skill_id		    Number		The id of the skill
    -- @profession_name		String		Name of the profession
    -- @faction_id			Number		The id of the faction from which we must be able to learn skill (0 = all)
    --
    -- return				Boolean		Flag indicating obtainable
    -----------------------------------------------------------------------------------------
    IsAvailableForFaction = function(self, skill_id, profession_name, faction_id)
        local factions = self:GetFactionsForSkillForProfessionById(skill_id, profession_name)
        if MTSL_TOOLS:CountItemsInArray(factions) <= 0 then
            -- add alliance and horde for now
            -- print(profession_name .. " skill " .. skill_id .. " has " .. MTSL_TOOLS:CountItemsInArray(factions) .. " available factions")
            table.insert(factions, MTSL_LOGIC_FACTION_REPUTATION:GetFactionIdByName("Alliance"))
            table.insert(factions, MTSL_LOGIC_FACTION_REPUTATION:GetFactionIdByName("Horde"))
        end
        return MTSL_TOOLS:ListContainsNumber(factions, tonumber(faction_id))
    end,

    ----------------------------------------------------------------------------------------
    -- Checks if at skill is avaiable through an id of a npc
    --
    -- @profession_name     String      The name of the profession
    -- @skill               Object      The skill to check
    -- @npc_id		        Number		The id of the npc
    --
    -- return				Boolean		Flag indicating obtainable
    -----------------------------------------------------------------------------------------
    IsObtainableFromNpcById = function(self, profession_name, skill, npc_id)
        local obtainable = false
        -- Check if npc_id is contained in list of trainers if there are
        if skill.trainers ~= nil and MTSL_TOOLS:ListContainsNumber(skill.trainers.sources, npc_id) then
            obtainable = true
        end
        -- Check if questgiver
        if obtainable == false and skill.quests ~= nil then
            -- loop each quest
            for _, v in pairs(skill.quests) do
                local quest = MTSL_LOGIC_QUEST:GetQuestById(v)
                if quest ~= nil and quest.npcs ~= nil and MTSL_TOOLS:ListContainsNumber(quest.npcs, npc_id) then
                    obtainable = true
                end
            end
        end
        -- check if learned from item
        if obtainable == false and skill.items ~= nil then
            local item = MTSL_LOGIC_ITEM_OBJECT:GetItemForProfessionById(skill.items[1], profession_name)
            if item ~= nil then
                -- npc can be a mob that drops it or vendor
                if item ~= nil and ((item.drops ~= nil and item.drops.sources ~= nil and MTSL_TOOLS:ListContainsNumber(item.drops.sources, npc_id))
                        or (item.vendors ~= nil and MTSL_TOOLS:ListContainsNumber(item.vendors.sources, npc_id))) then
                    obtainable = true
                end
            end
            -- or questgiver
            if obtainable == false and item ~= nil and item.quests ~= nil then
                for _, v in pairs(item.quests) do
                    local quest = MTSL_LOGIC_QUEST:GetQuestById(v)
                    if quest ~= nil and quest.npcs ~= nil and MTSL_TOOLS:ListContainsNumber(quest.npcs, npc_id) then
                        obtainable = true
                    end
                end
            end
        end
        -- return the status we found
        return obtainable
    end
}