function onLoad()
    self.createButton({
        click_function = "electricFog",
        function_owner = self,
        label          = "Electric Fog",
        position       = Vector(0,0.3,1.43),
        width          = 900,
        scale          = Vector(0.65,1,0.65),
        height         = 160,
        font_size      = 150,
        font_color     = Color.White,
        color          = Color.fromHex("397f6d"),
        hover_color    = Color.fromHex("2b715f"),
        press_color    = Color.fromHex("1d6551"),
        tooltip = "return the current weather to the collection and put Electric Fog into play"
    })
end
function electricFog()
    local weatherBox = Global.getVar("weatherBox")
    local electricFogGuid = nil
    for _,obj in pairs(weatherBox.getObjects()) do
        if obj.name == "Electric Fog" then
            electricFogGuid = obj.guid
            break
        end
    end
    if not electricFogGuid then
        broadcastToAll("Unable to find Electric Fog Weather Card", Color.Red)
        return
    end

    for _, obj in pairs(getObjectsWithTag("Counter")) do
        hits = Physics.cast({
            origin = obj.getPosition(),
            direction = Vector(0, -1, 0),
            type = 1,
            max_distance = 0.4,
        })
        for _, hit in pairs(hits) do
            if hit.hit_object.type == "Card" and hit.hit_object.hasTag("Weather") then
                obj.destruct()
                break
            end
        end
    end

    for _, weatherCard in pairs(getObjectsWithTag("Weather")) do
        weatherCard.setRotation(Vector(0, 180, 0))
        weatherBox.putObject(weatherCard)
    end

    local sharedBoard = Global.getVar("sharedBoard")
    local snaps = sharedBoard.getSnapPoints()
    local weatherIndex = Global.getVar("weatherIndex")
    local weather = weatherBox.takeObject({guid = electricFogGuid, position = sharedBoard.positionToWorld(snaps[weatherIndex].position), rotation = Vector(0, 180, 0)})
    Wait.condition(function() Global.call("SetupTokens", {card = weather}) end, function() return not weather.isSmoothMoving() end)

    Global.setVar("currentWeather", "Electric Fog")
    self.clearButtons()
end
