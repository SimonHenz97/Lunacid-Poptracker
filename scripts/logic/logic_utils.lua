function WereAnyItemsReceived(items)
    for _, item in pairs(items) do
        local trackedItem = Tracker:FindObjectForCode(item)
        if trackedItem and trackedItem.Active then
            return AccessibilityLevel.Normal
        end
    end
    return AccessibilityLevel.None
end

function WereAllItemsReceived(items)
    for _, item in pairs(items) do
        local trackedItem = Tracker:FindObjectForCode(item)
        if not (trackedItem and trackedItem.Active) then
            return AccessibilityLevel.None
        end
    end
    return AccessibilityLevel.Normal
end

function IsItemStageAtLeastN(item, n)
    local trackedItem = Tracker:FindObjectForCode(item)
    if trackedItem and trackedItem.CurrentStage >= n then
        return AccessibilityLevel.Normal
    end
    return AccessibilityLevel.None
end



function HasLightSource()
    return WereAnyItemsReceived({"torch", "crystallantern", "oillantern", "flameflare", "ghostlight", "twistedstaff", "moonlight", "brokenhilt"})
end

function CanEnterTemple()
    return And(HandleKeys("HB"), HasLightSource())
end

function HasDustyOrb()
    if Tracker:FindObjectForCode('secret_doors').Active and not Tracker:FindObjectForCode("dustycrystalorb").Active then
        return AccessibilityLevel.None
    end
    return AccessibilityLevel.Normal
end

function HasSwitch(item)
    local trackedItem = Tracker:FindObjectForCode(item)
    if not Tracker:FindObjectForCode('switch_locks').Active or (trackedItem and trackedItem.Active) then
        return AccessibilityLevel.Normal
    end
    return AccessibilityLevel.None
end

function HasDoorKey(item)
    local trackedItem = Tracker:FindObjectForCode(item)
    if not Tracker:FindObjectForCode('door_lock_toggle').Active or (trackedItem and trackedItem.Active) then
        return AccessibilityLevel.Normal
    end
    return AccessibilityLevel.None
end

function WasItemReceived(item)
    local trackedItem = Tracker:FindObjectForCode(item)
    if trackedItem and trackedItem.Active then
        return AccessibilityLevel.Normal
    end
    return AccessibilityLevel.None
end

function HasElement(element)
    return WasItemReceived(element)
    --local trackedItem = Tracker:FindObjectForCode(element)
    --if trackedItem and trackedItem.Active then
    --    return AccessibilityLevel.Normal
    --end
    --return AccessibilityLevel.None
end

function EnteredScene(scene)
    for _, link in pairs(SCENE_LINKS) do
        if link == scene then
            return AccessibilityLevel.Normal
        end
    end
    return AccessibilityLevel.None
end

function HandleKeys(area)
    local stage = "stage_" .. Tracker:FindObjectForCode("enchantedkey").CurrentStage
    local shopsanity = "shops_off"
    local entrancerando = "entrance_off"
    if (Tracker:FindObjectForCode("shops_on").Active) then shopsanity = "shops_on" end
    if (Tracker:FindObjectForCode("entrance_toggle").Active) then entrancerando = "entrance_on" end

    if stage == "stage_2" then return AccessibilityLevel.Normal end

    local handle = {
        ["HB"] = {
            ["entrance_on"] = {
                ["shop_on"] = {
                    ["stage_0"] = AccessibilityLevel.None,
                    ["stage_1"] = AccessibilityLevel.SequenceBreak,
                },
                ["shop_off"] = {
                    ["stage_0"] = AccessibilityLevel.SequenceBreak,
                    ["stage_1"] = AccessibilityLevel.SequenceBreak,
                }
            },
            ["entrance_off"] = {
                ["shop_on"] = {
                    ["stage_0"] = AccessibilityLevel.None,
                    ["stage_1"] = AccessibilityLevel.Normal,
                },
                ["shop_off"] = {
                    ["stage_0"] = AccessibilityLevel.Inspect,
                    ["stage_1"] = AccessibilityLevel.Normal,
                }
            }
        },
        ["YF"] = {
            ["entrance_on"] = {
                ["shop_on"] = {
                    ["stage_0"] = AccessibilityLevel.None,
                    ["stage_1"] = AccessibilityLevel.None,
                },
                ["shop_off"] = {
                    ["stage_0"] = AccessibilityLevel.None,
                    ["stage_1"] = AccessibilityLevel.None,
                }
            },
            ["entrance_off"] = {
                ["shop_on"] = {
                    ["stage_0"] = AccessibilityLevel.None,
                    ["stage_1"] = AccessibilityLevel.None,
                },
                ["shop_off"] = {
                    ["stage_0"] = AccessibilityLevel.None,
                    ["stage_1"] = AccessibilityLevel.None,
                }
            }
        }
    }

    if handle[area] and handle[area][entrancerando] and handle[area][entrancerando][shopsanity] and handle[area][entrancerando][shopsanity][stage] then
        return handle[area][entrancerando][shopsanity][stage]
    else
        return AccessibilityLevel.None
    end
end

function CanJumpHeight(height)
    if height == "High" then
        return WereAnyItemsReceived({"icarianflight", "rockbridge", "barrier"})
    elseif height == "Medium" then
        return WereAnyItemsReceived({"icarianflight", "rockbridge", "barrier", "coffin", "summonsnail"})
    end
    return AccessibilityLevel.None
end

function CanKillJotunn()
    if (Tracker:FindObjectForCode("shops_on").Active)
        then return WasItemReceived("jotunnslayer")
    end
    return WereAllItemsReceived({"earthtalisman", "watertalisman", "lucidblade"})
end

function And(...)
    local lowestAccessLvl = AccessibilityLevel.Normal
    for _, accessLvl in pairs({...}) do
        if accessLvl < lowestAccessLvl then
            lowestAccessLvl = accessLvl
        end
    end
    return lowestAccessLvl
end

function Or(...)
    local highestAccessLvl = AccessibilityLevel.None
    for _, accessLvl in pairs({...}) do
        if accessLvl > highestAccessLvl then
            highestAccessLvl = accessLvl
        end
    end
    return highestAccessLvl
end

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
        return 1 --> You have both switches on and the Correct Key
    elseif switch_toggle == 1 and key_needed == 0 then
        return 0 --> You have both switches on and don't have the correct key
    else
        return 1 --> Switches must be off so return true
    end
end

function entrances_or_off(access)
    --> Checking if Switch Locks Are Enabled
    local switch_toggle = Tracker:ProviderCountForCode('entrance_toggle')
    local access_needed = Tracker:ProviderCountForCode(access)
    if switch_toggle * access_needed == 1 then
        return 1 --> You have both switches on and the Correct Key
    elseif switch_toggle == 1 and access_needed == 0 then
        return 0 --> You have both switches on and don't have the correct key
    else
        return 1 --> Switches must be off so return true
    end
end

function door_locks_or_off(key)
    --> Checking if Entrance Rando is Enabled
    local entrance_toggle = Tracker:ProviderCountForCode('door_lock_toggle')
    local key_needed
    if key == true then
        key_needed = 1
    else 
        key_needed = Tracker:ProviderCountForCode(key)
    end
    if entrance_toggle * key_needed == 1 then
        return 1 --> You have entrance rando on and have access
    elseif entrance_toggle == 1 and key_needed == 0 then
        return 0 --> You have entrance rando and don't have access
    else
        return 1 --> Entrance Rando must be off so return true
    end
end