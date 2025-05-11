function onLoad(_)
    self.UI.setAttribute("input", "tooltip", "Enter Path Card to grab.\nThis looks for first card which\nstarts the same as your input")
end

-- For path cards should be safe enough to just match start of card name with input rather than requiring full name of card
function GrabPath(params)
    local foundCard = nil
    local lowerInput = params.path:lower()
    for _, deck in pairs(self.getData().ContainedObjects) do
        if deck.Nickname:sub(1, #lowerInput):lower() == lowerInput then
            foundCard = self.takeObject({guid = deck.GUID, position = params.position})

            self.UI.setAttribute("input", "text", "")
            break
        end
        for _, card in pairs(deck.ContainedObjects) do
            if card.Nickname:sub(1, #lowerInput):lower() == lowerInput then
                local obj = self.takeObject({guid = deck.GUID})
                foundCard = obj.takeObject({guid = card.GUID, position = params.position})
                self.putObject(obj)

                self.UI.setAttribute("input", "text", "")
                break
            end
        end
    end

    return foundCard
end
function grabPath(_, input)
    if input == "" then
        return
    end

    local card = GrabPath({path = input, position = self.getPosition() + Vector(0, 0, -7)})
    if not card then
        broadcastToAll("Unable to find path card "..input, Color.Red)
    end

    return card
end
