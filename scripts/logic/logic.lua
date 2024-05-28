-- put logic functions here using the Lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
-- don't be afraid to use custom logic functions. it will make many things a lot easier to maintain, for example by adding logging.
-- to see how this function gets called, check: locations/locations.json
-- example:
function has_more_then_n_consumable(n)
    local count = Tracker:ProviderCountForCode('consumable')
    local val = (count > tonumber(n))
    if ENABLE_DEBUG_LOG then
        print(string.format("called has_more_then_n_consumable: count: %s, n: %s, val: %s", count, n, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end

function secrets_or_off()
    --> Checking Secret Door Logic
    local secret_toggle = Tracker:ProviderCountForCode('secret_doors')
    local doc_obtained = Tracker:ProviderCountForCode('dc_orb')
    if secret_toggle * doc_obtained == 1 then
        return 1 --> You have both secret doors on and the Dusty Crystal Orb
    elseif secret_toggle == 1 and doc_obtained == 0 then
        return 0 --> You have both secret doors on and don't have the Dusty Crystal Orb
    else
        return 1 --> Secret Doors must be off so return true
    end
end

function switches_or_off(key)
    --> Checking if Switch Locks Are Enabled
    local switch_toggle = Tracker:ProviderCountForCode('switch_locks')
    local key_needed = Tracker:ProviderCountForCode(key)
    if switch_toggle * key_needed == 1 then
        return 1 --> You have both secret doors on and the Dusty Crystal Orb
    elseif switch_toggle == 1 and key_needed == 0 then
        return 0 --> You have both secret doors on and don't have the Dusty Crystal Orb
    else
        return 1 --> Secret Doors must be off so return true
    end
end

function entrances_or_off(access)
    --> Checking if Switch Locks Are Enabled
    local entrance_toggle = Tracker:ProviderCountForCode('entrance_toggle')
    local key_needed = Tracker:ProviderCountForCode(access)
    if entrance_toggle * key_needed == 1 then
        return 1 --> You have entrance rando on and have access
    elseif entrance_toggle == 1 and key_needed == 0 then
        return 0 --> You have entrance rando and don't have access
    else
        return 1 --> Entrance Rando must be off so return true
    end
end