-- Wize Menu
local DuiUrl = "https://raw.githack.com/wize-menu/wize-dui/main/wize.html"
local keyListUrl = "https://raw.githack.com/wize-menu/wize-dui/main/wizekeys.json"
local KeysBin = MachoWebRequest(keyListUrl)
local CurrentKey = MachoAuthenticationKey()
local Dui = MachoCreateDui(DuiUrl)
local MenuOpen = false
local MenuPosition = {x = 960, y = 540}

-- Key validation
local function isKeyValid()
    if not KeysBin then
        return false
    end
    local ok, keys = pcall(json.decode, KeysBin)
    if not ok or not keys or type(keys) ~= "table" then
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
    return false
end

if not isKeyValid() then
    MachoMenuNotification("Wize Menu", "Your key ain't valid lmfao: " .. CurrentKey, 10)
    return
end

-- Show expiration notification
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
                        MachoMenuNotification("Wize Menu", expirationMessage, 5)
                    end
                    break
                end
            end
        end
    end
)

-- Menu state
local MenuState = {
    position = MenuPosition,
    activeTab = 0,
    selection = { index = 0 },
    tabs = {
        { key = "main", label = "Main", items = {
            { type = "button", label = "Test Button", action = function() MachoMenuNotification("Wize Menu", "Test button clicked!", 3) end },
            { type = "input", label = "Test Input", value = "", placeholder = "Enter something" },
            { type = "label", label = "Test Label" }
        }},
        { key = "settings", label = "Settings", items = {
            { type = "button", label = "Toggle Feature", action = function() MachoMenuNotification("Wize Menu", "Feature toggled!", 3) end }
        }}
    }
}

-- Send message to DUI
local function SendToDui(action, data)
    if Dui and MenuOpen then
        MachoSendDuiMessage(Dui, json.encode({ action = action, data = data }))
    end
end

-- Toggle menu
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if IsControlJustPressed(0, 289) then -- F2 key
                MenuOpen = not MenuOpen
                if MenuOpen then
                    SendToDui('openMenu', {})
                    SendToDui('updateMenuState', MenuState)
                    SendToDui('updatePosition', MenuPosition)
                    SendToDui('showNotification', { message = "Wize Menu Opened", duration = 3 })
                else
                    SendToDui('closeMenu', {})
                end
            end
        end
    end
)

-- Handle DUI messages
RegisterNUICallback('tabChange', function(data)
    MenuState.activeTab = data.tabIndex
    SendToDui('updateMenuState', MenuState)
end)

RegisterNUICallback('itemAction', function(data)
    local tab = MenuState.tabs[data.tabIndex + 1]
    local item = tab.items[data.itemIndex + 1]
    if item.action then
        item.action(MenuState)
    end
end)

RegisterNUICallback('inputChange', function(data)
    MenuState.tabs[data.tabIndex + 1].items[data.itemIndex + 1].value = data.value
end)
