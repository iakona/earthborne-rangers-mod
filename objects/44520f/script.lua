function onLoad(_)
    self.UI.setAttribute("toggleQE", "isOn", Global.getVar("qe"))
    self.UI.setAttribute("toggleQE", "tooltip", "If enabled, pressing Q/E on tokens and\ncounters will decrement/increment them")
end

function toggleQE()
    local enabled = Global.getVar("qe")
    enabled = not enabled
    Global.setVar("qe", enabled)
    self.UI.setAttribute("toggleQE", "isOn", enabled)
end
