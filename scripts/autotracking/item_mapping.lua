-- use this file to map the AP item ids to your items
-- first value is the code of the target item and the second is the item type (currently only "toggle", "progressive" and "consumable" but feel free to expand for your needs!)
-- here are the SM items as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/item_mapping.lua
ITEM_MAPPING = {
	-- [1] = {{"healthvial"}, "consumable"},
	-- [2] = {{"manavial"}, "consumable"},
	-- [3] = {{"antidote"}, "consumable"},
	-- [4] = {{"bloodwine"}, "consumable"},
	-- [5] = {{"crystalshard"}, "consumable"},
	-- [6] = {{"oceanelixir"}, "consumable"},
	-- [7] = {{"earthelixir"}, "consumable"},
	-- [8] = {{"poisonthrowingknife"}, "consumable"},
	 [9] = {{"blackbook"}, "progressive"},
	-- [10] = {{"holywater"}, "consumable"},
	-- [11] = {{"fairymoss"}, "consumable"},
	-- [12] = {{"lighturn"}, "consumable"},
	-- [13] = {{"ashes"}, "consumable"},
	-- [14] = {{"clothbandage"}, "toggconsumablele"},
	-- [15] = {{"moonlightvial"}, "consumable"},
	-- [16] = {{"spectralcandle"}, "consumable"},
	-- [17] = {{"darkurn"}, "consumable"},
	-- [18] = {{"wispheart"}, "consumable"},
	-- [19] = {{"staffofosiris"}, "consumable"},
	 [20] = {{"whitevhstape"}, "toggle"},
	 [21] = {{"vhstape"}, "toggle"},
	 [22] = {{"corruptkey"}, "toggle"},
	 [23] = {{"skullofjosiah"}, "toggle"},
	 [24] = {{"progressivevampiricsymbol"}, "progressive"},
	-- [27] = {{"crystallantern"}, "toggle"},
	 [28] = {{"terminusprisonkey"}, "toggle"},
	 [29] = {{"enchantedkey"}, "progressive"},
	-- [30] = {{"surveybanner"}, "consumable"},
	-- [31] = {{"ectoplasm"}, "consumable"},
	-- [32] = {{"snowflakeobsidian"}, "consumable"},
	-- [33] = {{"moonpetal"}, "consumable"},
	-- [34] = {{"fracturedlife"}, "consumable"},
	-- [35] = {{"fractureddeath"}, "consumable"},
	-- [36] = {{"brokensword"}, "consumable"},
	 [37] = {{"watertalisman"}, "toggle"},
	 [38] = {{"earthtalisman"}, "toggle"},
	 [39] = {{"strangecoin"}, "consumable"},
	-- [40] = {{"oillantern"}, "toggle"},
	-- [41] = {{"bomb"}, "consumable"},
	-- [42] = {{"poisonurn"}, "consumable"},
	-- [43] = {{"silver"}, "consumable"},
	 [44] = {{"skeletonegg"}, "toggle"},
	-- [45] = {{"driedrat"}, "consumable"},
	 [46] = {{"dustycrystalorb"}, "toggle"},
	-- [47] = {{"skeletalrattle"}, "toggle"},
	-- [48] = {{"pinkshrimp"}, "consumable"},
	-- [49] = {{"angelfeather"}, "consumable"},
	-- [50] = {{"fireopal"}, "consumable"},
	-- [51] = {{"lotusseedpod"}, "consumable"},
	-- [52] = {{"onyx"}, "consumable"},
	-- [53] = {{"destroyingangelmushroom"}, "consumable"},
	-- [54] = {{"oceanboneshard"}, "consumable"},
	-- [55] = {{"oceanboneshell"}, "consumable"},
	-- [56] = {{"yellowmorel"}, "consumable"},
	-- [57] = {{"bloodweed"}, "consumable"},
	-- [58] = {{"opal"}, "consumable"},
	-- [59] = {{"obsidian"}, "consumable"},
	-- [60] = {{"ikurr'ilbroot"}, "consumable"},
	-- [61] = {{"fool'sgold"}, "consumable"},
	-- [62] = {{"sheryl'sinitialofferingsvoucher"}, "toggle"},
	-- [63] = {{"sheryl'sgoldenarmorvoucher"}, "toggle"},
	-- [64] = {{"sheryl'sdreamervoucher"}, "toggle"},
	-- [65] = {{"patchouli'sdrinkvoucher"}, "toggle"},
	-- [66] = {{"fiddlehead"}, "consumable"},
	-- [67] = {{"firecoral"}, "consumable"},
	-- [68] = {{"bones"}, "consumable"},
	-- [69] = {{"vampiricashes"}, "consumable"},
	-- [70] = {{"throwingknife"}, "consumable"},
	-- [71] = {{"deepknowledge"}, "toggle"},
	-- [72] = {{"textongreatwellresourcefulness"}, "toggle"},
	-- [101] = {{"healthviai"}, "consumable"},
	-- [102] = {{"poisontrap"}, "toggle"},
	-- [103] = {{"blindnesstrap"}, "toggle"},
	-- [104] = {{"slownesstrap"}, "toggle"},
	-- [105] = {{"manadraintrap"}, "toggle"},
	-- [106] = {{"xpdraintrap"}, "toggle"},
	-- [107] = {{"cursetrap"}, "toggle"},
	-- [108] = {{"bleedtrap"}, "toggle"},
	-- [109] = {{"eggnog"}, "consumable"},
	-- [110] = {{"coal"}, "consumable"},
	-- [151] = {{"axeofharming"}, "toggle"},
	-- [152] = {{"battleaxe"}, "toggle"},
	-- [153] = {{"bladeofjusztina"}, "toggle"},
	-- [154] = {{"bladeofophelia"}, "toggle"},
	-- [155] = {{"blessedwind"}, "toggle"},
	-- [156] = {{"brokenhilt"}, "toggle"},
	-- [157] = {{"brokenlance"}, "toggle"},
	-- [158] = {{"corrupteddagger"}, "toggle"},
	-- [159] = {{"darkrapier"}, "toggle"},
	-- [160] = {{"elfenbow"}, "toggle"},
	-- [161] = {{"elfensword"}, "toggle"},
	-- [162] = {{"fishingspear"}, "toggle"},
	-- [163] = {{"marauderblackflail"}, "toggle"},
	-- [164] = {{"halberd"}, "toggle"},
	-- [165] = {{"ironclaw"}, "toggle"},
	-- [166] = {{"moonlight"}, "toggle"},
	-- [167] = {{"obsidianseal"}, "toggle"},
	-- [168] = {{"replicasword"}, "toggle"},
	-- [169] = {{"ritualdagger"}, "toggle"},
	-- [170] = {{"serpentfang"}, "toggle"},
	-- [171] = {{"shadowblade"}, "toggle"},
	-- [172] = {{"steelspear"}, "toggle"},
	-- [173] = {{"stoneclub"}, "toggle"},
	-- [174] = {{"torch"}, "toggle"},
	-- [175] = {{"twistedstaff"}, "toggle"},
	-- [176] = {{"vampirehuntersword"}, "toggle"},
	 [177] = {{"wandofpower", "ele_light", "ele_fire", "ele_dark", "ele_poison"}, "toggle"},
	-- [178] = {{"wolframgreatsword"}, "toggle"},
	-- [179] = {{"woodenshield"}, "toggle"},
	-- [180] = {{"crossbow"}, "toggle"},
	-- [181] = {{"steelneedle"}, "toggle"},
	 [182] = {{"lucidblade"}, "toggle"},
	-- [183] = {{"hammerofcruelty"}, "toggle"},
	 [184] = {{"jotunnslayer"}, "toggle"},
	-- [185] = {{"rapier"}, "toggle"},
	-- [186] = {{"privateermusket"}, "toggle"},
	-- [187] = {{"rustedsword"}, "toggle"},
	-- [188] = {{"icesickle"}, "toggle"},
	-- [189] = {{"skeletonaxe"}, "toggle"},
	-- [190] = {{"cursedblade"}, "toggle"},
	-- [191] = {{"brittlearmingsword"}, "toggle"},
	-- [192] = {{"obsidiancursebrand"}, "toggle"},
	-- [193] = {{"obsidianpoisonguard"}, "toggle"},
	-- [194] = {{"goldenkhopesh"}, "toggle"},
	-- [195] = {{"goldensickle"}, "toggle"},
	-- [196] = {{"jailor'scandle"}, "toggle"},
	-- [197] = {{"sucsariandagger"}, "toggle"},
	-- [198] = {{"sucsarianspear"}, "toggle"},
	-- [199] = {{"lyrianlongsword"}, "toggle"},
	-- [200] = {{"lyriangreatsword"}, "toggle"},
	-- [201] = {{"darkgreatsword"}, "toggle"},
	-- [202] = {{"shiningblade"}, "toggle"},
	-- [203] = {{"poisonclaw"}, "toggle"},
	-- [204] = {{"ironclub"}, "toggle"},
	-- [205] = {{"irontorch"}, "toggle"},
	-- [206] = {{"firesword"}, "toggle"},
	-- [207] = {{"steellance"}, "toggle"},
	-- [208] = {{"doublecrossbow"}, "toggle"},
	-- [209] = {{"deathscythe"}, "toggle"},
	-- [210] = {{"elfenlongsword"}, "toggle"},
	-- [211] = {{"steelclaw"}, "toggle"},
	-- [212] = {{"steelclub"}, "toggle"},
	-- [213] = {{"saintishii"}, "toggle"},
	-- [214] = {{"silverrapier"}, "toggle"},
	-- [215] = {{"heritagesword"}, "toggle"},
	 [216] = {{"limbo"}, "toggle"},
	 [251] = {{"barrier"}, "toggle"},
	-- [252] = {{"bestialcommunion"}, "toggle"},
	-- [253] = {{"blooddrain"}, "toggle"},
	-- [254] = {{"bloodstrike"}, "toggle"},
	-- [255] = {{"blueflamearc"}, "toggle"},
	 [256] = {{"coffin"}, "toggle"},
	-- [257] = {{"corpsetransformation"}, "toggle"},
	-- [258] = {{"earthstrike"}, "toggle"},
	-- [259] = {{"earththorn"}, "toggle"},
	-- [260] = {{"fireworm"}, "toggle"},
	-- [261] = {{"flameflare"}, "toggle"},
	-- [262] = {{"flamespear"}, "toggle"},
	-- [263] = {{"ghostlight"}, "toggle"},
	-- [264] = {{"holywarmth"}, "toggle"},
	 [265] = {{"icarianflight"}, "toggle"},
	-- [266] = {{"icespear"}, "toggle"},
	-- [267] = {{"icetear"}, "toggle"},
	-- [268] = {{"igniscalor"}, "toggle"},
	-- [269] = {{"lavachasm"}, "toggle"},
	-- [270] = {{"lightreveal"}, "toggle"},
	-- [271] = {{"lightning"}, "toggle"},
	-- [272] = {{"lithomancy"}, "toggle"},
	-- [273] = {{"moonbeam"}, "toggle"},
	-- [274] = {{"poisonmist"}, "toggle"},
	 [275] = {{"rockbridge"}, "toggle"},
	-- [276] = {{"slimeorb"}, "toggle"},
	-- [277] = {{"spiritwarp"}, "toggle"},
	-- [278] = {{"summonfairy"}, "toggle"},
	-- [279] = {{"summonicesword"}, "toggle"},
	-- [280] = {{"winddash"}, "toggle"},
	-- [281] = {{"windslicer"}, "toggle"},
	-- [282] = {{"jinglebells"}, "toggle"},
	 [283] = {{"summonsnail"}, "toggle"},
	-- [284] = {{"darkskull"}, "toggle"},
	-- [285] = {{"summonkodama"}, "toggle"},
	-- [286] = {{"tornado"}, "toggle"},
	-- [287] = {{"quickstride"}, "toggle"},
	
	[301] = {{"hollowbasinswitchkey"}, "toggle"},
	[302] = {{"templeofsilenceswitchkey"}, "toggle"},
	[303] = {{"fetidmireswitchkey"}, "toggle"},
	[304] = {{"accursedtombswitchkeyring"}, "toggle"},
	[305] = {{"prometheusfireswitchkeyring"}, "toggle"},
	[306] = {{"forbiddenarchivesshortcutswitchkey"}, "toggle"},
	[307] = {{"forbiddenarchiveselevatorswitchkeyring"}, "toggle"},
	[308] = {{"sealedballroomswitchkey"}, "toggle"},
	[309] = {{"grottofireswitchkeyring"}, "toggle"},
	[310] = {{"sandtempleswitcheskeyring"}, "toggle"},
	[311] = {{"terminusprisonbackalleyswitchkey"}, "toggle"},
	[312] = {{"forlornarenagateswitchkey"}, "toggle"},
	[313] = {{"templeofwaterswitchkey"}, "toggle"},
	[314] = {{"templeofearthswitchkey"}, "toggle"},
	[315] = {{"labyrinthofashswitchkey"}, "toggle"},

	[351] = {{"brokenstepsdoorkey"}, "toggle"},
	[352] = {{"lowerricketybridgedoorkey"}, "toggle"},
	[353] = {{"sewersdoorkey"}, "toggle"},
	[354] = {{"treetopdoorkey"}, "toggle"},
	[355] = {{"tombsecretdoorkey"}, "toggle"},
	[356] = {{"sewersseadoorkey"}, "toggle"},
	[357] = {{"accurseddoorkey"}, "toggle"},
	[358] = {{"castledoorskey"}, "toggle"},
	[359] = {{"libraryexitdoorkey"}, "toggle"},
	[360] = {{"surfacedoorkey"}, "toggle"},
	[361] = {{"lightaccurseddoorkey"}, "toggle"},
	[362] = {{"queen'sthronedoorkey"}, "toggle"},
	[363] = {{"prisonmaindoorkey"}, "toggle"},
	[364] = {{"secondarylockkey"}, "toggle"},
	[365] = {{"burninghotkey"}, "toggle"},
	[366] = {{"forbiddendoorkey"}, "toggle"},
	[367] = {{"sucsariankey"}, "toggle"},
	[368] = {{"dreamerkey"}, "toggle"},
	[369] = {{"ballroomsideroomskeyring"}, "toggle"},
	[370] = {{"towerofabysskeyring"}, "toggle"},
	[371] = {{"ashendoorskeyring"}, "toggle"},
}

local ELEMENT <const> = {
    blood = "Blood",
    light = "Light",
    fire = "Fire",
    dark = "Dark",
    poison = "Poison",
    ice = "Ice",
    normal = "Normal",
    ignore = "IGNORE",
    melee = "Melee",
}

IMPORTANT_ITEMS = {
    [151] = {name="axeofharming", element=ELEMENT.poison, ranged=false},
    [152] = {name="battleaxe", element=ELEMENT.normal, ranged=false},
    [153] = {name="bladeofjusztina", element=ELEMENT.dark, ranged=false},
    [154] = {name="bladeofophelia", element=ELEMENT.normal, ranged=false},
    [155] = {name="blessedwind", element=ELEMENT.normal, ranged=false},
    [156] = {name="brokenhilt", element=ELEMENT.normal, ranged=false},
    [157] = {name="brokenlance", element=ELEMENT.normal, ranged=false},
    [158] = {name="corrupteddagger", element=ELEMENT.dark, ranged=false},
    [159] = {name="darkrapier", element=ELEMENT.dark, ranged=false},
    [160] = {name="elfenbow", element=ELEMENT.normal, ranged=true},
    [161] = {name="elfensword", element=ELEMENT.normal, ranged=false},
    [162] = {name="fishingspear", element=ELEMENT.normal, ranged=false},
    [163] = {name="marauderblackflail", element=ELEMENT.normal, ranged=false},
    [164] = {name="halberd", element=ELEMENT.normal, ranged=false},
    [165] = {name="ironclaw", element=ELEMENT.normal, ranged=false},
    [166] = {name="moonlight", element=ELEMENT.light, ranged=true},
    [167] = {name="obsidianseal", element=ELEMENT.dark, ranged=false},
    [168] = {name="replicasword", element=ELEMENT.normal, ranged=false},
    [169] = {name="ritualdagger", element=ELEMENT.poison, ranged=false},
    [170] = {name="serpentfang", element=ELEMENT.dark, ranged=false},
    [171] = {name="shadowblade", element=ELEMENT.dark, ranged=false},
    [172] = {name="steelspear", element=ELEMENT.normal, ranged=false},
    [173] = {name="stoneclub", element=ELEMENT.normal, ranged=false},
    [174] = {name="torch", element=ELEMENT.fire, ranged=false},
    [175] = {name="twistedstaff", element=ELEMENT.fire, ranged=true},
    [176] = {name="vampirehuntersword", element=ELEMENT.light, ranged=false},
    [177] = {name="wandofpower", element=ELEMENT.ignore, ranged=true},
    [178] = {name="wolframgreatsword", element=ELEMENT.normal, ranged=false},
    [179] = {name="woodenshield", element=ELEMENT.normal, ranged=false},
    [180] = {name="crossbow", element=ELEMENT.normal, ranged=true},
    [181] = {name="steelneedle", element=ELEMENT.normal, ranged=false},
    [182] = {name="lucidblade", element=ELEMENT.light, ranged=true},
    [183] = {name="hammerofcruelty", element=ELEMENT.dark .. " and " .. ELEMENT.light, ranged=false},
    [184] = {name="jotunnslayer", element=ELEMENT.fire .. " and " .. ELEMENT.dark, ranged=false},
    [185] = {name="rapier", element=ELEMENT.normal, ranged=false},
    [186] = {name="privateermusket", element=ELEMENT.normal, ranged=true},
    [187] = {name="rustedsword", element=ELEMENT.normal, ranged=false},
    [188] = {name="icesickle", element=ELEMENT.ice, ranged=false},
    [189] = {name="skeletonaxe", element=ELEMENT.normal, ranged=false},
    [190] = {name="cursedblade", element=ELEMENT.normal, ranged=false},
    [191] = {name="brittlearmingsword", element=ELEMENT.normal, ranged=false},
    [192] = {name="obsidiancursebrand", element=ELEMENT.dark, ranged=false},
    [193] = {name="obsidianpoisonguard", element=ELEMENT.dark, ranged=false},
    [194] = {name="goldenkhopesh", element=ELEMENT.normal, ranged=false},
    [195] = {name="goldensickle", element=ELEMENT.normal, ranged=false},
    [196] = {name="jailor'scandle", element=ELEMENT.fire, ranged=true},
    [197] = {name="sucsariandagger", element=ELEMENT.dark, ranged=false},
    [198] = {name="sucsarianspear", element=ELEMENT.dark, ranged=false},
    [199] = {name="lyrianlongsword", element=ELEMENT.normal, ranged=false},
    [200] = {name="lyriangreatsword", element=ELEMENT.normal, ranged=false},
    [201] = {name="darkgreatsword", element=ELEMENT.dark, ranged=false},
    [202] = {name="shiningblade", element=ELEMENT.light, ranged=false},
    [203] = {name="poisonclaw", element=ELEMENT.poison, ranged=false},
    [204] = {name="ironclub", element=ELEMENT.normal, ranged=false},
    [205] = {name="irontorch", element=ELEMENT.fire, ranged=false},
    [206] = {name="firesword", element=ELEMENT.fire, ranged=false},
    [207] = {name="steellance", element=ELEMENT.normal, ranged=false},
    [208] = {name="doublecrossbow", element=ELEMENT.normal, ranged=true},
    [209] = {name="deathscythe", element=ELEMENT.dark .. " and " .. ELEMENT.light, ranged=false},
    [210] = {name="elfenlongsword", element=ELEMENT.normal, ranged=true},
    [211] = {name="steelclaw", element=ELEMENT.normal, ranged=false},
    [212] = {name="steelclub", element=ELEMENT.normal, ranged=false},
    [213] = {name="saintishii", element=ELEMENT.dark .. " and " .. ELEMENT.fire, ranged=false},
    [214] = {name="silverrapier", element=ELEMENT.light, ranged=false},
    [215] = {name="heritagesword", element=ELEMENT.normal, ranged=false},
    [216] = {name="limbo", element=ELEMENT.normal, ranged=false},
    [253] = {name="blooddrain", element=ELEMENT.blood, ranged=true},
    [254] = {name="bloodstrike", element=ELEMENT.blood, ranged=true},
    [255] = {name="blueflamearc", element=ELEMENT.fire, ranged=false},
	[256] = {name="coffin", element=ELEMENT.normal, ranged=false},
    [258] = {name="earthstrike", element=ELEMENT.normal, ranged=true},
    [259] = {name="earththorn", element=ELEMENT.normal, ranged=true},
    [260] = {name="fireworm", element=ELEMENT.fire, ranged=true},
    [261] = {name="flameflare", element=ELEMENT.fire, ranged=true},
    [262] = {name="flamespear", element=ELEMENT.fire, ranged=true},
	[265] = {name="icarianflight", element=ELEMENT.normal, ranged=false},
    [266] = {name="icespear", element=ELEMENT.ice, ranged=true},
    [267] = {name="icetear", element=ELEMENT.ice, ranged=false},
    [268] = {name="igniscalor", element=ELEMENT.fire, ranged=false},
    [269] = {name="lavachasm", element=ELEMENT.fire, ranged=false},
    [270] = {name="lightreveal", element=ELEMENT.light, ranged=false},
    [271] = {name="lightning", element=ELEMENT.light, ranged=true},
    [273] = {name="moonbeam", element=ELEMENT.light, ranged=true},
    [274] = {name="poisonmist", element=ELEMENT.poison, ranged=false},
	[275] = {name="rockbridge", element=ELEMENT.normal, ranged=false},
    [276] = {name="slimeorb", element=ELEMENT.poison, ranged=true},
    [281] = {name="windslicer", element=ELEMENT.normal, ranged=true},
    [283] = {name="summonsnail", element=ELEMENT.normal, ranged=false},
    [284] = {name="darkskull", element=ELEMENT.dark, ranged=true},
    [285] = {name="summonkodama", element=ELEMENT.normal, ranged=false},
    [286] = {name="tornado", element=ELEMENT.normal, ranged=true},
}

function UpdateElements(updates)
    for _, item in pairs(IMPORTANT_ITEMS) do
        if updates[item.name] then
            item.element = updates[item.name]
        end
    end
end

local function getElements(input)
    local elements = {}

    local element1, element2 = input:match("^(%a+) and (%a+)$")
    if element1 and element2 then
        table.insert(elements, ELEMENT[element1:lower()])
        table.insert(elements, ELEMENT[element2:lower()])
    else
        local element = input:match("^(%a+)$")
        if element then
            table.insert(elements, ELEMENT[element:lower()])
        end
    end

    function elements:for_each(action)
        for _, element in ipairs(self) do
            action(element)
        end
    end

    function elements:contains(this)
        for _, element in ipairs(self) do
            if element == this then
                return true
            end
        end
        return false
    end

    return elements
end

ElementAction = {
    [ELEMENT.blood] = function()
        Tracker:FindObjectForCode("ele_blood").Active = true
    end,
    [ELEMENT.light] = function()
        Tracker:FindObjectForCode("ele_light").Active = true
    end,
    [ELEMENT.fire] = function()
        Tracker:FindObjectForCode("ele_fire").Active = true
    end,
    [ELEMENT.dark] = function()
        Tracker:FindObjectForCode("ele_dark").Active = true
    end,
    [ELEMENT.poison] = function()
        Tracker:FindObjectForCode("ele_poison").Active = true
    end,
    [ELEMENT.ice] = function()
        -- Tracker:FindObjectForCode("ele_ice").Active = true
    end,
    [ELEMENT.normal] = function()
        -- Tracker:FindObjectForCode("ele_normal").Active = true
    end,
    ["wop"] = function()
        Tracker:FindObjectForCode("wop").Active = true
        Tracker:FindObjectForCode("ele_light").Active = true
        Tracker:FindObjectForCode("ele_fire").Active = true
        Tracker:FindObjectForCode("ele_dark").Active = true
        Tracker:FindObjectForCode("ele_poison").Active = true
    end,
}

function CheckForItem(item_id)
    if IMPORTANT_ITEMS[item_id] then
        local item = IMPORTANT_ITEMS[item_id]
        if item.name == "wandofpower" then
            ElementAction["wop"]()
            Tracker:FindObjectForCode("ranged_attacks").Active = true
        elseif item.name == "icarianflight" or item.name == "coffin" then
            Tracker:FindObjectForCode("dsf_checks").Active = true
        -- elseif item.name == "rockbridge" then
        --     Tracker:FindObjectForCode("dsf_checks").Active = true
        -- elseif item.name == "summonsnail" or item.name == "summonkodama" then
        --     Tracker:FindObjectForCode("dsf_checks").Active = true
        elseif item.name == "bloodstrike" or item.name == "blooddrain" then
            ElementAction[ELEMENT.blood]()
        else
            local elements = getElements(item.element)
            elements:for_each(function(element) ElementAction[element]() end)
            if item.ranged == true and elements:contains(ELEMENT.dark) then
                Tracker:FindObjectForCode("ranged_attacks").Active = true
            end
        end
    end
end