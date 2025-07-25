function onLoad(_)
    self.interactable = false

    local campaign = Global.getVar("campaign")
    local expansions = getObjectsWithTag("expansion")
    if campaign == 0 then
        self.createButton({
            click_function = "startPrologue",
            function_owner = self,
            label          = "Prologue",
            position       = Vector(-0.5, 0.1, -2.9),
            width          = 520,
            height         = 180,
            font_size      = 100,
            font_color     = Color.White,
            color          = Color.fromHex("397f6d"),
            hover_color    = Color.fromHex("2b715f"),
            press_color    = Color.fromHex("1d6551"),
        })
        local offset = 0.42
        for i, expansion in pairs(expansions) do
            _ENV["campaignButton"..i] = function() startCampaign(expansion, i) end
            local expansionName = expansion.getName()
            self.createButton({
                click_function = "campaignButton"..i,
                function_owner = self,
                label          = expansionName,
                position       = Vector(-0.5, 0.1, -2.9 + offset * i),
                width          = 48 * expansionName:len(),
                height         = 180,
                font_size      = 100,
                font_color     = Color.White,
                color          = Color.fromHex("397f6d"),
                hover_color    = Color.fromHex("2b715f"),
                press_color    = Color.fromHex("1d6551"),
                tooltip        = "To import a campaign make sure you paste the JSON into the Notebook tab \"Campaign\" first",
            })
        end
    elseif campaign == -1 then
        if not getObjectFromGUID("c72426") then
            self.createButton({
                click_function = "grabCalypsa",
                function_owner = self,
                label          = "Grab Calypsa",
                position       = Vector(-0.5, 0.1, -2.9),
                width          = 700,
                height         = 180,
                font_size      = 100,
                font_color     = Color.White,
                color          = Color.fromHex("397f6d"),
                hover_color    = Color.fromHex("2b715f"),
                press_color    = Color.fromHex("1d6551"),
            })
        end
        self.createButton({
            click_function = "endPrologue",
            function_owner = self,
            label          = "End Prologue",
            position       = Vector(-0.5, 0.1, -2.48),
            width          = 700,
            height         = 180,
            font_size      = 100,
            font_color     = Color.White,
            color          = Color.fromHex("397f6d"),
            hover_color    = Color.fromHex("2b715f"),
            press_color    = Color.fromHex("1d6551"),
            tooltip        = "End Prologue and start Lure of the Valley campaign",
        })
    end
end

function setupExpansion(box)
    local foundGuide = false
    local foundMap = false
    local foundTracker = false
    for _, data in pairs(box.getObjects()) do
        if Global.call("HasTag", {data = data, tagToFind = "Guide"}) then
            local guide = box.takeObject({guid = data.guid, position = Vector(-49.25, 0.96, 17.2), rotation = Vector(0, 180, 0)})
            guide.setLock(true)
            foundGuide = true
        elseif Global.call("HasTag", {data = data, tagToFind = "Map"}) then
            local map = box.takeObject({guid = data.guid, position = Vector(-30.5, 0.96, 5.97), rotation = Vector(0, 180, 0)})
            map.setLock(true)
            Global.setVar("campaignMap", map)
            foundMap = true
        elseif Global.call("HasTag", {data = data, tagToFind = "Tracker"}) then
            local tracker = box.takeObject({guid = data.guid, position = Vector(-30.5, 0.96, 29.7), rotation = Vector(0, 180, 0)})
            tracker.setLock(true)
            Global.setVar("campaignTracker", tracker)
            foundTracker = true
        end

        if foundGuide and foundMap and foundTracker then
            break
        end
    end

    box.destruct()
end

function startCampaignHelper(campaign, location)
    Global.setVar("campaign", campaign)
    Global.setVar("currentLocation", location)
    local campaignTracker = Global.getVar("campaignTracker")
    campaignTracker.UI.setAttribute("terrain", "text", "Woods")

    Global.call("StartTheDay")
end

function startPrologue(_, _, _)
    setupExpansion(getObjectFromGUID("ff3d7a"))

    Wait.frames(function()
        startCampaignHelper(-1, "Ancestor's Grove")

        self.editButton({index = 0, click_function = "grabCalypsa", label = "Grab Calypsa", width = 700})
        self.editButton({index = 1, click_function = "endPrologue", label = "End Prologue", width = 700, tooltip = "End Prologue and start Lure of the Valley campaign"})
    end, 2)
end
function grabCalypsa(_, color, _)
    local playerBoards = Global.getTable("playerBoards")
    local playerBoard = playerBoards[color]
    if not playerBoard then
        return
    end

    local pathBox = Global.getVar("pathBox")
    for _, obj in pairs(pathBox.getObjects()) do
        if obj.name == "The Valley Set" then
            local pathSet = pathBox.takeObject({guid = obj.guid})
            local position = playerBoard.getPosition() + Vector(0, 1, 4.1)
            pathSet.takeObject({guid = "c72426", position = position, rotation = Vector(0, 180, 0)})
            pathBox.putObject(pathSet)
            break
        end
    end

    -- Remove calypsa button since there's only one copy to grab
    self.removeButton(0)
end
function endPrologue(_, _, _)
    self.clearButtons()

    Global.call("EndTheDay")
    -- EndTheDay doesn't remove location
    local locationBox = Global.getVar("locationBox")
    for _, locationCard in pairs(getObjectsWithTag("Location")) do
        locationCard.setLock(false)
        locationCard.setRotation(Vector(0, 180, 0))
        locationBox.putObject(locationCard)
    end

    -- Need to wait for location card to be put away
    Wait.frames(function()
        -- Prologue always leads into Lure of the Valley
        startCampaignHelper(1, "Lone Tree Station")
    end, 15)
end

function startCampaign(box, campaign)
    self.clearButtons()
    setupExpansion(box)

    Wait.frames(function()
        for _, data in pairs(Notes.getNotebookTabs()) do
            if data.title == "Campaign" and data.body ~= "" then
                -- import returns false when data is from different campaign
                if import(JSON.decode(data.body), campaign) then
                    return
                end
                break
            end
        end

        startCampaignHelper(campaign, "Lone Tree Station")
    end, 2)
end
function import(config, campaign)
    local hardWeather = Global.getVar("hardWeather")
    local showRewards = Global.getVar("showRewards")
    local useUncommonWisdom = Global.getVar("useUncommonWisdom")
    local recallBoxes = Global.getTable("recallBoxes")
    local campaignTracker = Global.getVar("campaignTracker")

    Global.setVar("campaign", config.campaign)
    if hardWeather ~= config.hardWeather then
        Global.getVar("weatherBox").call("toggleWeather")
    end
    if showRewards ~= config.showRewards then
        recallBoxes[5].call("toggleRewards")
    end
    if useUncommonWisdom ~= config.useUncommonWisdom then
        recallBoxes[3].call("toggleUncommonWisdom")
    end
    Global.setTable("unlockedRewards", config.unlockedRewards)

    for _, player in pairs(config.players) do
        recallBoxes[6].call("ImportDeck", player)
    end

    local pathBox = Global.getVar("pathBox")
    local trash = Global.getVar("trash")
    for _, name in pairs(config.trash) do
        local card = pathBox.call("GrabPath", {path = name, position = pathBox.getPosition() + Vector(0, 0, -7)})
        trash.putObject(card)
    end

    campaignTracker.UI.setAttribute("rangers", "text", config.tracker.rangers)
    campaignTracker.UI.setAttribute("events1", "text", config.tracker.events1)
    campaignTracker.UI.setAttribute("events2", "text", config.tracker.events2)

    campaignTracker.call("setRewards")

    -- campaign specific data
    if campaign == config.campaign then
        if campaign == 1 then
            -- check if Tala has moved card sets
            if config.tracker.events1:upper():find("FOUND TALA A HOME") or config.tracker.events2:upper():find("FOUND TALA A HOME") then
                local card = pathBox.call("GrabPath", {path = "Tala the Red, Exile", position = pathBox.getPosition() + Vector(0, 0, -7)})
                card.setDescription("Tumbledown")
                Wait.frames(function() Global.call("ReturnCard", {card = card}) end, 3)
            end
        end

        Global.setVar("currentLocation", config.currentLocation)
        Global.setVar("currentWeather", config.currentWeather)
        Global.setVar("currentDay", config.currentDay)

        Global.setTable("missionProgress", config.missionProgress)
        Global.setTable("completedMissions", config.completedMissions)

        local missionBox = Global.getVar("missionBox")
        for i, mission in pairs(config.tracker.missions) do
            campaignTracker.UI.setAttribute("mission"..i, "text", mission.name)
            campaignTracker.UI.setAttribute("mission"..i.."Day", "text", mission.day)
            if not config.completedMissions[i] then
                missionBox.call("GrabMission", {mission = mission.name})
            end
        end

        for _, day in pairs(config.tracker.days) do
            campaignTracker.UI.setAttribute("day"..day.day, "text", day.name)
        end

        campaignTracker.call("setDay")
        campaignTracker.call("setProgress")

        local textData = getObjectFromGUID("c46ac6").getData()
        textData.Text.Text = "────────────"
        textData.Text.fontSize = 24
        for i, complete in pairs(config.completedMissions) do
            if complete then
                textData.GUID = "mission"..i
                local xOffset, yOffset = campaignTracker.UI.getAttribute("mission"..i, "offsetXY"):match("([^ ]+) ([^ ]+)")
                xOffset = tonumber(xOffset) / 7 * 0.14 / 2.04
                yOffset = tonumber(yOffset) / 7 * 0.14 / 2.04
                spawnObjectData({data = textData, position = campaignTracker.getPosition() + Vector(xOffset, 0.1, yOffset + 0.15)})
            end
        end
        for _, mission in pairs(config.completedMissions) do
            Global.call("CompleteMission", {missionName = mission, import = true})
        end
        campaignTracker.UI.setAttribute("location", "text", config.currentLocation)
        campaignTracker.UI.setAttribute("terrain", "text", config.tracker.connection)
        Global.getVar("campaignMap").call("setLocation")
    end

    Global.call("StartTheDay")

    return campaign == config.campaign
end

function addMoments()
    local pathDeck = Global.call("getPathDeck")
    if not pathDeck then
        broadcastToAll("Unable to find Path Deck", Color.Red)
        return
    end

    local rangerCount = Global.call("getRangersCount")
    if rangerCount < 1 then
        broadcastToAll("Unable to find any Rangers", Color.Red)
        return
    end

    -- TODO: handle arcology moments
    local moments = nil
    local pathBox = Global.getVar("pathBox")
    for _, obj in pairs(pathBox.getObjects()) do
        if obj.name == "Valley Moments Set" then
            moments = pathBox.takeObject({guid = obj.guid})
            break
        end
    end

    if not moments then
        broadcastToAll("Unable to find Moments Deck", Color.Red)
        return
    end

    moments.shuffle()
    for _=1,rangerCount do
        pathDeck.putObject(moments.takeObject())
    end
    pathDeck.shuffle()
    pathBox.putObject(moments)

    self.UI.setAttribute("addMoments", "visibility", "Invisible")
end
