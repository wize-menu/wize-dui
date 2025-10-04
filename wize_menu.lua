-- Wize Menu
local DuiUrl = "https://raw.githack.com/wize-menu/wize-dui/main/wize.html"
local Dui = MachoCreateDui(DuiUrl)
local MenuOpen = false
local MenuPosition = {x = 960, y = 540}
local isTyping = false
local capsLockOn = false
local LockedResources = {}
local isRobberyActive = false
local isVehicleBoostEnabled = false
local isVehicleUnlockerActive = false
local espEnabled = false
local idsEnabled = false
local namesEnabled = false
local showSelfSkeleton = false
local crosshairEnabled = false
local fovCircleEnabled = false

-- Utility functions
local function getClosestPlayerInView(maxDist)
    local camCoords = GetGameplayCamCoord()
    local camRot = GetGameplayCamRot(2)
    local function RotationToDirection(rot)
        local z = math.rad(rot.z)
        local x = math.rad(rot.x)
        local num = math.abs(math.cos(x))
        return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
    end
    local direction = RotationToDirection(camRot)
    local closestPed = nil
    local minDist = maxDist or 15.0
    for _, pid in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(pid)
        if ped ~= PlayerPedId() then
            local pos = GetEntityCoords(ped)
            local toPed = pos - camCoords
            local proj = toPed.x * direction.x + toPed.y * direction.y + toPed.z * direction.z
            if proj > 0 then
                local point = camCoords + direction * proj
                local dist = #(pos - point)
                if dist < 2.0 then
                    local camToPed = #(pos - camCoords)
                    if camToPed < minDist then
                        minDist = camToPed
                        closestPed = ped
                    end
                end
            end
        end
    end
    return closestPed
end

local function toggleVehicleBoost()
    isVehicleBoostEnabled = not isVehicleBoostEnabled
    if isVehicleBoostEnabled then
        MachoMenuNotification("Wize Menu", "Vehicle boost is ON. Enjoy!", 3)
    else
        MachoMenuNotification("Wize Menu", "Vehicle boost is OFF.", 3)
    end
end

local function toggleVehicleUnlocker()
    isVehicleUnlockerActive = not isVehicleUnlockerActive
    if isVehicleUnlockerActive then
        MachoMenuNotification("Wize Menu", "Vehicle Unlocker Enabled. Press E on a vehicle.", 3)
    else
        MachoMenuNotification("Wize Menu", "Vehicle Unlocker Disabled.", 3)
    end
end

local function inject(code)
    MachoInjectResource("any", code)
end

local function SendToDui(action, data)
    if Dui and MenuOpen then
        MachoSendDuiMessage(Dui, json.encode({ action = action, data = data }))
    else
        print("DUI not initialized or menu not open")
    end
end

local giveItemState = {turn = 1, akIndex = 1}
local specialCharMap = {
    [0xC0] = {normal = "`", shifted = "~"},
    [0x31] = {normal = "1", shifted = "!"},
    [0x32] = {normal = "2", shifted = "@"},
    [0x33] = {normal = "3", shifted = "#"},
    [0x34] = {normal = "4", shifted = "$"},
    [0x35] = {normal = "5", shifted = "%"},
    [0x36] = {normal = "6", shifted = "^"},
    [0x37] = {normal = "7", shifted = "&"},
    [0x38] = {normal = "8", shifted = "*"},
    [0x39] = {normal = "9", shifted = "("},
    [0x30] = {normal = "0", shifted = ")"},
    [0xBD] = {normal = "-", shifted = "_"},
    [0xBB] = {normal = "=", shifted = "+"},
    [0xDB] = {normal = "[", shifted = "{"},
    [0xDD] = {normal = "]", shifted = "}"},
    [0xDC] = {normal = "\\", shifted = "|"},
    [0xBA] = {normal = ";", shifted = ":"},
    [0xDE] = {normal = "'", shifted = '"'},
    [0xBC] = {normal = ",", shifted = "<"},
    [0xBE] = {normal = ".", shifted = ">"},
    [0xBF] = {normal = "/", shifted = "?"}
}

local function safeResourceName(name)
    if not name then
        return "unknown"
    end
    return string.gsub(tostring(name), "[%c\128-\255]", "?")
end

local function handleRobberyAttempt()
    local selfCoords = GetEntityCoords(PlayerPedId())
    for _, player in ipairs(GetActivePlayers()) do
        if player ~= PlayerId() then
            local ped = GetPlayerPed(player)
            if DoesEntityExist(ped) then
                if #(GetEntityCoords(ped) - selfCoords) <= 2.5 then
                    ExecuteCommand("steal")
                    ExecuteCommand("rob")
                    MachoMenuNotification("Wize Menu", "Robbing player.", 3)
                    return
                end
            end
        end
    end
    MachoMenuNotification("Wize Menu", "Nobody is near to rob.", 3)
end

-- Trigger Finder UI
local function RebuildTriggerFinderUI(state)
    local triggerFinderTab
    local tabIdx
    for i, tab in ipairs(state.tabs) do
        if tab.key == "trigger_finder" then
            triggerFinderTab = tab
            tabIdx = i
            break
        end
    end
    if not triggerFinderTab then
        return
    end

    triggerFinderTab.items = {}

    if not triggerFinderTab.selectedTrigger then
        table.insert(
            triggerFinderTab.items,
            {
                type = "button",
                label = #triggerFinderTab.foundTriggers > 0 and "Scan For Triggers Again" or "Scan For Triggers",
                action = function(s)
                    MachoMenuNotification("Wize Menu", "Scanning for triggers...", 3)
                    Citizen.Wait(250)
                    triggerFinderTab.foundTriggers = {}
                    local knownTriggers = {
                        {
                            id = "ak_item",
                            name = "Any Item Trigger (SAFE)",
                            type = "item",
                            res = {
                                "ak47_whitewidowv2",
                                "ak47_cannabiscafev2",
                                "ak47_khusland",
                                "ak47_khusbites",
                                "ak47_leafnlatte",
                                "ak47_qb_cannabiscafev2",
                                "ak47_qb_leafnlatte",
                                "ak47_qb_khusland",
                                "ak47_qb_khusbites",
                                "ak47_qb_whitewidowv2"
                            },
                            all = false
                        },
                        {
                            id = "nails_money",
                            name = "Money Trigger (SAFE)",
                            type = "money",
                            res = {"codewave-nails-phone"},
                            all = true
                        },
                        {
                            id = "handbag_money",
                            name = "Money Trigger (SAFE)",
                            type = "money",
                            res = {"codewave-handbag-phone"},
                            all = true
                        },
                        {
                            id = "sneaker_money",
                            name = "Money Trigger (SAFE)",
                            type = "money",
                            res = {"codewave-sneaker-phone"},
                            all = true
                        },
                        {
                            id = "caps_money",
                            name = "Money Trigger (SAFE)",
                            type = "money",
                            res = {"codewave-caps-client-phone"},
                            all = true
                        },
                        {
                            id = "generic_money",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"ak47_qb_drugmanagerv2", "ak47_drugmanagerv2"},
                            all = false
                        },
                        {
                            id = "hotdog_money",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"qb-hotdogjob"},
                            all = true
                        },
                        {
                            id = "ak47_inventory",
                            name = "Any Item Trigger (SAFE)",
                            type = "item",
                            res = {"ak47_inventory", "ak47_qb_inventory"},
                            all = false
                        },
                        {
                            id = "shop_purchase",
                            name = "Palm Beach ANY ITEM (SAFE)",
                            type = "item_only",
                            res = {"PalmBeachMiamiMinimap"},
                            all = true
                        },
                        {
                            id = "cl_pizzeria",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"CL-Pizzeria"},
                            all = false
                        },
                        {
                            id = "solstice_moonshine",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"SolsticeMoonshineV2"},
                            all = false
                        },
                        {
                            id = "tk_smokev2",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"Tk_smokev2"},
                            all = false
                        },
                        {
                            id = "ox_cb_ws_sellshop",
                            name = "Any Item Trigger (High Risk)",
                            type = "item",
                            res = {"__ox_cb_ws_sellshop"},
                            all = false
                        },
                        {
                            id = "adminplus_selldrugs",
                            name = "Any Event Trigger (High Risk)",
                            type = "event",
                            res = {"adminplus-selldrugs"},
                            all = false
                        },
                        {
                            id = "ak47_drugmanager",
                            name = "Any Item Trigger (SAFE)",
                            type = "item",
                            res = {"ak47_drugmanager"},
                            all = false
                        },
                        {
                            id = "ak47_drugmanagerv2",
                            name = "Any Item Trigger (SAFE)",
                            type = "item",
                            res = {"ak47_drugmanagerv2"},
                            all = false
                        },
                        {
                            id = "ak47_prospecting_reward",
                            name = "Give Scrap Items (SAFE)",
                            type = "money",
                            res = {"ak47_prospecting"},
                            all = false
                        },
                        {
                            id = "ak47_prospecting_sell",
                            name = "Money Trigger (SAFE)",
                            type = "money",
                            res = {"ak47_prospecting"},
                            all = false
                        },
                        {
                            id = "ak4y_fishing",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"ak4y-advancedFishing"},
                            all = false
                        },
                        {
                            id = "ak4y_case_opening",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"ak4y-caseOpening"},
                            all = false
                        },
                        {
                            id = "ak4y_playtime_shop",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"ak4y-playTimeShop"},
                            all = false
                        },
                        {
                            id = "angelicxs_civilian_payment",
                            name = "Money Trigger (SAFE)",
                            type = "money",
                            res = {"angelicxs-civilianjobs"},
                            all = false
                        },
                        {
                            id = "angelicxs_civilian_item",
                            name = "Any Item Trigger (SAFE)",
                            type = "item",
                            res = {"angelicxs-civilianjobs"},
                            all = false
                        },
                        {
                            id = "apex_cluckinbell",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"apex_cluckinbell"},
                            all = false
                        },
                        {
                            id = "apex_rexdiner",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"apex_rexdiner"},
                            all = false
                        },
                        {
                            id = "ars_hunting",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"ars_hunting"},
                            all = false
                        },
                        {
                            id = "ars_vvsgrillz",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"ars_vvsgrillz_v2"},
                            all = false
                        },
                        {
                            id = "ars_vvsguns",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"ars_vvsguns"},
                            all = false
                        },
                        {
                            id = "ars_vvsjewelry",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"ars_vvsjewelry"},
                            all = false
                        },
                        {
                            id = "ars_whitewidow",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"ars_whitewidow_v2"},
                            all = false
                        },
                        {
                            id = "av_business",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"av_business"},
                            all = false
                        },
                        {
                            id = "boii_drugs",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"boii-drugs"},
                            all = false
                        },
                        {
                            id = "boii_moneylaunderer",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"boii-moneylaunderer"},
                            all = false
                        },
                        {
                            id = "boii_pawnshop",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"boii-pawnshop"},
                            all = false
                        },
                        {
                            id = "boii_salvage_diving",
                            name = "Any Event Trigger (Medium Risk)",
                            type = "event",
                            res = {"boii-salavagediving"},
                            all = false
                        },
                        {
                            id = "boii_whitewidow",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"boii_whitewidow"},
                            all = false
                        },
                        {
                            id = "brutal_hunting",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"brutal_hunting"},
                            all = false
                        },
                        {
                            id = "brutal_shop_robbery",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"brutal_shop_robbery"},
                            all = false
                        },
                        {
                            id = "cfx_tcd_starter",
                            name = "Any Event Trigger (Medium Risk)",
                            type = "event",
                            res = {"cfx-tcd-starterpack"},
                            all = false
                        },
                        {
                            id = "core_crafting",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"core_crafting"},
                            all = false
                        },
                        {
                            id = "d3mba_heroin",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"d3MBA-heroin"},
                            all = false
                        },
                        {
                            id = "dcweedroll",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"dcweedroll"},
                            all = false
                        },
                        {
                            id = "dcweedrollnew",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"dcweedrollnew"},
                            all = false
                        },
                        {
                            id = "devcore_needs",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"devcore_needs"},
                            all = false
                        },
                        {
                            id = "devcore_smokev2",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"devcore_smokev2"},
                            all = false
                        },
                        {
                            id = "dusa_pets",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"dusa-pets"},
                            all = false
                        },
                        {
                            id = "dusa_pet_shop",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"dusa_pet"},
                            all = false
                        },
                        {
                            id = "dv_donut_delivery",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"dv-donutdeliveryjob"},
                            all = false
                        },
                        {
                            id = "esx_weashop",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"esx_weashop"},
                            all = false
                        },
                        {id = "ez_lib", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"ez_lib"}, all = false},
                        {
                            id = "fivecode_camping",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"fivecode_camping"},
                            all = false
                        },
                        {
                            id = "food_mechanics",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"food_mechanics"},
                            all = false
                        },
                        {
                            id = "forge_starter",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"forge-starter"},
                            all = false
                        },
                        {
                            id = "fs_placeables",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"fs_placeables"},
                            all = false
                        },
                        {
                            id = "fuksus_shops",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"fuksus-shops"},
                            all = false
                        },
                        {
                            id = "gardener_job",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"gardenerjob"},
                            all = false
                        },
                        {
                            id = "guatau_consumibles",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"guataubaconsumibles"},
                            all = false
                        },
                        {
                            id = "hg_wheel",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"hg-wheel"},
                            all = false
                        },
                        {
                            id = "horizon_payment",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"horizon_paymentsystem"},
                            all = false
                        },
                        {
                            id = "complete_hunting",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"hunting"},
                            all = false
                        },
                        {
                            id = "inside_fruitpicker",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"inside-fruitpicker"},
                            all = false
                        },
                        {
                            id = "inverse_consumables",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"inverse-consumables"},
                            all = false
                        },
                        {id = "it_lib", name = "Any Item Trigger (SAFE)", type = "item", res = {"it-lib"}, all = false},
                        {
                            id = "jg_mechanic",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"jg-mechanic"},
                            all = false
                        },
                        {
                            id = "jim_bakery",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"jim-bakery"},
                            all = false
                        },
                        {
                            id = "jim_beanmachine",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"jim-beanmachine"},
                            all = false
                        },
                        {
                            id = "jim_burgershot",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"jim-burgershot"},
                            all = false
                        },
                        {
                            id = "jim_catcafe",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"jim-catcafe"},
                            all = false
                        },
                        {
                            id = "jim_consumables",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"jim-consumables"},
                            all = false
                        },
                        {
                            id = "jim_mechanic",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"jim-mechanic"},
                            all = false
                        },
                        {
                            id = "jim_mining",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"jim-mining"},
                            all = false
                        },
                        {
                            id = "jim_pizzathis",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"jim-pizzathis"},
                            all = false
                        },
                        {
                            id = "jim_recycle",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"jim-recycle"},
                            all = false
                        },
                        {
                            id = "jim_shops_blackmarket",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"jim-shops"},
                            all = false
                        },
                        {
                            id = "jim_shops_open",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"jim-shops"},
                            all = false
                        },
                        {
                            id = "kaves_drugsv2",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"kaves_drugsv2"},
                            all = false
                        },
                        {
                            id = "mt_restaurants",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"mt-restaurants"},
                            all = false
                        },
                        {
                            id = "mt_printers",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"mt_printers"},
                            all = false
                        },
                        {
                            id = "nx_cayo",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"nx-cayo"},
                            all = false
                        },
                        {
                            id = "okok_crafting",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"okokCrafting"},
                            all = false
                        },
                        {
                            id = "pug_business_creator",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"pug-businesscreator"},
                            all = false
                        },
                        {
                            id = "pug_chopping",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"pug-chopping"},
                            all = false
                        },
                        {
                            id = "pug_fishing",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"pug-fishing"},
                            all = false
                        },
                        {
                            id = "pug_robbery_creator",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"pug-robberycreator"},
                            all = false
                        },
                        {
                            id = "qb_crafting",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"qb-crafting"},
                            all = false
                        },
                        {
                            id = "qb_drugs",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"qb-drugs"},
                            all = false
                        },
                        {
                            id = "qb_garbage_job",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"qb-garbagejob"},
                            all = false
                        },
                        {
                            id = "qb_hotdog_job",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"qb-hotdogjob"},
                            all = false
                        },
                        {
                            id = "qb_recycle_job",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"qb-recyclejob"},
                            all = false
                        },
                        {
                            id = "qb_trash_search",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"qb-trashsearch"},
                            all = false
                        },
                        {
                            id = "qb_warehouse",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"qb-warehouse"},
                            all = false
                        },
                        {
                            id = "rm_camperv",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"rm_camperv"},
                            all = false
                        },
                        {
                            id = "ry_rent",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"ry_rent"},
                            all = false
                        },
                        {
                            id = "savana_trucker",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"savana-truckerjob"},
                            all = false
                        },
                        {
                            id = "sayer_jukebox",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"sayer-jukebox"},
                            all = false
                        },
                        {
                            id = "sell_usb",
                            name = "Any Event Trigger (Medium Risk)",
                            type = "event",
                            res = {"sell_usb"},
                            all = false
                        },
                        {
                            id = "snipe_boombox",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"snipe-boombox"},
                            all = false
                        },
                        {
                            id = "solos_cashier",
                            name = "Money Trigger (Medium Risk)",
                            type = "money",
                            res = {"solos-cashier"},
                            all = false
                        },
                        {
                            id = "solos_food",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"solos-food"},
                            all = false
                        },
                        {
                            id = "solos_hookah",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"solos-hookah"},
                            all = false
                        },
                        {
                            id = "solos_jointroll",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"solos-jointroll"},
                            all = false
                        },
                        {
                            id = "solos_joints",
                            name = "Any Item Trigger (High Risk)",
                            type = "item",
                            res = {"solos-joints"},
                            all = false
                        },
                        {
                            id = "solos_methlab",
                            name = "Any Item Trigger (High Risk)",
                            type = "item",
                            res = {"solos-methlab"},
                            all = false
                        },
                        {
                            id = "solos_moneywash",
                            name = "Any Item Trigger (High Risk)",
                            type = "item",
                            res = {"solos-moneywash"},
                            all = false
                        },
                        {
                            id = "solos_restaurants",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"solos-restaurants"},
                            all = false
                        },
                        {
                            id = "t1ger_gangsystem",
                            name = "Any Item Trigger (High Risk)",
                            type = "item",
                            res = {"t1ger_gangsystem"},
                            all = false
                        },
                        {
                            id = "t1ger_lib",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"t1ger_lib"},
                            all = false
                        },
                        {
                            id = "xmmx_letscookplus",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"xmmx_letscookplus"},
                            all = false
                        },
                        {
                            id = "zat_farming",
                            name = "Any Item Trigger (Medium Risk)",
                            type = "item",
                            res = {"zat-farming"},
                            all = false
                        },
                        {
                            id = "zat_weed",
                            name = "Any Item Trigger (High Risk)",
                            type = "item",
                            res = {"zat-weed"},
                            all = false
                        }
                    }
                    for _, trigger in ipairs(knownTriggers) do
                        local isAvailable = false
                        if trigger.all then
                            local allFound = true
                            for _, resName in ipairs(trigger.res) do
                                if not MachoResourceInjectable(resName) then
                                    allFound = false
                                    break
                                end
                            end
                            if allFound then
                                isAvailable = true
                            end
                        else
                            if #trigger.res == 0 then
                                isAvailable = true
                            else
                                for _, resName in ipairs(trigger.res) do
                                    if MachoResourceInjectable(resName) then
                                        isAvailable = true
                                        break
                                    end
                                end
                            end
                        end
                        if isAvailable then
                            table.insert(triggerFinderTab.foundTriggers, trigger)
                        end
                    end
                    MachoMenuNotification(
                        "Wize Menu",
                        "Found " .. #triggerFinderTab.foundTriggers .. " triggers.",
                        5
                    )
                    RebuildTriggerFinderUI(s)
                    SendToDui('updateMenuState', s)
                end
            }
        )
        for _, trigger in ipairs(triggerFinderTab.foundTriggers) do
            table.insert(
                triggerFinderTab.items,
                {
                    type = "button",
                    label = trigger.name,
                    action = function(s)
                        triggerFinderTab.selectedTrigger = trigger
                        RebuildTriggerFinderUI(s)
                        SendToDui('updateMenuState', s)
                    end
                }
            )
        end
    else
        local trigger = triggerFinderTab.selectedTrigger
        table.insert(triggerFinderTab.items, {type = "label", label = "Selected: " .. trigger.name})
        if trigger.type == "item" then
            table.insert(
                triggerFinderTab.items,
                {type = "input", label = "Item Name", value = "", placeholder = "e.g., weapon_pistol"}
            )
        elseif trigger.type == "item_only" then
            table.insert(
                triggerFinderTab.items,
                {type = "input", label = "Item Name", value = "", placeholder = "e.g., weapon_pistol"}
            )
        end
        if trigger.type ~= "item_only" then
            table.insert(
                triggerFinderTab.items,
                {type = "input", label = "Amount", value = "", placeholder = "e.g., 100000"}
            )
        end
        table.insert(
            triggerFinderTab.items,
            {
                type = "button",
                label = "Execute",
                action = function(s)
                    local itemInput, amountInput
                    if trigger.type == "item" then
                        itemInput = s.tabs[tabIdx].items[2].value
                        amountInput = tonumber(s.tabs[tabIdx].items[3].value)
                    elseif trigger.type == "item_only" then
                        itemInput = s.tabs[tabIdx].items[2].value
                        amountInput = nil
                    else
                        itemInput = "money"
                        amountInput = tonumber(s.tabs[tabIdx].items[2].value)
                    end

                    if
                        (trigger.type == "item" and
                            (not amountInput or amountInput <= 0 or not itemInput or itemInput == "")) or
                            (trigger.type == "item_only" and (not itemInput or itemInput == "")) or
                            (trigger.type ~= "item" and trigger.type ~= "item_only" and
                                (not amountInput or amountInput <= 0))
                     then
                        MachoMenuNotification("Wize Menu", "Invalid input or amount.", 5)
                        return
                    end

                    local handled = false
                    if trigger.id == "ak_item" then
                        for i = giveItemState.akIndex, #trigger.res + giveItemState.akIndex - 1 do
                            local idx = (i - 1) % #trigger.res + 1
                            local resName = trigger.res[idx]
                            if MachoResourceInjectable(resName) then
                                giveItemState.akIndex = (idx % #trigger.res) + 1
                                local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
                                local code =
                                    ([[Citizen.CreateThread(function() pcall(function() TriggerServerEvent(%q,%q,{['phone']=0},%d,0) end); DoScreenFadeOut(1);Citizen.Wait(1000);SetEntityCoordsNoOffset(PlayerPedId(),%f,%f,%f,false,false,false);Citizen.Wait(1000);DoScreenFadeIn(1000) end)]]):format(
                                    resName .. ":process",
                                    itemInput,
                                    amountInput,
                                    x,
                                    y,
                                    z
                                )
                                inject(code)
                                handled = true
                                break
                            end
                        end
                    elseif trigger.id == "nails_money" then
                        inject(
                            ('pcall(function() TriggerServerEvent("delivery:giveRewardnails",%d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "handbag_money" then
                        inject(
                            ('pcall(function() TriggerServerEvent("delivery:giveRewardhandbags",%d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "sneaker_money" then
                        inject(
                            ('pcall(function() TriggerServerEvent("delivery:giveRewardShoes",%d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "caps_money" then
                        inject(
                            ('pcall(function() TriggerServerEvent("delivery:giveRewardCaps",%d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "generic_money" then
                        inject(
                            ("pcall(function() TriggerServerEvent('ak47_qb_drugmanagerv2:shop:buy', '53.15-1478.79', {['buyprice']=0, ['currency']='cash', ['name']='%s', ['sellprice']=0, ['label']='Wize Menu'}, %d) end)"):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "hotdog_money" then
                        inject(
                            ("pcall(function() local ped=GetPlayerPed(-1) local pedCoords=GetEntityCoords(ped) local HotdogsForSale=1 local SellingPrice=%d TriggerServerEvent('qb-hotdogjob:server:Sell', pedCoords, HotdogsForSale, SellingPrice) end)"):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ak47_inventory" then
                        inject(
                            ([[TriggerServerEvent('ak47_inventory:buyItemDrag',{fromInv={identifier=nil,slot=1,slotData={amount=%d,close=true,count=999999999999999,description="Wize Menu Item",info={account="cash",buyPrice=0},label="Wize Menu Item",name="%s",quality=100,slot=1,type="item",weight=0}},toInv={identifier=nil,slot=1,slotData={slot=1}}} )]]):format(
                                amountInput,
                                itemInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "shop_purchase" then
                        local randomId = "wize" .. math.random(1000, 99999)
                        inject(
                            ('pcall(function() TriggerServerEvent("shop:purchaseItem2", "%s", "%s", 0) end)'):format(
                                randomId,
                                itemInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "cl_pizzeria" then
                        inject(
                            ('pcall(function() TriggerServerEvent("CL-Pizzeria:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "solstice_moonshine" then
                        inject(
                            ('pcall(function() TriggerServerEvent("SolsticeMoonshineV2:server:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "tk_smokev2" then
                        inject(
                            ('pcall(function() TriggerServerEvent("Tk_smokev2:server:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ox_cb_ws_sellshop" then
                        inject(
                            ('pcall(function() TriggerServerEvent("__ox_cb_ws_sellshop:sellItem", "sellshop", "ws_sellshop:sellItem:17692", { currency = "money", item = "%s", price = 9999999999, quantity = %d }) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "adminplus_selldrugs" then
                        inject(
                            ('pcall(function() TriggerEvent("stasiek_selldrugsv2:findClient",{ ["i"] = 8, ["label"] = "WizeMenu", ["type"] = "WizeMenu", ["zone"] = "The Meat Quarter", ["price"] = %d, ["count"] = 0 }) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ak47_drugmanager" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ak47_drugmanager:pickedupitem","%s","%s",%d) end)'):format(
                                itemInput,
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ak47_drugmanagerv2" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ak47_drugmanagerv2:shop:buy", "-1146.444941.22", { buyprice = 0, currency = "money", label = "wize", name = "%s", sellprice = 69696969 }, %d ) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ak47_prospecting_reward" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ak47_prospecting:reward", %d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ak47_prospecting_sell" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ak47_prospecting:sell","cash",%d,9999999999) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ak4y_fishing" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ak4y-advancedFishing:addItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ak4y_case_opening" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ak4y-caseOpening:addGoldCoin", %d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ak4y_playtime_shop" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ak4y-playTimeShop:addCoin", %d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "angelicxs_civilian_payment" then
                        inject(
                            ('pcall(function() TriggerServerEvent("angelicxs-CivilianJobs:Server:Payment", %d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "angelicxs_civilian_item" then
                        inject(
                            ('pcall(function() TriggerServerEvent("angelicxs-CivilianJobs:Server:GainItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "apex_cluckinbell" then
                        inject(
                            ('pcall(function() TriggerServerEvent("apex_cluckinbell:client:addItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "apex_rexdiner" then
                        inject(
                            ('pcall(function() TriggerServerEvent("apex_rexdiner:client:addItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ars_hunting" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ars_hunting:sellBuyItem", { item = "%s", price = 1, quantity = %d, buy = true }) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ars_vvsgrillz" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ars_vvsgrillz_v2:Buyitem", "grillz", { items = {{ id = "%s", quantity = %d, price = 0, stock = 999999, totalPrice = 0 }}, method = "bank", total = 0 }, "bank") end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ars_vvsguns" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ars_vvsguns:Buyitem", "vvsguns", { items = { { id = "%s", image = "wize", name = "wize", page = 2, price = 0, quantity = %d, stock = 9999999999, totalPrice = 0 } }, method = "cash", total = 0 }, "cash" ) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ars_vvsjewelry" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ars_vvsjewelry:Buyitem", "vvsjewelry", { items = { { id = "%s", image = "WizeMenu", name = "WizeMenu", page = 2, price = 0, quantity = %d, stock = 999999999999999, totalPrice = 0 } }, method = "cash", total = 0 }, "cash" ) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ars_whitewidow" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ars_whitewidow_v2:Buyitem", { items = { { id = "%s", image = "WizeFinder", name = "WizeFinder", page = 1, price = 500, quantity = %d, stock = 999999999999999, totalPrice = 0 } }, method = "cash", total = 0 }, "cash") end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "av_business" then
                        inject(
                            ('pcall(function() TriggerServerEvent("av_business:addItem", "%s", %d, 9999) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "boii_drugs" then
                        inject(
                            ('pcall(function() TriggerServerEvent("boii-drugs:sv:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "boii_moneylaunderer" then
                        inject(
                            ('pcall(function() TriggerServerEvent("boii-moneylaunderer:sv:PayPlayer", %d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "boii_pawnshop" then
                        inject(
                            ('pcall(function() TriggerServerEvent("boii-pawnshop:sv:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "boii_salvage_diving" then
                        inject(('pcall(function() TriggerServerEvent("boii-salavagediving:server:JewelleryBag") end)'))
                        handled = true
                    elseif trigger.id == "boii_whitewidow" then
                        inject(
                            ('pcall(function() TriggerServerEvent("boii-whitewidow:server:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "brutal_hunting" then
                        inject(
                            ('pcall(function() TriggerServerEvent("brutal_hunting:server:AddItem", { { amount = %d, item = "%s", label = "WizeMenu", price = 0 } }) end)'):format(
                                amountInput,
                                itemInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "brutal_shop_robbery" then
                        inject(
                            ('pcall(function() TriggerServerEvent("brutal_shop_robbery:server:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "cfx_tcd_starter" then
                        inject(('pcall(function() TriggerServerEvent("cfx-tcd-starterpack:ClaimStarterpack") end)'))
                        handled = true
                    elseif trigger.id == "core_crafting" then
                        inject(
                            ('pcall(function() TriggerServerEvent("core_crafting:itemCrafted", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "d3mba_heroin" then
                        inject(
                            ('pcall(function() TriggerServerEvent("d3MBA-heroin:server:ShopBuyItem", { Amount = %d, ItemName = "%s", Price = 0 }) end)'):format(
                                amountInput,
                                itemInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "dcweedroll" then
                        inject(
                            ('pcall(function() TriggerServerEvent("weedroll:additem","%s",%d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "dcweedrollnew" then
                        inject(
                            ('pcall(function() TriggerServerEvent("weedroll:additem","%s",%d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "devcore_needs" then
                        inject(
                            ('pcall(function() TriggerServerEvent("devcore_needs:server:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "devcore_smokev2" then
                        inject(
                            ('pcall(function() TriggerServerEvent("devcore_smokev2:server:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "dusa_pets" then
                        inject(
                            ('pcall(function() TriggerServerEvent("dusa-pets:addItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "dusa_pet_shop" then
                        inject(
                            ('pcall(function() TriggerServerEvent("__ox_cb_dusa_pets:cb:canBuyItem", "dusa_pet", "dusa_pets:cb:canBuyItem", { ["data"] = { [1] = { ["name"] = "WizeMenu", ["img"] = "bed2.png", ["detail"] = "Wize pet item", ["item"] = "%s", ["count"] = %d, ["totalPrice"] = 0, ["price"] = 0, }, }, ["account"] = "cash", }) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "dv_donut_delivery" then
                        inject(
                            ('pcall(function() TriggerServerEvent("dv-donutdeliveryjob:Payment", %d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "esx_weashop" then
                        inject(
                            ('pcall(function() TriggerServerEvent("esx_weashop:buyItem", "%s", %d, "BlackWeashop") end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ez_lib" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ez_lib:server:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "fivecode_camping" then
                        inject(
                            ('pcall(function() TriggerServerEvent("fivecode_camping:callCallback", "fivecode_camping:shopPay", 0, { ["price"] = 0, ["item"] = "%s", ["amount"] = %d, ["label"] = "WizeMenu"} , { ["args"] = { ["payment"] = { ["bank"] = true, ["cash"] = true } }, ["entity"] = 9218, ["distance"] = 0.64, ["hide"] = false, ["type"] = "bank", ["label"] = "Open Shop", ["coords"] = "vector3(-773.2181, 5597.66, 33.97217)", ["name"] = "npcShop" }) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "food_mechanics" then
                        inject(
                            ('pcall(function() TriggerServerEvent("food_mechanics:server:toggleItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "forge_starter" then
                        inject(
                            ('pcall(function() TriggerServerEvent("forge-starter:claimReward", "%s") end)'):format(
                                itemInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "fs_placeables" then
                        inject(
                            ('pcall(function() TriggerServerEvent("fs_placeables:placeonground","%s",%d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "fuksus_shops" then
                        inject(
                            ('pcall(function() TriggerServerEvent("__ox_cb_fuksus-shops:buyItems", "fuksus-shops", "fuksus-shops:buyItems", { ["payment"] = "bank", ["items"] = { [1] = { ["amount"] = %d, ["label"] = "WizeMenu", ["price"] = 0, ["name"] = "%s", }, }, }) end)'):format(
                                amountInput,
                                itemInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "gardener_job" then
                        inject(
                            ('pcall(function() TriggerServerEvent("gardenerjob:payment",%d) end)'):format(amountInput)
                        )
                        handled = true
                    elseif trigger.id == "guatau_consumibles" then
                        inject(
                            ('pcall(function() TriggerServerEvent("virus_consumibles:server:toggleItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "hg_wheel" then
                        inject(
                            ('pcall(function() TriggerServerEvent("hg-wheel:server:giveitem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "horizon_payment" then
                        inject(
                            ('pcall(function() TriggerServerEvent("horizon_paymentsystem:giveItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "complete_hunting" then
                        inject(
                            ('pcall(function() TriggerServerEvent("complete_hunting:server:giveReward", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "inside_fruitpicker" then
                        inject(
                            ('pcall(function() TriggerServerEvent("inside-fruitpicker:Payout", %d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "inverse_consumables" then
                        inject(
                            ('pcall(function() TriggerServerEvent("inverse-consumables:server:toggleItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "it_lib" then
                        inject(
                            ('pcall(function() TriggerServerEvent("it-lib:toggleItem", true, "%s", %d, nil) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "jg_mechanic" then
                        inject(
                            ('pcall(function() TriggerEvent("jg-mechanic:client:input-shop-purchase-qty", { item = "%s", price = 0, mechanicId = "MECHANIC ID HERE", shopIndex = 1 }) end)'):format(
                                itemInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "jim_bakery" then
                        inject(
                            ('pcall(function() TriggerServerEvent("jim-bakery:server:toggleItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "jim_beanmachine" then
                        inject(
                            ('pcall(function() TriggerServerEvent("jim-beanmachine:server:toggleItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "jim_burgershot" then
                        inject(
                            ('pcall(function() TriggerServerEvent("jim-burgershot:server:toggleItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "jim_catcafe" then
                        inject(
                            ('pcall(function() TriggerServerEvent("jim-catcafe:server:toggleItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "jim_consumables" then
                        inject(
                            ('pcall(function() TriggerServerEvent("jim-consumables:server:toggleItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "jim_mechanic" then
                        inject(
                            ('pcall(function() TriggerServerEvent("jim-mechanic:server:toggleItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "jim_mining" then
                        inject(
                            ('pcall(function() TriggerServerEvent("jim-mining:server:toggleItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "jim_pizzathis" then
                        inject(
                            ('pcall(function() TriggerServerEvent("jim-pizzathis:server:toggleItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "jim_recycle" then
                        inject(
                            ('pcall(function() TriggerServerEvent("jim-recycle:server:toggleItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "jim_shops_blackmarket" then
                        inject(
                            ('pcall(function() Config.Goodies = { label = "Blackmarket", slots = 1, items = { [1] = { name = "%s", price = 0, amount = %d, info = {}, type = "item", slot = 1 } } } end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "jim_shops_open" then
                        inject(
                            ('pcall(function() TriggerServerEvent("jim-shops:ShopOpen", "shop", "illegalshit", Config.Goodies) end)')
                        )
                        handled = true
                    elseif trigger.id == "kaves_drugsv2" then
                        inject(
                            ('pcall(function() TriggerServerEvent("kaves_drugsv2:server:giveItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "mt_restaurants" then
                        inject(
                            ('pcall(function() TriggerServerEvent("mt-restaurants:server:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "mt_printers" then
                        inject(
                            ('pcall(function() TriggerServerEvent("__ox_cb_mt_printers:server:itemActions", "mt_printers", "mt_printers:server:itemActions:wize", "%s", "add") end)'):format(
                                itemInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "nx_cayo" then
                        inject(
                            ('pcall(function() TriggerServerEvent("nx-cayo:server:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "okok_crafting" then
                        inject(
                            ('pcall(function() TriggerServerEvent("okokCrafting:claimAll", "paletogeneral", { ["paletogeneral"] = { [1] = { ["item"] = "%s", ["randomID"] = 431916296, ["recipe"] = { [1] = { [1] = "cash", [2] = 1, [3] = "true", [4] = "false" } }, ["suc"] = true, ["xp"] = 6, ["itemName"] = "Pistol", ["time"] = 0, ["amount"] = %d, ["isPending"] = false, ["isDone"] = true, ["isItem"] = true, ["isDis"] = false, ["sucPC"] = 85 } } }) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "pug_business_creator" then
                        inject(
                            ('pcall(function() TriggerServerEvent("Pug:server:NewGivBusinessItemAfterHacks", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "pug_chopping" then
                        inject(
                            ('pcall(function() TriggerServerEvent("Pug:server:GiveChoppingCarPay", %d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "pug_fishing" then
                        inject(
                            ('pcall(function() TriggerServerEvent("Pug:server:GiveFish", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "pug_robbery_creator" then
                        inject(
                            ('pcall(function() TriggerServerEvent("Pug:server:RobberyGiveItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "qb_crafting" then
                        inject(
                            ('pcall(function() TriggerServerEvent("qb-crafting:server:receiveItem", "%s", {}, %d, 0) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "qb_drugs" then
                        inject(
                            ('pcall(function() TriggerServerEvent("qb-drugs:server:giveDrugs", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "qb_garbage_job" then
                        inject(
                            ('pcall(function() TriggerServerEvent("qb-garbagejob:server:PayShift", %d, "") end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "qb_hotdog_job" then
                        inject(
                            ('pcall(function() local ped = GetPlayerPed(-1) local pedCoords = GetEntityCoords(ped) local HotdogsForSale = 1 local SellingPrice = %d TriggerServerEvent("qb-hotdogjob:server:Sell", pedCoords, HotdogsForSale, SellingPrice) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "qb_recycle_job" then
                        inject(
                            ('pcall(function() TriggerServerEvent("recycle:giveReward", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "qb_trash_search" then
                        inject(
                            ('pcall(function() TriggerServerEvent("qb-trashsearch:server:givemoney", math.random(%d, 9999999999999999)) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "qb_warehouse" then
                        inject(
                            ('pcall(function() TriggerServerEvent("inside-warehouse:Payout", %d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "rm_camperv" then
                        inject(
                            ('pcall(function() TriggerServerEvent("camperv:server:giveItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "ry_rent" then
                        inject(
                            ('pcall(function() TriggerServerEvent("ry-vehiclerental:giveMoney", %d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "savana_trucker" then
                        inject(
                            ('pcall(function() TriggerServerEvent("savana-truckerJob:addXpAndMoney", %d, %d) end)'):format(
                                amountInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "sayer_jukebox" then
                        inject(
                            ('pcall(function() TriggerServerEvent("sayer-jukebox:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "sell_usb" then
                        inject(
                            ('pcall(function() TriggerEvent("sell_usb:findClient", { i = 8, label = "WizeMenu", type = "wize", zone = "The Meat Quarter", price = %d, count = 0 }) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "snipe_boombox" then
                        inject(
                            ('pcall(function() TriggerServerEvent("snipe-boombox:server:pickup", %d, vector3(0.0, 0.0, 0.0), "%s") end)'):format(
                                amountInput,
                                itemInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "solos_cashier" then
                        inject(
                            ('pcall(function() TriggerServerEvent("solos-cashier:server:addmoney", "bank", %d) end)'):format(
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "solos_food" then
                        inject(
                            ('pcall(function() TriggerServerEvent("solos-food:server:itemadd", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "solos_hookah" then
                        inject(
                            ('pcall(function() TriggerServerEvent("solos-hookah:server:Buy-Item", "%s", %d, 0) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "solos_jointroll" then
                        inject(
                            ('pcall(function() TriggerServerEvent("solos-jointroll:server:ItemAdd", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "solos_joints" then
                        inject(
                            ('pcall(function() TriggerServerEvent("solos-joints:server:itemadd", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "solos_methlab" then
                        inject(
                            ('pcall(function() TriggerServerEvent("solos-methlab:server:itemadd", "%s", %d, true) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "solos_moneywash" then
                        inject(
                            ('pcall(function() TriggerServerEvent("solos-moneywash:server:ItemAdd", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "solos_restaurants" then
                        inject(
                            ('pcall(function() TriggerServerEvent("solos-restaurants:server:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "t1ger_gangsystem" then
                        inject(
                            ('pcall(function() TriggerServerEvent("t1ger_gangsystem:server:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "t1ger_lib" then
                        inject(
                            ('pcall(function() TriggerServerEvent("t1ger_lib:server:toggleItem", true, "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "xmmx_letscookplus" then
                        inject(
                            ('pcall(function() TriggerServerEvent("xmmx_letscookplus:server:GiveItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "zat_farming" then
                        inject(
                            ('pcall(function() TriggerServerEvent("zat-farming:server:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    elseif trigger.id == "zat_weed" then
                        inject(
                            ('pcall(function() TriggerServerEvent("zat-weed:server:AddItem", "%s", %d) end)'):format(
                                itemInput,
                                amountInput
                            )
                        )
                        handled = true
                    end
                    if handled then
                        MachoMenuNotification("Wize Menu", "Trigger executed successfully.", 5)
                    else
                        MachoMenuNotification("Wize Menu", "Trigger not available.", 5)
                    end
                end
            }
        )
        table.insert(
            triggerFinderTab.items,
            {
                type = "button",
                label = "Back",
                action = function(s)
                    triggerFinderTab.selectedTrigger = nil
                    RebuildTriggerFinderUI(s)
                    SendToDui('updateMenuState', s)
                end
            }
        )
    end
end

-- Logs UI
local function RebuildLogsUI(state)
    local logsTab
    for i, tab in ipairs(state.tabs) do
        if tab.key == "logs" then
            logsTab = tab
            break
        end
    end
    if not logsTab then
        return
    end

    logsTab.items = {}
    for _, log in ipairs(logsTab.logList) do
        table.insert(logsTab.items, {type = "label", label = log})
    end
end

-- Menu state
local MenuState = {
    position = MenuPosition,
    activeTab = 0,
    selection = {index = 0},
    tabs = {
        {
            key = "main",
            label = "Main",
            items = {
                {type = "button", label = "Rob Closest Player", action = handleRobberyAttempt},
                {type = "button", label = "Toggle Vehicle Boost", action = toggleVehicleBoost},
                {type = "button", label = "Toggle Vehicle Unlocker", action = toggleVehicleUnlocker},
                {
                    type = "button",
                    label = "Toggle ESP",
                    action = function()
                        espEnabled = not espEnabled
                        MachoMenuNotification("Wize Menu", "ESP " .. (espEnabled and "Enabled" or "Disabled"), 3)
                    end
                },
                {
                    type = "button",
                    label = "Toggle Player IDs",
                    action = function()
                        idsEnabled = not idsEnabled
                        MachoMenuNotification("Wize Menu", "Player IDs " .. (idsEnabled and "Enabled" or "Disabled"), 3)
                    end
                },
                {
                    type = "button",
                    label = "Toggle Player Names",
                    action = function()
                        namesEnabled = not namesEnabled
                        MachoMenuNotification("Wize Menu", "Player Names " .. (namesEnabled and "Enabled" or "Disabled"), 3)
                    end
                },
                {
                    type = "button",
                    label = "Toggle Self Skeleton",
                    action = function()
                        showSelfSkeleton = not showSelfSkeleton
                        MachoMenuNotification("Wize Menu", "Self Skeleton " .. (showSelfSkeleton and "Enabled" or "Disabled"), 3)
                    end
                },
                {
                    type = "button",
                    label = "Toggle Crosshair",
                    action = function()
                        crosshairEnabled = not crosshairEnabled
                        MachoMenuNotification("Wize Menu", "Crosshair " .. (crosshairEnabled and "Enabled" or "Disabled"), 3)
                    end
                },
                {
                    type = "button",
                    label = "Toggle FOV Circle",
                    action = function()
                        fovCircleEnabled = not fovCircleEnabled
                        MachoMenuNotification("Wize Menu", "FOV Circle " .. (fovCircleEnabled and "Enabled" or "Disabled"), 3)
                    end
                }
            }
        },
        {
            key = "trigger

