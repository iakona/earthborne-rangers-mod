function onLoad()
    self.UI.setAttribute("input", "tooltip", "Enter Mission to grab, will\nrecord on campaign\ntracker as well if necessary.\nMake sure to include mission\nsubject in () if applicable")
end

function GrabMission(params)
    local missionName = params.mission
    local lowerMissionName = missionName:lower()
    local subject = nil
    local start, _ = missionName:find(" %(")
    if start then
        local subjectName = missionName:sub(start + 2, -2)
        local lowerSubjectName = subjectName:lower()
        missionName = missionName:sub(0, start - 1)
        lowerMissionName = missionName:lower()

        if lowerMissionName == "journey" then
            local locationBox = Global.getVar("locationBox")
            for _, obj in pairs(locationBox.getObjects()) do
                if obj.name:lower() == lowerSubjectName then
                    subject = locationBox.takeObject({guid = obj.guid, position = self.getPosition() + Vector(3.2, 0, -7)})
                    break
                end
            end
        else
            local pathBox = Global.getVar("pathBox")
            subject = pathBox.call("GrabPath", {path = subjectName, position = self.getPosition() + Vector(2.5, 0, -7)})
        end

        local found = false
        if not subject then
            for _, obj in pairs(getObjectsWithTag("Path")) do
                if obj.type == "Deck" then
                    for _, data in pairs(obj.getObjects()) do
                        if data.name:lower() == lowerSubjectName then
                            subject = obj.takeObject({guid = data.guid, position = self.getPosition() + Vector(2.5, 0, -7)})
                            found = true
                            break
                        end
                    end
                elseif obj.type == "Card" then
                    if obj.getName():lower() == lowerSubjectName then
                        if missionName == "helping hand" then
                            broadcastToAll(subjectName.." is already in play, don't forget to attach helping hand to it (F6 tool)!", Color.White)
                        else
                            subject = obj
                            subject.setPositionSmooth(self.getPosition() + Vector(2.5, 0, -7))
                        end
                        found = true
                        break
                    end
                end
                if found then
                    break
                end
            end
        end

        if subject then
            local rotation
            if subject.hasTag("Location") then
                rotation = Vector(0, 90, 180)
            elseif lowerMissionName == "helping hand" or lowerMissionName == "rescue" or lowerMissionName == "confront" then
                rotation = Vector(0, 180, 0)
            else
                rotation = Vector(0, 180, 180)
            end
            subject.setRotation(rotation)
            found = true
        end

        if not found then
            broadcastToAll("Unable to find Subject "..subjectName, Color.Red)
            return
        end
    end

    -- Helping hand and Confront don't get recorded on campaign tracker
    if lowerMissionName == "helping hand" or lowerMissionName == "confront" then
        params.record = false
    end

    local found = false
    lowerMissionName = "\""..lowerMissionName.."\""
    for _, obj in pairs(self.getObjects()) do
        local lowerLuaScript = obj.lua_script:lower()
        if lowerLuaScript:find(lowerMissionName) then
            local rotation
            if lowerLuaScript:find("back = "..lowerMissionName) then
                rotation = Vector(0, 180, 180)
            else
                rotation = Vector(0, 180, 0)
            end
            self.takeObject({guid = obj.guid, position = self.getPosition() + Vector(0, 0, -7), rotation = rotation, callback_function = function(mission)
                if lowerMissionName == "\"helping hand\"" or lowerMissionName == "\"rescue\"" then
                    if subject then
                        subject.addAttachment(mission)
                    end
                elseif mission.hasTag("Mission") then
                    if subject then
                        mission.addAttachment(subject)
                    end
                end
                if params.record then
                    Global.call("RecordMission", {mission = mission, subject = subject})
                end
            end})
            found = true
            self.UI.setAttribute("input", "text", "")
            break
        end
    end

    if not found then
        broadcastToAll("Unable to find mission "..missionName, Color.Red)
    end
end
function grabMission(_, input)
    if input == "" then
        return
    end

    GrabMission({mission = input, record = true})
end
