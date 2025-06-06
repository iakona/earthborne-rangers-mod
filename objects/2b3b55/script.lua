function onLoad()
    self.UI.setAttribute("input", "tooltip", "Enter Mission to grab, will\nrecord on campaign\ntracker as well if necessary.\nMake sure to include mission\nsubject in () if applicable")
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

        local found = false
        if subject then
            local rotation
            if subject.hasTag("Location") then
                rotation = Vector(0, 90, 180)
            elseif missionName == "\"helping hand\"" then
                rotation = Vector(0, 180, 0)
            else
                rotation = Vector(0, 180, 180)
            end
            subject.setRotation(rotation)
            found = true
        elseif missionName == "\"helping hand\"" then
            for _, card in pairs(getObjectsWithTag("Path")) do
                if card.getName():lower() == subjectName then
                    broadcastToAll(subjectName.." is already in play, don't forget to attach helping hand to it (F6 tool)!", Color.White)
                    found = true
                    break
                end
            end
        end

        if not found then
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
                elseif mission.guid == "ebcf7e" or mission.guid == "f67a50" then
                    if subject then
                        subject.addAttachment(mission)
                    end
                end
            end})
            found = true
            self.UI.setAttribute("input", "text", "")
            break
        end
    end

    if not found then
        broadcastToAll("Unable to find mission "..params.mission, Color.Red)
    end
end
function grabMission(_, input)
    if input == "" then
        return
    end

    GrabMission({mission = input, record = true})
end
