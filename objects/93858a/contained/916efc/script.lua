local bagName = "fitness"

function tryRotate(spin, flip, _, old_spin, old_flip)
    if flip - old_flip ~= 0 then
        return true
    end

    local spinDiff = spin - old_spin
    if spinDiff > 180 then
        spinDiff = spinDiff - 360
    elseif spinDiff < -180 then
        spinDiff = spinDiff + 360
    end

    local quantity = self.getQuantity()
    if quantity == -1 then
        quantity = 1
    end

    if spinDiff < 0 then
        if quantity == 1 then
            self.destruct()
        else
            self.takeObject().destruct()
        end
    else
        local energyBags = Global.getTable("energyBags")
        local bag = energyBags[bagName]
        bag.takeObject({position = self.getPosition(), rotation = self.getRotation(), smooth = false})
    end

    return false
end
