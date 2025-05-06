function onLoad(_)
    self.UI.setAttribute("toggleWeather", "isOn", Global.getVar("hardWeather"))
end

function toggleWeather()
    local enabled = Global.getVar("hardWeather")
    enabled = not enabled
    Global.setVar("hardWeather", enabled)
    self.UI.setAttribute("toggleWeather", "isOn", enabled)
end
