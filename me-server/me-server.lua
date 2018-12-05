while true do
    local db = component.database

    for n = 5, 7 do
        local item = component.me_controller.getItemsInNetwork({
            label = db.get(n).label
        })

        if size > 0 then
            component.me_exportbus.setExportConfiguration(sides.top, 1, db.address, n)
            break
        end
    end

    component.me_exportbus.setExportConfiguration(sides.top, 1)

    os.sleep(1)
end
