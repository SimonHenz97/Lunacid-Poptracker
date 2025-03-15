ScriptHost:LoadScript("/scripts/logic/logic_utils.lua")

-- This table reflects the logic requirement inside a map and gets called using CanReach in the location.json files
LOCATION_LOGIC = {

-- Wings Rest
    ["Rafters"]             = function() return AccessibilityLevel.Normal end,

    ["Clive's Gift"]        = function() return AccessibilityLevel.Normal end,

    ["Demi's Victory Gift"] = function() return AccessibilityLevel.Normal end,


-- Hollow Basin
    ["Starting Weapon"]                             = function() return AccessibilityLevel.Normal end,

    ["Rightmost Water Room (Right)"]                = function() return AccessibilityLevel.Normal end,

    ["Rightmost Water Room (Left)"]                 = function() return AccessibilityLevel.Normal end,

    ["Leftmost Water Room"]                         = function() return AccessibilityLevel.Normal end,

    ["Chest Near Demi"]                             = function() return AccessibilityLevel.Normal end,

    ["Near Enchanted Door"]                         = function() return AccessibilityLevel.Normal end,

    ["Dark Tunnel After Enchanted Door"]            = function() return WasItemReceived("enchantedkey") end,

    ["Temple Fountain"]                             = function() return CanEnterTemple() end,

    ["Temple Ritual Table"]                         = function() return CanEnterTemple() end,

    ["Temple Altar Chest"]                          = function() return CanEnterTemple() end,

    ["Temple Hidden Room Behind Pillar (Left)"]     = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey"), HasDustyOrb()) end,

    ["Temple Hidden Room Behind Pillar (Right)"]    = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey"), HasDustyOrb()) end,

    ["Temple Ritual Table After Bridge"]            = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey")) end,

    ["Temple Small Pillar Top"]                     = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey")) end,

    ["Temple Pillar Room Left"]                     = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey"), HasDustyOrb()) end,

    ["Temple Pillar Room Back Left"]                = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey"), HasDustyOrb()) end,

    ["Temple Pillar Room Back Right"]               = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey"), HasDustyOrb()) end,

    ["Temple Pillar Room Hidden Room"]              = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey"), HasDustyOrb()) end,

    ["Temple Hidden Room In Sewer"]                 = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey"), HasDustyOrb()) end,

    ["Temple Table in Sewer"]                       = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey")) end,

    ["Temple Sewer Puzzle"]                         = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey"), WasItemReceived("vhstape"),
                                                        EnteredScene("Accursed Tomb"), HasElement("ele_light"), HasDustyOrb()) end,

    ["Temple Blood Altar"]                          = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey"), HasElement("ele_blood")) end,

    ["Alcove on Path to Yosei Forest"]              = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey")) end,

-- The Fetide Mire
    ["Room Left of Foyer"]                  = function() return AccessibilityLevel.Normal end,

    ["Hidden Slimey Chest Near Entrance"]   = function() return HasDustyOrb() end,

    ["Hidden Upper Overlook (Left)"]        = function() return HasDustyOrb() end,

    ["Hidden Upper Overlook (Right)"]       = function() return HasDustyOrb() end,

    ["Bonenard's Trash"]                    = function() return AccessibilityLevel.Normal end,

    ["Rubble Near Overlook Bridge"]         = function() return AccessibilityLevel.Normal end,

    ["Slime Skeleton Chest"]                = function() return AccessibilityLevel.Normal end,

    ["Jellisha's Trash"]                    = function() return HasDustyOrb() end,

    ["Jellisha's Quest Reward"]             = function() return HasDustyOrb() end,

    ["Hidden Chest Near Underworks"]        = function() return HasDustyOrb() end,

    ["Rubble Near Illusory Wall"]           = function() return AccessibilityLevel.Normal end,

    ["Underwater Pipe"]                     = function() return AccessibilityLevel.Normal end,

    ["Underworks Waterfall"]                = function() return AccessibilityLevel.Normal end,

    ["Underworks Skeleton"]                 = function() return AccessibilityLevel.Normal end,

    ["Path to Sanguine Sea (Left)"]         = function() return AccessibilityLevel.Normal end,

    ["Path to Sanguine Sea (Right)"]        = function() return AccessibilityLevel.Normal end,

    ["Jellisha's Jelly Treats"]             = function() return AccessibilityLevel.Normal end,

-- Sanguine Sea
    ["Pillar In Front of Castle Le Fanu"]   = function() return CanJumpHeight("High") end,

    ["Underblood Near Castle Le Fanu"]      = function() return AccessibilityLevel.Normal end,

    ["Fairy Circle"]                        = function() return AccessibilityLevel.Normal end,

    ["Killing the Jotunn"]                  = function() return CanKillJotunn() end,

-- Accursed Tomb
    ["Catacombs Coffins Near Stairs"]       = function() return HasLightSource() end,

    ["Catacombs Coffins With Blue Light"]   = function() return HasLightSource() end,

    ["Corrupted Room"]                      = function() return And(HasLightSource(), WasItemReceived("corruptkey")) end,

    ["Gated Tomb Near Corrupted Room"]      = function() return HasLightSource() end,

    ["Catacombs Hidden Room"]               = function() return And(HasLightSource(), HasDustyOrb()) end,

    ["Deep Coffin Storage"]                 = function() return HasLightSource() end,

    ["Red Skeleton"]                        = function() return And(HasLightSource(), HasElement("ele_light"), WasItemReceived("ele_blood")) end,

    ["Mausoleum Hidden Chest"]              = function() return And(HasLightSource(), HasDustyOrb()) end,

    ["Mausoleum Upper Alcove Table"]        = function() return And(HasLightSource(), HasElement("ele_light"), CanJumpHeight("Medium")) end,

    ["Mausoleum Maze (Early)"]              = function() return And(HasLightSource(), HasElement("ele_light")) end,

    ["Mausoleum Maze (Middle)"]             = function() return And(HasLightSource(), HasElement("ele_light")) end,

    ["Mausoleum Central Room (Right)"]      = function() return And(HasLightSource(), HasElement("ele_light")) end,

    ["Mausoleum Central Room (Left)"]       = function() return And(HasLightSource(), HasElement("ele_light")) end,

    ["Mausoleum Central Room (Back)"]       = function() return And(HasLightSource(), HasElement("ele_light")) end,

    ["Mausoleum Central Room (Left Path)"]  = function() return And(HasLightSource(), HasElement("ele_light")) end,

    ["Mausoleum Central Room (Right Path)"] = function() return And(HasLightSource(), HasElement("ele_light")) end,

    ["Kill Death"]                          = function() return And(HasLightSource(), HasElement("ele_light"), Or(WasItemReceived("limbo"),
                                                WasItemReceived("brokensword"), WasItemReceived("fractureddeath"), WasItemReceived("fracturedlife"))) end,

    ["Tomb With Switch"]                    = function() return HasLightSource() end,

    ["Tomb With Sitting Corpse"]            = function() return HasLightSource() end,

    ["Demi Chest"]                          = function() return And(HasLightSource(), CanJumpHeight("Medium")) end,

    ["Near Light Switch"]                   = function() return HasLightSource() end,

    ["Hidden Room in Tomb"]                 = function() return And(HasLightSource(), HasDustyOrb()) end,

    ["Hidden Chest in Tomb"]                = function() return And(HasLightSource(), HasDustyOrb()) end,

-- Yosei Forest
    ["Barrel Group"]                    = function() return AccessibilityLevel.Normal end,

    ["Blood Pool"]                      = function() return AccessibilityLevel.Normal end,

    ["Banches Within Tree"]             = function() return AccessibilityLevel.Normal end,

    ["Chest Near Tree"]                 = function() return AccessibilityLevel.Normal end,

    ["Blood Plant's Insides"]           = function() return WasItemReceived("ele_blood") end,

    ["Hanging In The Trees"]            = function() return AccessibilityLevel.Normal end,

    ["YF: Hidden Chest"]                = function() return And(HasDustyOrb(), Or(CanJumpHeight("Medium"), WasItemReceived("ele_blood"))) end,

    ["Room Defended by Blood Plant"]    = function() return WasItemReceived("ele_blood") end,

    ["Patchouli's Canopy Offer"]        = function() return Or(CanJumpHeight("Medium"), WasItemReceived("ele_blood")) end,

    ["Patchouli's Reward"]              = function() return And(Or(CanJumpHeight("Medium"), WasItemReceived("ele_blood")), WasItemReceived("skullofjosiah")) end,

-- Forest Canopy
    ["Branch Lower Edge"]       = function() return AccessibilityLevel.Normal end,

    ["Branch Cave"]             = function() return AccessibilityLevel.Normal end,

    ["Chest"]                   = function() return AccessibilityLevel.Normal end,

    ["Wooden Statue (Josiah)"]  = function() return AccessibilityLevel.Normal end,

    ["Wooden Statue (Sitting)"] = function() return AccessibilityLevel.Normal end,

-- Forbidden Archives
    ["Back Room Past Bridge"]       = function() return AccessibilityLevel.Normal end,

    ["Strange Corpse"]              = function() return HasDustyOrb() end,

    ["Short Wall Near Trees"]       = function() return AccessibilityLevel.Normal end,

    ["Against Wall Near Trees"]     = function() return AccessibilityLevel.Normal end,

    ["Snail Lectern (Near)"]        = function() return Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring")) end,

    ["Snail Lectern (Far)"]         = function() return Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring")) end,

    ["Rug on Balcony"]              = function() return Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring")) end,

    ["Rooftops"]                    = function() return Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring")) end,

    ["Hidden Room Upper Floor"]     = function() return And(HasDustyOrb(), Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring"))) end,

    ["Hidden Room Lower Floor"]     = function() return And(HasDustyOrb(), Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring"), WasItemReceived("spiritwarp"))) end,

    ["Near Twisty Tree"]            = function() return Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring"), WasItemReceived("spiritwarp")) end,

    ["uwu"]                         = function() return Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring"), WasItemReceived("spiritwarp")) end,

    ["Daedalus Knowledge (First)"]  = function() return And(Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring"), WasItemReceived("spiritwarp")),
                                        IsItemStageAtLeastN("blackbook", 1)) end,

    ["Daedalus Knowledge (Second)"] = function() return And(Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring"), WasItemReceived("spiritwarp")),
                                        IsItemStageAtLeastN("blackbook", 2)) end,

    ["Daedalus Knowledge (Third)"]  = function() return And(Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring"), WasItemReceived("spiritwarp")),
                                        IsItemStageAtLeastN("blackbook", 3)) end,

    ["Corner Near Daedalus"]        = function() return Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring"), WasItemReceived("spiritwarp")) end,

-- Castle Le Fanu
    ["Outside Corner"]                          = function() return AccessibilityLevel.Normal end,

    ["Cattle Cell (South)"]                     = function() return WasItemReceived("ele_blood") end,

    ["Cattle Cell (West)"]                      = function() return WasItemReceived("ele_blood") end,

    ["Cattle Cell (Center)"]                    = function() return WasItemReceived("ele_blood") end,

    ["Cattle Cell (North)"]                     = function() return WasItemReceived("ele_blood") end,

    ["Hidden Cattle Cell"]                      = function() return And(WasItemReceived("ele_blood"), HasDustyOrb()) end,

    ["Hallway Rubble Room"]                     = function() return IsItemStageAtLeastN("progressivevampiricsymbol", 1) end,

    ["Hallway Dining Room"]                     = function() return IsItemStageAtLeastN("progressivevampiricsymbol", 1) end,

    ["Garrat Resting Room (Fountain)"]          = function() return IsItemStageAtLeastN("progressivevampiricsymbol", 1) end,

    ["Garrat Resting Room (Wall)"]              = function() return IsItemStageAtLeastN("progressivevampiricsymbol", 1) end,

    ["Hallway Dead End Before Blue Doors"]      = function() return IsItemStageAtLeastN("progressivevampiricsymbol", 1) end,

    ["Upper Floor Coffin Room (Small Room)"]    = function() return IsItemStageAtLeastN("progressivevampiricsymbol", 2) end,

    ["Upper Floor Coffin Room (Large Room)"]    = function() return IsItemStageAtLeastN("progressivevampiricsymbol", 2) end,

    ["Upper Floor Coffin Room (Double)"]        = function() return And(IsItemStageAtLeastN("progressivevampiricsymbol", 3), HasDustyOrb()) end,

    ["Upper Floor Coffin Room (Hallway)"]       = function() return IsItemStageAtLeastN("progressivevampiricsymbol", 2) end,

-- Sealed Ballroom
    ["Entry Small Room Lounge"]         = function() return HasDoorKey("ballroomsideroomskeyring") end,

    ["Entry Hidden Couch Top"]          = function() return And(HasDoorKey("ballroomsideroomskeyring"), HasDustyOrb()) end,

    ["Entry Hidden Couch Bottom"]       = function() return And(HasDoorKey("ballroomsideroomskeyring"), HasDustyOrb()) end,

    ["Entry Hidden Cave in a Lounge"]   = function() return And(HasDoorKey("ballroomsideroomskeyring"), HasDustyOrb()) end,

    ["Entry Lounge Long Table"]         = function() return HasDoorKey("ballroomsideroomskeyring") end,

    ["Side Hidden Cave"]                = function() return HasDustyOrb() end,

    ["Side Chest Near Switch"]          = function() return HasDoorKey("ballroomsideroomskeyring") end,

    ["Side Painting Viewing Room"]      = function() return HasDoorKey("ballroomsideroomskeyring") end,

    ["Side Hidden Casket Room"]         = function() return HasDustyOrb() end,

    ["Side XP Drain Party Room"]        = function() return HasDoorKey("ballroomsideroomskeyring") end,

-- Laetus Chasm
    ["Hidden Room"]                 = function() return HasDustyOrb() end,

    ["Invisible Path to Cliffside"] = function() return WereAnyItemsReceived({"coffin", "icarianflight"}) end,

-- Great Well Surface
    ["Demi's Gift"] = function() return AccessibilityLevel.Normal end,

-- Throne Room
    ["Crilall's Book Repository"] = function() return AccessibilityLevel.Normal end,

-- A Holy Battlefield
    ["Sngula Umbra's Remains"] = function() return AccessibilityLevel.Normal end,

-- Boiling Grotto
    ["Slab of a Broken Bridge"]         = function() return AccessibilityLevel.Normal end,

    ["BG: Hidden Chest"]                = function() return HasDustyOrb() end,

    ["Corpse Beneath Entrance"]         = function() return AccessibilityLevel.Normal end,

    ["Triple Hidden Chest"]             = function() return HasDustyOrb() end,

    ["Lava Overseeing Dragon Switch"]   = function() return AccessibilityLevel.Normal end,

    ["Through Dragon Switch Tunnel"]    = function() return AccessibilityLevel.Normal end,

-- Boiling Grotto (Sand Temple)
    ["Room Buried in Sand"]     = function() return HasSwitch("grottofireswitchkeyring") end,

    ["Top Right Sarcophagus"]   = function() return HasSwitch("grottofireswitchkeyring") end,

    ["Second Floor Snake Room"] = function() return And(CanJumpHeight("Medium"), HasSwitch("grottofireswitchkeyring")) end,

    ["Basement Snake Pit"]      = function() return And(CanJumpHeight("High"), HasSwitch("grottofireswitchkeyring"), HasDustyOrb()) end,

    ["Hidden Sarcophagus"]      = function() return And(HasDustyOrb(), HasSwitch("grottofireswitchkeyring")) end,

    ["Second Floor Dead End"]   = function() return And(CanJumpHeight("Medium"), HasSwitch("grottofireswitchkeyring")) end,

    ["Lunacid Sandwich"]        = function() return And(WasItemReceived("spiritwarp"), HasSwitch("grottofireswitchkeyring")) end,

    ["Chest Near Switch"]       = function() return HasSwitch("grottofireswitchkeyring") end,

    ["Chest Overlooking Crypt"] = function() return And(CanJumpHeight("High"), HasSwitch("grottofireswitchkeyring")) end,

    ["Floor Switch Maze"]       = function() return HasSwitch("grottofireswitchkeyring") end,

    ["Basement Stone Rubble"]   = function() return HasSwitch("grottofireswitchkeyring") end,

    ["Triple Sarcophagus"]      = function() return HasSwitch("grottofireswitchkeyring") end,

-- Tower of Abyss
    ["Floor 5 Chest"]       = function() return HasDoorKey("towerofabysskeyring") end,

    ["Floor 10 Chest"]      = function() return HasDoorKey("towerofabysskeyring") end,

    ["Floor 15 Chest"]      = function() return HasDoorKey("towerofabysskeyring") end,

    ["Floor 20 Chest"]      = function() return HasDoorKey("towerofabysskeyring") end,

    ["Floor 25 Chest"]      = function() return HasDoorKey("towerofabysskeyring") end,

    ["Floor 30 Chest"]      = function() return HasDoorKey("towerofabysskeyring") end,

    ["Floor 35 Chest"]      = function() return HasDoorKey("towerofabysskeyring") end,

    ["Floor 40 Chest"]      = function() return HasDoorKey("towerofabysskeyring") end,

    ["Floor 45 Chest"]      = function() return HasDoorKey("towerofabysskeyring") end,

    ["Floor 50 Chest"]      = function() return HasDoorKey("towerofabysskeyring") end,

    ["Prize Beneath Tree"]  = function() return HasDoorKey("towerofabysskeyring") end,

-- Terminus Prison
    ["Third Floor Locked Cell Left"]                = function() return HasDoorKey("prisonmaindoorkey") end,

    ["Third Floor Locked Cell Right"]               = function() return HasDoorKey("prisonmaindoorkey") end,

    ["Third Floor Locked Cell South"]               = function() return HasDoorKey("prisonmaindoorkey") end,

    ["Almost Bottomless Pit"]                       = function() return And(HasDoorKey("prisonmaindoorkey"),
                                                        WereAnyItemsReceived({"spiritwarp", "icarianflight"})) end,

    ["Second Floor Broken Cell"]                    = function() return AccessibilityLevel.Normal end,

    ["Second Floor Jailer's Table"]                 = function() return AccessibilityLevel.Normal end,

    ["First Floor Hidden Cell"]                     = function() return And(HasDustyOrb(), HasLightSource()) end,

    ["First Floor Hidden Debris Room"]              = function() return And(HasDustyOrb(), HasLightSource()) end,

    ["First Floor Remains"]                         = function() return HasLightSource() end,

    ["Green Asylum Guarded Alcove (Left)"]          = function() return HasLightSource() end,

    ["Green Asylum Guarded Alcove (Right)"]         = function() return HasLightSource() end,

    ["Green Asylum Long Alcove"]                    = function() return HasLightSource() end,

    ["Green Asylum Bone Pit"]                       = function() return HasLightSource() end,

    ["Egg's Resting Place"]                         = function() return And(HasLightSource(), WasItemReceived("skeletonegg")) end,

    ["Fourth Floor Cell Hanging Remains"]           = function() return HasDoorKey("prisonmaindoorkey") end,

    ["Fourth Floor Maledictus Secret"]              = function() return And(HasDoorKey("prisonmaindoorkey"), HasDustyOrb()) end,

    ["Fourth Floor Hidden Jailer Sleeping Spot"]    = function() return And(HasDoorKey("prisonmaindoorkey"), HasDustyOrb()) end,

    ["Fourth Floor Jailer Break Room"]              = function() return HasDoorKey("prisonmaindoorkey") end,

    ["Etna's Resting Place Item 1"]                 = function() return HasDoorKey("prisonmaindoorkey") end,

    ["Etna's Resting Place Item 2"]                 = function() return HasDoorKey("prisonmaindoorkey") end,

    ["Etna's Resting Place Item 3"]                 = function() return HasDoorKey("prisonmaindoorkey") end,

    ["Fourth Floor Collapsed Tunnel"]               = function() return HasDoorKey("prisonmaindoorkey") end,

-- Forlorn Arena
    ["Corpse Waiting For A Full Moon"]                 = function() return AccessibilityLevel.Normal end,

    ["Entry Rock Parkour"]                             = function() return AccessibilityLevel.Normal end,

    ["Temple of Earth Hidden Plant Haven"]             = function() return HasDustyOrb() end,

    ["Temple of Earth Hidden Room"]                    = function() return HasDustyOrb() end,

    ["Temple of Earth Fractured Chest"]                = function() return And(HasDustyOrb(), CanJumpHeight("High")) end,

    ["Temple of Earth Chest Near Switch"]              = function() return AccessibilityLevel.Normal end,

    ["Temple of Water Room Near Water"]                = function() return AccessibilityLevel.Normal end,

    ["Temple of Water Corner Near Water"]              = function() return AccessibilityLevel.Normal end,

    ["Temple of Water Collapsed End Near Balcony"]     = function() return AccessibilityLevel.Normal end,

    ["Temple of Water Hidden Basement"]                = function() return HasDustyOrb() end,

    ["Temple of Water Hidden Laser Room"]              = function() return HasDustyOrb() end,

    ["Temple of Water Hidden Alcove Before Stairs"]    = function() return HasDustyOrb() end,

    ["Temple of Water Hidden Alcove"]                  = function() return HasDustyOrb() end,

    ["Temple of Water Hidden Alcove Before Switch"]    = function() return HasDustyOrb() end,

    ["Temple of Water Fractured Chest"]                = function() return And(HasDustyOrb(), CanJumpHeight("High")) end,

    ["Temple of Water Chest Near Switch"]              = function() return AccessibilityLevel.Normal end,

-- Labyrinth of Ash
    ["Entry Coffin"]            = function() return AccessibilityLevel.Normal end,

    ["Giant Remains"]           = function() return AccessibilityLevel.Normal end,

    ["Behind Statue"]           = function() return AccessibilityLevel.Normal end,

    ["Rocks Near Switch"]       = function() return AccessibilityLevel.Normal end,

    ["Forbidden Light Chest"]   = function() return AccessibilityLevel.Normal end,

    ["Hidden Light Stash"]      = function() return HasDustyOrb() end,

    ["NNSNSSNSNN Lost Maze"]    = function() return HasDustyOrb() end,

-- Chamber of Fate
    ["Calamis' Weapon of Choice"]   = function() return AccessibilityLevel.Normal end,

-- Shopsanity
    ["Buy Enchanted Key"]               = function() return AccessibilityLevel.Normal end,

    ["Buy Rapier"]                      = function() return Or(WasItemReceived("sherylinitialvoucher"), AccessibilityLevel.Partial) end,

    ["Buy Steel Needle"]                = function() return Or(WasItemReceived("sherylinitialvoucher"), AccessibilityLevel.Partial) end,

    ["Buy Crossbow"]                    = function() return Or(WasItemReceived("sherylinitialvoucher"), AccessibilityLevel.Partial) end,

    ["Buy Oil Lantern"]                 = function() return And(WasItemReceived("igniscalor"), EnteredScene("Boiling Grotto"), Or(WasItemReceived("sherylgoldenvoucher"), AccessibilityLevel.Partial)) end,

    ["Buy Ocean Elixir (Patchouli)"]    = function() return And(Or(CanJumpHeight("Medium"), WasItemReceived("ele_blood")), Or(WasItemReceived("patchoulidrinksvoucher"), AccessibilityLevel.Partial)) end,

    ["Buy Privateer Musket"]            = function() return And(WasItemReceived("igniscalor"), EnteredScene("Boiling Grotto"), Or(WasItemReceived("sherylgoldenvoucher"), AccessibilityLevel.Partial)) end,

    ["Buy Jotunn Slayer"]               = function() return And(Or(WasItemReceived("sheryldreamervoucher"), AccessibilityLevel.Partial), CanKillJotunn()) end,
}

function CanReach(location)
    if type(LOCATION_LOGIC[location]) == "function" then
        return LOCATION_LOGIC[location]()
    end
    return AccessibilityLevel.None
end

VANILLA_MAP_LOGIC = {
    ["Hollow Basin"] = function() return AccessibilityLevel.Normal end,

    ["Wings Rest"] = function() return AccessibilityLevel.Normal end,

    ["Forbidden Archives"] = function() return AccessibilityLevel.Normal end,

    ["The Fetid Mire"] = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey")) end,

    ["Yosei Forest"] = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey")) end,

    ["Forest Canopy"] = function() return And(CanEnter("Yosei Forest"), HandleKeys("YF")) end,

    ["The Sanguine Sea"] = function() return CanEnter("The Fetid Mire") end,

    ["Castle Le Fanu"] = function() return CanEnter("The Fetid Mire") end,

    ["A Holy Battlefield"] = function() return CanEnter("Castle Le Fanu") end,

    ["Accursed Tomb"] = function() return CanEnter("The Fetid Mire") end,

    ["Laetus Chasm"] = function() return Or(And(IsItemStageAtLeastN("progressivevampiricsymbol", 2), HasSwitch("forbiddenarchiveselevatorswitchkeyring")), -- via Library
                                                CanJumpHeight("High")) end, -- via GWS

    ["Great Well Surface"] = function() return Or(CanReach("Laetus Chasm"), CanJumpHeight("High")) end,

    ["Boiling Grotto"] = function() return And(CanReach("Castle Le Fanu"), IsItemStageAtLeastN("progressivevampiricsymbol", 2)) end,

    ["Tower of Abyss"] = function() return CanEnter("Boiling Grotto") end,

    ["Throne Room"] = function() return And(CanReach("Castle Le Fanu"), IsItemStageAtLeastN("progressivevampiricsymbol", 3)) end,

    ["Sealed Ballroom"] = function() return And(CanReach("Castle Le Fanu"), IsItemStageAtLeastN("progressivevampiricsymbol", 2),
                                                And(HasElement("ele_dark"), Or(CanJumpHeight("High"), WasItemReceived("ranged_attacks")))) end, -- can activate switch

    ["Terminus Prison"] = function() return CanEnter("Throne Room") end,

    ["Labyrinth of Ash"] = function() return CanEnter("Terminus Prison") end,

    ["Forlorn Arena"] = function() return And(CanEnter("Terminus Prison"), WasItemReceived("terminusprisonkey")) end,

    ["Chamber of Fate"] = function() return And(CanEnter("Forlorn Arena"), WereAllItemsReceived({"watertalisman", "earthtalisman"})) end,
}

function CanEnter(map)
    if type(VANILLA_MAP_LOGIC[map]) == "function" then
        return VANILLA_MAP_LOGIC[map]()
    end
    return AccessibilityLevel.None
end

-- Dropsanity
VANILLA_ENEMY_LOGIC = {
    ["Snail"] = function() return And(CanEnter("Hollow Basin"), AccessibilityLevel.Normal) end,

    ["Milk Snail"] = function() return Or(CanEnter("Hollow Basin"),
        And(CanEnter("Forbidden Archives"), Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring"))))
    end,

    -- ["Mummy"] = function() return And(CanEnter("Hollow Basin"), CanEnterTemple(), HasSwitch("templeofsilenceswitchkey")) end,

    -- ["Mummy Knight"] = function() return And(CanEnterTemple(), HasSwitch("templeofsilenceswitchkey")) end,

    -- ["Shulker"] = function() return AccessibilityLevel.Normal end,

    -- ["Necronomicon"] = function() return AccessibilityLevel.Normal end,

    -- ["Chimera"] = function() return Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring")) end,

    -- ["Enlightened One"] = function() return Or(CanJumpHeight("High"), HasSwitch("forbiddenarchiveselevatorswitchkeyring")) end,

    -- ["Slime Skeleton"] = function() return AccessibilityLevel.Normal end,

    ["Skeleton"] = function() return Or(
        And(CanEnter("Accursed Tomb"), And(Or(CanJumpHeight("Medium"), HasElement("ele_light")), HasLightSource())),
        CanEnter("Terminus Prison"),
        CanEnter("The Sanguine Sea"),
        CanEnter("The Fetid Mire"),
        CanEnter("Boiling Grotto")
    )

    end,

    -- ["Rat King"] = function() return AccessibilityLevel.Normal end,

    -- ["Rat Queen"] = function() return AccessibilityLevel.Normal end,

    -- ["Rat"] = function() return AccessibilityLevel.Normal end,

    ["Kodama"] = function() return CanEnter("Yosei Forest") end,

    -- ["Yakul"] = function() return AccessibilityLevel.Normal end,

    -- ["Venus"] = function() And(CanEnter("Forlorn Arena"), HasDustyOrb()) end,

    -- ["Neptune"] = function()
    --    if sceneName == "FOREST_B1" then
    --        return AccessibilityLevel.Normal
    --   end
    --    return Or(CanJumpHeight("Medium"), WasItemReceived("ele_blood"))
    --end,

    -- ["Unilateralis"] = function() return AccessibilityLevel.Normal end,

    -- ["Mimic"] = function() return HasDustyOrb() end,

    -- ["Hemalith"] = function() return AccessibilityLevel.Normal end,

    -- ["Mare"] = function() return HasLightSource() end,

    -- ["Mi-Go"] = function() return HasLightSource() end,

    ["Phantom"] = function() Or(And(CanEnter("Accursed Tomb"), HasLightSource(), HasElement("ele_light")),
        CanEnter("Castle Le Fanu"))end,

    -- ["Cursed Painting"] = function(sceneName)
    --    if sceneName == "HAUNT" then
    --        return HasLightSource()
    --    end
    --    return IsItemStageAtLeastN("progressivevampiricsymbol", 2)
    -- end,

    -- ["Malformed"] = function() return Or(And(WasItemReceived("ele_blood"), HasDustyOrb()),
    --                   IsItemStageAtLeastN("progressivevampiricsymbol", 2)) end,

    -- ["Poltergeist"] = function() return IsItemStageAtLeastN("progressivevampiricsymbol", 2) end,

    -- ["Great Bat"] = function() return Or(IsItemStageAtLeastN("progressivevampiricsymbol", 1)) end,

    -- ["Vampire"] = function() return Or(WasItemReceived("ele_blood")) end,

    ["Vampire Page"] = function() return And(CanEnter("Castle Le Fanu"),Or(WasItemReceived("ele_blood"),
                         IsItemStageAtLeastN("progressivevampiricsymbol", 1))) end,

    -- ["Malformed Horse"] = function() return AccessibilityLevel.Normal end,

    -- ["Hallowed Husk"] = function() return AccessibilityLevel.Normal end,

    -- ["Ikurr'Ilb"] = function() return AccessibilityLevel.Normal end,

    ["Obsidian Skeleton"] = function() return Or(CanEnter("Boiling Grotto"),
        And(CanEnter("Terminus Prison"), HasLightSource())) end,

    -- ["Serpent"] = function() return HasSwitch("grottofireswitchkeyring") end,

    ["Anpu"] = function() return And(CanEnter("Boiling Grotto"), HasSwitch("grottofireswitchkeyring")) end,

    -- ["Embalmed"] = function() return HasSwitch("grottofireswitchkeyring") end,

    -- ["Cerritulus Lunam"] = function() return HasLightSource() end,

    ["Jailor"] = function() return CanEnter("Terminus Prison") end,

    -- ["Giant Skeleton"] = function() return HasLightSource() end,

    ["Sucsarian"] = function() return CanEnter("Forlorn Arena") end,

    -- ["Ceres"] = function() return CanJumpHeight("High") end,

    -- ["Vesta"] = function() return CanJumpHeight("High") end,

    -- ["Gloom Wood"] = function() return AccessibilityLevel.Normal end,

    ["Cetea"] = function() return CanEnter("Labyrinth of Ash") end,

    ["Abyssal Demon"] = function() return Or(CanEnter("The Sanguine Sea"),
        And(CanEnter("Accursed Tomb"), HasLightSource(), HasElement("ele_light"))) end
}

function CanKill(enemy)
    if type(VANILLA_ENEMY_LOGIC[enemy]) == "function" then
        return VANILLA_ENEMY_LOGIC[enemy]()
    end
    return AccessibilityLevel.None
end