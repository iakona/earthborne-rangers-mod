function onLoad(_)
    addMissionInput()
end

function grabMission(_, _, input, selected)
    if input == "" or selected then
        return
    end

    local missionName = "\""..input:lower().."\""
    local found = false
    for _, obj in pairs(self.getObjects()) do
        local lowerLuaScript = obj.lua_script:lower()
        if lowerLuaScript:find(missionName) then
            local rotation
            if lowerLuaScript:find("back = "..missionName) then
                rotation = Vector(0, 180, 180)
            else
                rotation = Vector(0, 180, 0)
            end
            self.takeObject({guid = obj.guid, position = self.getPosition() + Vector(0, 0, -7), rotation = rotation, callback_function = function(mission)
                if mission.hasTag("Mission") then
                    Global.call("RecordMission", {mission = mission})
                end
            end})
            found = true

            self.clearInputs()
            addMissionInput()
            break
        end
    end

    if not found then
        broadcastToAll("Unable to find mission "..input, Color.Red)
    end
end

function addMissionInput()
    self.createInput({
        input_function = "grabMission",
        function_owner = self,
        label          = "Mission Name",
        position       = {0, 0, -6},
        rotation       = {0, 0, 0},
        width          = 5000,
        height         = 800,
        font_size      = 1000,
        color          = Color.Black,
        font_color     = Color.White,
        tooltip        = "Enter Mission to grab, will record on campaign tracker as well if necessary",
        alignment      = 3,
    })
end
