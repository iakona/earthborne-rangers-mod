function onLoad(_)
    self.UI.setAttribute("toggleWeather", "isOn", Global.getVar("hardWeather"))
    self.UI.setAttribute("toggleWeather", "tooltip", "If enabled, weather will\nbe one step harder")
end

function toggleWeather()
    local enabled = Global.getVar("hardWeather")
    enabled = not enabled
    Global.setVar("hardWeather", enabled)
    self.UI.setAttribute("toggleWeather", "isOn", enabled)
end
