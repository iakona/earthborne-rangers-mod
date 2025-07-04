local bagName = "spirit"

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
        local obj = bag.takeObject({position = self.getPosition() + Vector(0, -1, 0), rotation = self.getRotation(), smooth = false})
        Wait.frames(function() self.putObject(obj) end, 1)
    end

    return false
end
