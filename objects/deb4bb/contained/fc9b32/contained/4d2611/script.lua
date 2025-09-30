function onLoad()
    self.createButton({
        click_function = "fordRiver",
        function_owner = self,
        label          = "Ford the River",
        position       = Vector(0,0.3,1.43),
        width          = 1050,
        scale          = Vector(0.65,1,0.65),
        height         = 160,
        font_size      = 150,
        font_color     = Color.White,
        color          = Color.fromHex("397f6d"),
        hover_color    = Color.fromHex("2b715f"),
        press_color    = Color.fromHex("1d6551"),
        tooltip = "Randomly add R cards from the River Set to the top of the path deck"
    })
end
function fordRiver()
    local pathDeck = Global.call("getPathDeck")
    if not pathDeck then
        broadcastToAll("Unable to find Path Deck", Color.Red)
        return
    end

    local rangerCount = Global.call("getRangersCount")
    if rangerCount < 1 then
        broadcastToAll("Unable to find any Rangers", Color.Red)
        return
    end

    local pathBox = Global.getVar("pathBox")
    for _, obj in pairs(pathBox.getObjects()) do
        if obj.name == "River Set" then
            local riverSet = pathBox.takeObject({guid = obj.guid})
            riverSet.shuffle()
            for _=1,rangerCount do
                pathDeck.putObject(riverSet.takeObject())
            end
            pathBox.putObject(riverSet)
            self.clearButtons()
            return
        end
    end

    broadcastToAll("Unable to find River Path Set", Color.Red)
end
