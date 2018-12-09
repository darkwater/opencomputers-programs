local component = require("component")
local sides     = require("sides")

while true do
    local ctrl = component.me_controller
    local db   = component.database

    local eb_inscriber = component.proxy(component.get("670a7"))
    local eb_condenser = component.proxy(component.get("f0bc1"))

    for n = 5, 7 do
        local item = ctrl.getItemsInNetwork({
            label = db.get(n).label
        })[1]

        if item and item.size > 0 then
            eb_inscriber.setExportConfiguration(sides.top, 1, db.address, n)
            eb_inscriber.exportIntoSlot(sides.top, 1)
            break
        end
    end

    local cobble = ctrl.getItemsInNetwork({ label = "Cobblestone" })[1].size
    if cobble > 1000000 then
        eb_condenser.setExportConfiguration(sides.west, 1, db.address, 10)
    else
        eb_condenser.setExportConfiguration(sides.west, 1)
    end

    os.sleep(1)
end
