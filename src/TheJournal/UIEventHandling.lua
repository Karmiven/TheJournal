-- ##################################################################
-- # UIEventHandling.lua
-- # ʕ •ᴥ•ʔ✿ Event Handling System ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UIEventHandling = {}

-- ʕ •ᴥ•ʔ✿ Event frame and registered event handlers ✿ʕ•ᴥ•ʔ
local eventFrame = CreateFrame("Frame")
local registeredHandlers = {}

-- ʕ •ᴥ•ʔ✿ Register an event handler ✿ʕ•ᴥ•ʔ
function UIEventHandling.RegisterEvent(event, handler)
    if not registeredHandlers[event] then
        registeredHandlers[event] = {}
        eventFrame:RegisterEvent(event)
    end
    table.insert(registeredHandlers[event], handler)
end

-- ʕ •ᴥ•ʔ✿ Unregister an event handler ✿ʕ•ᴥ•ʔ
function UIEventHandling.UnregisterEvent(event, handler)
    if registeredHandlers[event] then
        for i, h in ipairs(registeredHandlers[event]) do
            if h == handler then
                table.remove(registeredHandlers[event], i)
                break
            end
        end
        
        if #registeredHandlers[event] == 0 then
            registeredHandlers[event] = nil
            eventFrame:UnregisterEvent(event)
        end
    end
end

-- ʕ •ᴥ•ʔ✿ Event dispatcher ✿ʕ•ᴥ•ʔ
local function EventDispatcher(self, event, ...)
    if registeredHandlers[event] then
        for _, handler in ipairs(registeredHandlers[event]) do
            handler(...)
        end
    end
end

-- ʕ •ᴥ•ʔ✿ Set event script ✿ʕ•ᴥ•ʔ
eventFrame:SetScript("OnEvent", EventDispatcher)

-- ʕ •ᴥ•ʔ✿ Global access ✿ʕ•ᴥ•ʔ
_G.TheJournal_UIEventHandling = UIEventHandling

return UIEventHandling
