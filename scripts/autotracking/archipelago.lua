-- this is an example/ default implementation for AP autotracking
-- it will use the mappings defined in item_mapping.lua and location_mapping.lua to track items and locations via thier ids
-- it will also load the AP slot data in the global SLOT_DATA, keep track of the current index of on_item messages in CUR_INDEX
-- addition it will keep track of what items are local items and which one are remote using the globals LOCAL_ITEMS and GLOBAL_ITEMS
-- this is useful since remote items will not reset but local items might
ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}

function has_value (t, val)
    for i, v in ipairs(t) do
        if v == val then return 1 end
    end
    return 0
end


function dump_table(o, depth)
    if depth == nil then
        depth = 0
    end
    if type(o) == 'table' then
        local tabs = ('\t'):rep(depth)
        local tabs2 = ('\t'):rep(depth + 1)
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ',\n'
        end
        return s .. tabs .. '}'
    else
        return tostring(o)
    end
end

function onClear(slot_data)
    -- if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
    --     print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
    -- end

    Archipelago:SetNotify({string.format("Slot:%d:currentScene", Archipelago.PlayerNumber), string.format("Slot:%d:sceneLinks", Archipelago.PlayerNumber)});
    Archipelago:Get({string.format("Slot:%d:currentScene", Archipelago.PlayerNumber), string.format("Slot:%d:sceneLinks", Archipelago.PlayerNumber)});

    SLOT_DATA = slot_data
    CUR_INDEX = -1
    -- reset locations
    for _, locations_array in pairs(LOCATION_MAPPING) do
        for _, location in pairs(locations_array) do
            if location then
                if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: clearing location %s", location))
                end
                local obj = Tracker:FindObjectForCode(location)
                if obj then
                    if location:sub(1, 1) == "@" then
                        obj.AvailableChestCount = obj.ChestCount
                    else
                        obj.Active = false
                    end
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: could not find object for code %s", location))
                end
            end
        end

    end
    -- reset items
    for _, items_array in pairs(ITEM_MAPPING) do
        local items = items_array[1]
        local item_type = items_array[2]
        for _, item in pairs(items) do
            if item and item_type then
                if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: clearing item %s of type %s", item, item_type))
                end
                local obj = Tracker:FindObjectForCode(item)
                if obj then
                    if item_type == "toggle" then
                        obj.Active = false
                    elseif item_type == "progressive" then
                        obj.CurrentStage = 0
                        obj.Active = false
                    elseif item_type == "consumable" then
                        obj.AcquiredCount = 0
                    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                        print(string.format("onClear: unknown item type %s for code %s", item_type, item))
                    end
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: could not find object for code %s", item))
                end
            end
        end
    end
    LOCAL_ITEMS = {}
    GLOBAL_ITEMS = {}
    AutoFill()
    -- manually run snes interface functions after onClear in case we are already ingame
end

-- called when an item gets collected
function onItem(index, item_id, item_name, player_number)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onItem: %s, %s, %s, %s, %s", index, item_id, item_name, player_number, CUR_INDEX))
    end
    if not AUTOTRACKER_ENABLE_ITEM_TRACKING then
        return
    end
    if index <= CUR_INDEX then
        return
    end
   
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;
    CheckForItem(item_id)
    local v = nil
    if ITEM_MAPPING[item_id] then
        v = ITEM_MAPPING[item_id]
    end
    if v then
        local items = v[1]
        local item_type = v[2]
        if not v then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onItem: could not find item mapping for id %s", item_id))
            end
            return
        end
        for _, item in pairs(items) do
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onItem: code: %s, type %s", item, item_type))
            end
            if not item then
                return
            end
            local obj = Tracker:FindObjectForCode(item)
            if obj then
                if item_type == "toggle" then
                    obj.Active = true
                elseif item_type == "progressive" then
                    if obj.Active then
                        obj.CurrentStage = obj.CurrentStage + 1
                    else
                        obj.Active = true
                    end
                elseif item_type == "consumable" then
                    obj.AcquiredCount = obj.AcquiredCount + obj.Increment
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onItem: unknown item type %s for code %s", item_type, item))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onItem: could not find object for code %s", item))
            end
        
            -- track local items via snes interface
            if is_local then
                if LOCAL_ITEMS[item] then
                    LOCAL_ITEMS[item] = LOCAL_ITEMS[item] + 1
                else
                    LOCAL_ITEMS[item] = 1
                end
            else
                if GLOBAL_ITEMS[item] then
                    GLOBAL_ITEMS[item] = GLOBAL_ITEMS[item] + 1
                else
                    GLOBAL_ITEMS[item] = 1
                end
            end
        end
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("local items: %s", dump_table(LOCAL_ITEMS)))
            print(string.format("global items: %s", dump_table(GLOBAL_ITEMS)))
        end
    end
end

-- called when a location gets cleared
function onLocation(location_id, location_name)
    local location_array = LOCATION_MAPPING[location_id]
    print(location_id, location_name)
    if not location_array or not location_array[1] then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
        return
    end
    
    for _, location in pairs(location_array) do
        local location_obj = Tracker:FindObjectForCode(location)
        -- print(location, location_obj)
        if location_obj then

            if location:sub(1, 1) == "@" then
                location_obj.AvailableChestCount = location_obj.AvailableChestCount - 1
            else
                location_obj.Active = true
            end
        else
            print(string.format("onLocation: could not find location_object for code %s", location))
        end
    end
end

-- called when a locations is scouted
function onScout(location_id, location_name, item_id, item_name, item_player)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onScout: %s, %s, %s, %s, %s", location_id, location_name, item_id, item_name,
            item_player))
    end
    -- not implemented yet :(
end

-- called when a bounce message is received 
function onBounce(json)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onBounce: %s", dump_table(json)))
    end
    -- your code goes here
end

-- add AP callbacks
-- un-/comment as needed
Archipelago:AddClearHandler("clear handler", onClear)
if AUTOTRACKER_ENABLE_ITEM_TRACKING then
    Archipelago:AddItemHandler("item handler", onItem)
end
if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
    Archipelago:AddLocationHandler("location handler", onLocation)
end
-- Archipelago:AddScoutHandler("scout handler", onScout)
-- Archipelago:AddBouncedHandler("bounce handler", onBounce)

Archipelago:AddSetReplyHandler("DataStorageHandler", function (key, value, oldValue)
    if key == string.format("Slot:%d:currentScene", Archipelago.PlayerNumber) then
        print("key: ", key)
        print("value: ", value)
        print("oldValue: ", oldValue)
        CURRENT_SCENE = value
        Tracker:UiHint("ActivateTab", value)
    end

    if key == string.format("Slot:%d:sceneLinks", Archipelago.PlayerNumber) then
        print("key: ", key)
        print("value: ", dump_table(value))
        print("oldValue: ", dump_table(oldValue))
        SCENE_LINKS = value
    end
end)

function AutoFill()
    if SLOT_DATA == nil  then
        print("its fucked")
        return
    end
    print(dump_table(SLOT_DATA))

    -- mapDropsanity = {[0]=0,[1]=1}
    -- mapShopsanity = {[0]=0,[1]=1}
    -- mapSwitchlocks = {[0]=0,[1]=1}
    -- mapSecretdoorlocks = {[0]=0,[1]=1}
    local slotCodes = {
        dropsanity = {code="drops_on", mapping=nil},
        shopsanity = {code="shops_on", mapping=nil},
        switch_locks = {code="switch_locks", mapping=nil},
        secret_door_lock = {code="secret_doors", mapping=nil},
        door_locks = {code="door_lock_toggle", mapping=nil},
        entrance_randomization = {code="entrance_toggle", mapping=nil},
        etnas_pupil = {code="etna_on", mapping=nil},
        quenchsanity = {code="quench_on", mapping=nil},
        -- enemy_randomization = {code="enemy_toggle", mapping=nil},
    }

    for settings_name , settings_value in pairs(SLOT_DATA) do
        if slotCodes[settings_name] then
            local item = Tracker:FindObjectForCode(slotCodes[settings_name].code)
            if item.Type == "toggle" then
                if slotCodes[settings_name].mapping == nil then
                    item.Active = settings_value
                else
                    item.Active = slotCodes[settings_name].mapping[settings_value]
                end
            elseif item.Type == "progressive" then
                print(settings_value, type(settings_value))
                if slotCodes[settings_name].mapping == nil then
                    item.CurrentStage = settings_value
                else
                    item.CurrentStage = slotCodes[settings_name].mapping[settings_value]
                end
            elseif slotCodes[settings_name].mapping == nil then
                item.AcquiredCount = settings_value
            else
                item.CurrentStage = slotCodes[settings_name].mapping[settings_value]
            end
        end
    end

    if SLOT_DATA["random_elements"] then
        UpdateElements(SLOT_DATA["elements"])
    end
end