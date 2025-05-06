function onLoad(_)
    addPathInput()
end

function grabPath(_, _, input, selected)
    if input == "" or selected then
        return
    end

    local found = false
    local lowerInput = input:lower()
    local data = self.getData()
    for _, deck in pairs(self.getData().ContainedObjects) do
        for _, card in pairs(deck.ContainedObjects) do
            if card.Nickname:lower() == lowerInput then
                local obj = self.takeObject({guid = deck.GUID})
                obj.takeObject({guid = card.GUID, position = self.getPosition() + Vector(0, 0, -7)})
                self.putObject(obj)

                found = true
                self.clearInputs()
                addPathInput()
                break
            end
        end
    end

    if not found then
        broadcastToAll("Unable to find path card "..input, Color.Red)
    end
end

function addPathInput()
    self.createInput({
        input_function = "grabPath",
        function_owner = self,
        label          = "Path Name",
        position       = {0, 0, -6},
        rotation       = {0, 0, 0},
        width          = 5000,
        height         = 800,
        font_size      = 1000,
        color          = Color.Black,
        font_color     = Color.White,
        tooltip        = "Enter Path Card to grab",
        alignment      = 3,
    })
end
