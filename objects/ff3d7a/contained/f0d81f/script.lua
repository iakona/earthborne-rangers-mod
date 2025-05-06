weathers = {"A Perfect Day", "Downpour", "Howling Winds", "Electric Fog"}
dayWeather = { 1, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2, 2, 3, 3, 2, 2, 2, 3, 3, 3, 1, 1, 2, 2, 2, 3, 3, 3, 1, 1}

function onSave()
    local data = {}

    data.rangers = self.UI.getAttribute("rangers", "text")
    data.events1 = self.UI.getAttribute("events1", "text")
    data.events2 = self.UI.getAttribute("events2", "text")
    data.connection = self.UI.getAttribute("terrain", "text")
    data.missions = {}
    for i = 1, 33 do
        local name = self.UI.getAttribute("mission"..i, "text")
        if name ~= " " then
            table.insert(data.missions, {name = name, day = self.UI.getAttribute("mission"..i.."Day", "text")})
        end
    end
    data.days = {}
    for i = 1, 30 do
        for j = 1, 3 do
            local name = self.UI.getAttribute("day"..i.."-"..j, "text")
            if name and name ~= " " then
                table.insert(data.days, {name = name, day = i.."-"..j})
            end
        end
    end

    return JSON.encode(data)
end

function onLoad(data)
    setDay()
    setProgress()
    setRewards()
    local currentLocation = Global.getVar("currentLocation")
    if currentLocation == "" then
        currentLocation = " "
    end
    self.UI.setAttribute("location", "text", currentLocation)

    if data ~= "" then
        local jsonData = JSON.decode(data)
        self.UI.setAttribute("rangers", "text", jsonData.rangers)
        self.UI.setAttribute("events1", "text", jsonData.events1)
        self.UI.setAttribute("events2", "text", jsonData.events2)
        self.UI.setAttribute("terrain", "text", jsonData.connection)
        for i, mission in pairs(jsonData.missions) do
            self.UI.setAttribute("mission"..i, "text", mission.name)
            self.UI.setAttribute("mission"..i.."Day", "text", mission.day)
        end
        for _, day in pairs(jsonData.days) do
            self.UI.setAttribute("day"..day.day, "text", day.name)
        end
    end
end

function Input(_, value, id)
    self.UI.setAttribute(id, "text", value)
end

function Day(_, alt_click, id)
    alt_click = math.abs(alt_click) > 1
    local index = tonumber(id:sub(4, -1))
    local weather
    if alt_click then
        weather = dayWeather[index]
    else
        weather = dayWeather[index + 1]
    end

    if not alt_click then
        if index == 2 then
            broadcastToAll("Don't forget to read campaign guide entry 94.1!", Color.White)
        elseif index == 3 then
            broadcastToAll("Don't forget to read campaign guide entry 1.04!", Color.White)
        end
    elseif index == 30 then
        broadcastToAll("Day 30 is finished, the Campaign is now completed", Color.White)
    end

    local newWeather
    if Global.getVar("hardWeather") then
        newWeather = weathers[weather + 1]
    else
        newWeather = weathers[weather]
    end

    local label
    local newDay
    if alt_click then
        label = ""
        newDay = index
    else
        label = "X"
        newDay = index + 1
    end

    self.UI.setAttribute(id, "text", label)
    Global.setVar("currentWeather", newWeather)
    Global.setVar("currentDay", newDay)
end

function setDay()
    local currentDay = Global.getVar("currentDay")

    for index = 1, currentDay - 1 do
        self.UI.setAttribute("day"..index, "text", "X")
    end
end

function Progress(_, isOn, id)
    isOn = isOn == "True"
    local index = tonumber(id:sub(8, -3))

    local label
    local progress
    if not isOn then
        label = ""
        progress = -1
    else
        label = "◆"
        progress = 1
    end

    local missionProgress = Global.getTable("missionProgress")
    if not missionProgress[index] then
        missionProgress[index] = 0
    end
    missionProgress[index] = missionProgress[index] + progress
    if missionProgress[index] == 0 then
        missionProgress[index] = nil
    end
    Global.setTable("missionProgress", missionProgress)

    self.UI.setAttribute(id, "text", label)
end

function setProgress()
    local missionProgress = Global.getTable("missionProgress")
    for index, progress in pairs(missionProgress) do
        for i = 1, progress do
            self.UI.setAttribute("mission"..index.."-"..i, "text", "◆")
        end
    end
end

function setRewards()
    local unlockedRewards = {}
    for name, _ in pairs(Global.getTable("unlockedRewards")) do
        table.insert(unlockedRewards, name)
    end
    if #unlockedRewards then
        local rewardIndex = 1
        local rewardText = self.UI.getAttribute("rewards"..rewardIndex, "text")
        for index, name in pairs(unlockedRewards) do
            ::rewardStart::
            if rewardText == "" then
                rewardText = name
            else
                local _, count = rewardText:gsub("\n", "")
                if count < 10 or (rewardIndex == 1 and count == 10) then
                    rewardText = rewardText.."\n"..name
                else
                    if rewardIndex == 3 then
                        break
                    end
                    self.UI.setAttribute("rewards"..rewardIndex, "text", rewardText)
                    rewardIndex = rewardIndex + 1
                    rewardText = self.UI.getAttribute("rewards"..rewardIndex, "text")
                    goto rewardStart
                end
            end
        end
        self.UI.setAttribute("rewards"..rewardIndex, "text", rewardText)
    end
end
