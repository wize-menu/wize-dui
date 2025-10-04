local DuiUrl = "https://raw.githack.com/wize-menu/wize-dui/main/wize.html"  -- Your hosted DUI HTML
local keyListUrl = "https://raw.githack.com/wize-menu/wize-dui/main/wizekeys.json"
local KeysBin = MachoWebRequest(keyListUrl)
local CurrentKey = MachoAuthenticationKey()

local function isKeyValid()
    if not KeysBin then
        print("DEBUG: KeysBin is nil, web request failed")
        return false
    end

    local ok, keys = pcall(json.decode, KeysBin)
    if not ok or not keys or type(keys) ~= "table" then
        print("DEBUG: JSON decode failed or invalid keys structure")
        return false
    end

    local now = os.time()
    for _, keyData in ipairs(keys) do
        if keyData.key == CurrentKey then
            if keyData.expires then
                local year, month, day, hour, min, sec =
                    string.match(keyData.expires, "([%d]+)-([%d]+)-([%d]+)T([%d]+):([%d]+):([%d]+)Z")
                if year and month and day and hour and min and sec then
                    local expiresTime =
                        os.time(
                        {
                            year = tonumber(year),
                            month = tonumber(month),
                            day = tonumber(day),
                            hour = tonumber(hour),
                            min = tonumber(min),
                            sec = tonumber(sec)
                        }
                    )
                    if expiresTime > now then
                        return true
                    end
                end
            end
        end
    end

    print("DEBUG: No valid key found for " .. (CurrentKey or "nil"))
    return false
end

if not isKeyValid() then
    MachoMenuNotification("JiGgY MeNu", "Your key ain't valid lmfao: " .. (CurrentKey or "nil"), 10)
    return
end

Citizen.CreateThread(
    function()
        local ok, keys = pcall(json.decode, KeysBin)
        if ok and keys and type(keys) == "table" then
            for _, keyData in ipairs(keys) do
                if keyData.key == CurrentKey and keyData.expires then
                    local year, month, day, hour, min, sec =
                        string.match(keyData.expires, "([%d]+)-([%d]+)-([%d]+)T([%d]+):([%d]+):([%d]+)Z")
                    if year and month and day and hour and min and sec then
                        local now = os.time()
                        local expiresTime =
                            os.time(
                            {
                                year = tonumber(year),
                                month = tonumber(month),
                                day = tonumber(day),
                                hour = tonumber(hour),
                                min = tonumber(min),
                                sec = tonumber(sec)
                            }
                        )
                        local remainingSeconds = expiresTime - now
                        local remainingDays = math.floor(remainingSeconds / 86400)
                        local remainingHours = math.floor((remainingSeconds % 86400) / 3600)

                        local expirationMessage
                        if remainingDays > 0 then
                            expirationMessage =
                                string.format(
                                "You have %d days and %d hours left. Enjoy!",
                                remainingDays,
                                remainingHours
                            )
                        else
                            expirationMessage = string.format("You have %d hours left. Enjoy!", remainingHours)
                        end
                        MachoMenuNotification("JiGgY MeNu", expirationMessage, 5)
                    end
                    break
                end
            end
        end
    end
)

local Dui = MachoCreateDui(DuiUrl)
if not Dui then
    print("DEBUG: Failed to create DUI with URL: " .. DuiUrl)
else
    print("DEBUG: DUI created successfully")
end
local MenuOpen = false
local isTyping = false
local capsLockOn = false
local MenuPosition = {x = 960, y = 540}
local LockedResources = {}

local function inject(code)
    if code then
        MachoInjectResource("any", code)
        print("DEBUG: Injected code: " .. code)
    else
        print("DEBUG: Attempted to inject nil code")
    end
end

local function SendToDui(action, data)
    if Dui and MenuOpen then
        local message = json.encode({action = action, data = data})
        local success = MachoSendDuiMessage(Dui, message)
        if not success then
            print("DEBUG: Failed to send DUI message: " .. (message or "nil"))
        else
            print("DEBUG: Sent DUI message: " .. message)
        end
    else
        print("DEBUG: SendToDui skipped - Dui: " .. tostring(Dui) .. ", MenuOpen: " .. tostring(MenuOpen))
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

local function MachoMenuNotification(title, message, duration)
    SendToDui("notification", {title = title, message = message, duration = duration})
end

local function MachoResourceInjectable(resourceName)
    return GetResourceState(safeResourceName(resourceName)) == "started"
end

local state = {
    tabs = {},
    selection = {index = 0},
    open = false
}

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
        print("DEBUG: No triggerFinderTab found in state")
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
                    MachoMenuNotification("JiGgY MeNu", "Finding Triggers Nigga.", 3)
                    Citizen.Wait(250)
                    triggerFinderTab.foundTriggers = {}
                    local knownTriggers = {
                        {
                            id = "ak_item",
                            name = "Any Item Trigger (SAFE)",
                            type = "item",
                            res = {
                                "ak47.whitewidowv2",
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
                        "JiGgY MeNu",
                        "There Is " .. #triggerFinderTab.foundTriggers .. " triggers in this mf.",
                        5
                    )
                    RebuildTriggerFinderUI(s)
                    SendToDui("updateMenu", {tabs = state.tabs, selection = state.selection})
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
                        SendToDui("updateMenu", {tabs = state.tabs, selection = state.selection})
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
                        MachoMenuNotification("JiGgY MeNu", "Invalid input or amount.", 5)
                        return
                    end

                    local handled = false
                    if trigger.id == "ak_item" then
                        for i = 1, #trigger.res do
                            local resName = trigger.res[i]
                            if MachoResourceInjectable(resName) then
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
                    end

                    if handled then
                        MachoMenuNotification("JiGgY MeNu", "Trigger Worked, Enjoy!", 5)
                    else
                        MachoMenuNotification(
                            "JiGgY MeNu",
                            "Saved ur ass. don't try ts again, prolly gonna get banned..",
                            5
                        )
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
                    SendToDui("updateMenu", {tabs = state.tabs, selection = state.selection})
                end
            }
        )
    end
    state.selection.index = 0
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 178) then -- Delete key (178)
            print("DEBUG: Delete key pressed")
            MenuOpen = not MenuOpen
            if MenuOpen then
                print("DEBUG: Opening menu")
                state.tabs = {{key = "trigger_finder", foundTriggers = {}, selectedTrigger = nil, items = {}}}
                SendToDui("openMenu", {tabs = state.tabs, selection = state.selection})
                RebuildTriggerFinderUI(state)
                SendToDui("updateMenu", {tabs = state.tabs, selection = state.selection})
            else
                print("DEBUG: Closing menu")
                SendToDui("closeMenu")
            end
        end
    end
end)

function GetEntityCoords(ped)
    return 0.0, 0.0, 0.0 -- Placeholder, replace with actual implementation
end

function PlayerPedId()
    return 1 -- Placeholder, replace with actual implementation
end

function SetEntityCoordsNoOffset(ped, x, y, z, a, b, c)
    print(string.format("Setting coords to: %f, %f, %f", x, y, z)) -- Placeholder
end

function DoScreenFadeOut(duration)
    print("Fading out screen") -- Placeholder
end

function DoScreenFadeIn(duration)
    print("Fading in screen") -- Placeholder
end

function GetResourceState(resourceName)
    return "started" -- Placeholder, replace with actual implementation
end
