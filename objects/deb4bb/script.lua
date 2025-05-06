function onLoad(_)
    addPathInput()
end

function GrabPath(params)
    local foundCard = nil
    local lowerInput = params.path:lower()
    local data = self.getData()
    for _, deck in pairs(self.getData().ContainedObjects) do
        if deck.Nickname:lower() == lowerInput then
            foundCard = self.takeObject({guid = deck.GUID, position = params.position})

            found = true
            self.clearInputs()
            addPathInput()
            break
        end
        for _, card in pairs(deck.ContainedObjects) do
            if card.Nickname:lower() == lowerInput then
                local obj = self.takeObject({guid = deck.GUID})
                foundCard = obj.takeObject({guid = card.GUID, position = params.position})
                self.putObject(obj)

                found = true
                self.clearInputs()
                addPathInput()
                break
            end
        end
    end

    return foundCard
end
function grabPath(_, _, input, selected)
    if input == "" or selected then
        return
    end

    local card = GrabPath({path = input, position = self.getPosition() + Vector(0, 0, -7)})
    if not card then
        broadcastToAll("Unable to find path card "..input, Color.Red)
    end

    return card
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
