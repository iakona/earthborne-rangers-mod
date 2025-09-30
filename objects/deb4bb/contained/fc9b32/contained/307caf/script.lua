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
    for _,obj in pairs(weatherBox.getObjects()) do
        if obj.name == "Electric Fog" then
            Global.call("SetWeather", {weather = weatherBox.takeObject({guid = obj.guid})})
            self.clearButtons()
            return
        end
    end

    broadcastToAll("Unable to find Electric Fog Weather Card", Color.Red)
end
