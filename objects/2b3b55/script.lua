function onLoad(_)
    addMissionInput()
end

function GrabMission(params)
    local missionName = "\""..params.mission:lower().."\""
    local subject = nil
    local start, _ = missionName:find(" %(")
    if start then
        local subjectName = missionName:sub(start + 2, -3)
        missionName = missionName:sub(0, start - 1).."\""

        if missionName == "\"journey\"" then
            local locationBox = Global.getVar("locationBox")
            for _, obj in pairs(locationBox.getObjects()) do
                if obj.name:lower() == subjectName then
                    subject = locationBox.takeObject({guid = obj.guid, position = self.getPosition() + Vector(3.2, 0, -7)})
                    break
                end
            end
        else
            local pathBox = Global.getVar("pathBox")
            subject = pathBox.call("GrabPath", {path = subjectName, position = self.getPosition() + Vector(2.5, 0, -7)})
        end

        if subject then
            local rotation
            if subject.hasTag("Location") then
                rotation = Vector(0, 90, 180)
            else
                rotation = Vector(0, 180, 180)
            end
            subject.setRotation(rotation)
        else
            broadcastToAll("Unable to find Subject "..subjectName, Color.Red)
            return
        end
    end

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
                    if params.record then
                        Global.call("RecordMission", {mission = mission, subject = subject})
                    end
                    if subject then
                        mission.addAttachment(subject)
                    end
                end
            end})
            found = true

            self.clearInputs()
            addMissionInput()
            break
        end
    end

    if not found then
        broadcastToAll("Unable to find mission "..params.mission, Color.Red)
    end
end
function grabMission(_, _, input, selected)
    if input == "" or selected then
        return
    end

    GrabMission({mission = input, record = true})
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
