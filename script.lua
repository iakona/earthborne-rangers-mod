recallBoxes = {
    "054c4f",
    "03ba7d",
    "f68ae9",
    "f27e18",
    "6a30bc",
    "c9b6a8",
}
pathBox = "deb4bb"
locationBox = "196fb2"
missionBox = "2b3b55"
weatherBox = "4b9483"
maladiesBox = "eceffc"
trash = "5dca9a"

campaignTracker = nil
campaignMap = nil

energyBags = {
    ["awareness"] = "93de64",
    ["fitness"] = "93858a",
    ["focus"] = "cc9cd4",
    ["spirit"] = "628580",
}
harmBag = "3065c9"
progressBag = "3bdc5a"
allPurposeBag = "44520f"

playerBoards = {
    ["Red"] = "ce80f5",
    ["Yellow"] = "e6257c",
    ["Purple"] = "e6e8e0",
    ["Teal"] = "e378f1",
}
sharedBoard = "be5fe7"

rangerTokens = {
    ["Red"] = "28802e",
    ["Yellow"] = "834aaf",
    ["Purple"] = "2971e7",
    ["Teal"] = "1aeab3",
}
sideboards = {
    ["Red"] = "c3ff02",
    ["Yellow"] = "e5c862",
    ["Purple"] = "41a3c9",
    ["Teal"] = "280658",
}

energyOffsets = {
    ["awareness"] = Vector(-0.6, 0.5, 0.75),
    ["fitness"] = Vector(-0.6, 0.5, -0.75),
    ["focus"] = Vector(0.6, 0.5, -0.75),
    ["spirit"] = Vector(0.6, 0.5, 0.75),
}

aspectIndex = 1
roleIndex = 2
deckIndex = 3
discardIndex = 4
fatigueIndex = 5
tokenIndex = 6

challengeIndex = 1
challengeDiscardIndex = 2
pathIndex = 3
pathDiscardIndex = 4
locationIndex = 5
weatherIndex = 6
capturedPreyIndex = 7

preyTimer = nil

-- Save State Data
currentLocation = ""
currentWeather = "A Perfect Day"
currentDay = 1
hardWeather = false
showRewards = false
useUncommonWisdom = false
campaign = 0
unlockedRewards = {}
missionProgress = {}
completedMissions = {}

function onSave()
    local data = {
        currentLocation = currentLocation,
        currentWeather = currentWeather,
        currentDay = currentDay,
        hardWeather = hardWeather,
        showRewards = showRewards,
        useUncommonWisdom = useUncommonWisdom,
        campaign = campaign,
        unlockedRewards = unlockedRewards,
        missionProgress = missionProgress,
        completedMissions = completedMissions,
    }
    return JSON.encode(data)
end

function onLoad(data)
    for key, guid in pairs(recallBoxes) do
        recallBoxes[key] = getObjectFromGUID(guid)
    end
    pathBox = getObjectFromGUID(pathBox)
    locationBox = getObjectFromGUID(locationBox)
    missionBox = getObjectFromGUID(missionBox)
    weatherBox = getObjectFromGUID(weatherBox)
    maladiesBox = getObjectFromGUID(maladiesBox)
    trash = getObjectFromGUID(trash)
    for key, guid in pairs(energyBags) do
        energyBags[key] = getObjectFromGUID(guid)
    end
    harmBag = getObjectFromGUID(harmBag)
    progressBag = getObjectFromGUID(progressBag)
    allPurposeBag = getObjectFromGUID(allPurposeBag)
    for key, guid in pairs(playerBoards) do
        playerBoards[key] = getObjectFromGUID(guid)
    end
    sharedBoard = getObjectFromGUID(sharedBoard)
    for key, guid in pairs(rangerTokens) do
        rangerTokens[key] = getObjectFromGUID(guid)
    end
    for key, guid in pairs(sideboards) do
        sideboards[key] = getObjectFromGUID(guid)
    end

    addAllContextMenuItems()
    -- We need a timer checking this because we can't dynamically detect when new attachments are made
    Wait.time(addAllContextMenuItems, 2, -1)

    if data ~= "" then
        local jsonData = JSON.decode(data)
        currentLocation = jsonData.currentLocation
        currentWeather = jsonData.currentWeather
        currentDay = jsonData.currentDay
        hardWeather = jsonData.hardWeather
        showRewards = jsonData.showRewards
        useUncommonWisdom = jsonData.useUncommonWisdom
        campaign = jsonData.campaign
        unlockedRewards = jsonData.unlockedRewards
        missionProgress = jsonData.missionProgress
        completedMissions = jsonData.completedMissions
    end

    if campaign ~= 0 then
        campaignTracker = getObjectsWithTag("Tracker")[1]
        campaignMap = getObjectsWithTag("Map")[1]
        UI.setAttribute("playerButtons", "visibility", "")
        UI.setAttribute("partyButtons", "visibility", "")
    end

    if Player["White"].seated and not Player["Red"].seated then
        Player["White"].changeColor("Red")
    end

    if getObjectFromGUID("cada94") then
        preyTimer = Wait.time(countPreyPresence, 2, -1)
    else
        getObjectFromGUID("c46ac6").setValue(" ")
    end

    clearHotkeys()
    addHotkey("Spawn Harm Token", function (playerColor, hoveredObject, cursorLocation, key_down_up)
        harmBag.takeObject({position = cursorLocation + Vector(0, 2, 0), rotation = Vector(0, 180, 0)})
    end)
    addHotkey("Spawn Progress Token", function (playerColor, hoveredObject, cursorLocation, key_down_up)
        progressBag.takeObject({position = cursorLocation + Vector(0, 2, 0), rotation = Vector(0, 180, 0)})
    end)
    addHotkey("Spawn All-Purpose Token", function (playerColor, hoveredObject, cursorLocation, key_down_up)
        allPurposeBag.takeObject({position = cursorLocation + Vector(0, 2, 0), rotation = Vector(0, 180, 0)})
    end)

    addHotkey("Draw Path Card", function (playerColor, hoveredObject, cursorLocation, key_down_up)
        drawPath(playerColor)
    end)
    addHotkey("Draw Ranger Card", function (playerColor, hoveredObject, cursorLocation, key_down_up)
        drawRanger(playerColor)
    end)
    addHotkey("Draw Challenge Card", function (playerColor, hoveredObject, cursorLocation, key_down_up)
        DrawChallenge()
    end)

    addHotkey("Pay Ranger Card Cost", function (playerColor, hoveredObject, cursorLocation, key_down_up)
        if hoveredObject.getTable("cost") then
            payCost(playerColor, nil, hoveredObject)
        end
    end)
    addHotkey("Setup Tokens", function (playerColor, hoveredObject, cursorLocation, key_down_up)
        if hoveredObject.getVar("tokens") then
            setupTokens(nil, nil, hoveredObject)
        end
    end)
end
function onObjectSpawn(obj)
    addContextMenuItems(obj)

    if obj.guid == "cada94" then
        preyTimer = Wait.time(countPreyPresence, 2, -1)
        printToAll("Captured Prey should go to left of Challenge Deck area")
    end
end
function onObjectDestroy(obj)
    if obj.guid == "cada94" then
        getObjectFromGUID("c46ac6").setValue(" ")
        Wait.stop(preyTimer)
    end
end

function countPreyPresence()
    local snaps = sharedBoard.getSnapPoints()
    local hits = Physics.cast({
        origin = sharedBoard.positionToWorld(snaps[capturedPreyIndex].position) + Vector(0, -0.01, 0),
        direction = Vector(0, 1, 0),
        type = 1,
        max_distance = 1,
    })
    local capturedPrey = nil
    for _, hit in pairs(hits) do
        if hit.hit_object.hasTag("Path") then
            capturedPrey = hit.hit_object
            break
        end
    end

    if capturedPrey then
        local presence = 0
        if capturedPrey.type == "Card" then
            if capturedPrey.hasTag("Prey") then
                local cardPresence = capturedPrey.getVar("presence")
                if cardPresence then
                    presence = presence + cardPresence
                end
            end
        elseif capturedPrey.type == "Deck" then
            for _, card in pairs(capturedPrey.getObjects()) do
                if hasTag(card, "Prey") then
                    local _, finish = card.lua_script:find("presence = ")
                    if finish then
                        local cardPresence = tonumber(card.lua_script:sub(finish + 1, finish + 2))
                        presence = presence + cardPresence
                    end
                end
            end
        end
        getObjectFromGUID("c46ac6").setValue("CAPTURED PREY ("..presence..")")
    else
        getObjectFromGUID("c46ac6").setValue("CAPTURED PREY (0)")
    end
end

function addAllContextMenuItems()
    for _, obj in pairs(getObjects()) do
        addContextMenuItems(obj)
    end
end
function addContextMenuItems(obj)
    obj.clearContextMenu()
    if obj.type == "Card" then
        if obj.hasTag("Mission") then
            obj.addContextMenuItem("Record Mission", recordMission, false)
            obj.addContextMenuItem("Complete Mission", returnCard, false)
        end
        if obj.hasTag("Path") or obj.guid == "ebcf7e" or obj.guid == "f67a50" then
            obj.addContextMenuItem("Return to Collection", returnCard, false)
        end
        -- Description means it was picked by a player
        if obj.getDescription() == "" then
            if obj.hasTag("Aspect") then
                obj.addContextMenuItem("Pick Aspect", pickAspect, false)
            elseif obj.hasTag("Role") then
                obj.addContextMenuItem("Pick Role", pickRole, false)
            elseif obj.hasTag("Ranger") then
                obj.addContextMenuItem("Pick Ranger Card", pickRanger, false)
                if obj.hasTag("Reward") then
                    obj.addContextMenuItem("Unlock Reward", unlockReward, false)
                end
            end
        else
            if obj.hasTag("Ranger") then
                if obj.getTable("cost") then
                    obj.addContextMenuItem("Pay Cost", payCost, false)
                end
                if obj.hasTag("Malady") then
                    obj.addContextMenuItem("Return to Collection", returnCard, false)
                end
            end
        end
        if obj.getVar("tokens") then
            obj.addContextMenuItem("Setup Tokens", setupTokens, false)
        end
        if #obj.getAttachments() > 0 then
            obj.addContextMenuItem("Remove Attachments", removeAttachment, false)
        end
        if obj.hasTag("Prebuilt") then
            obj.addContextMenuItem("Pick Deck", pickDeck, false)
        end
    end
    if campaignTracker and obj.guid == campaignTracker.guid then
        campaignTracker.addContextMenuItem("Export Campaign", exportCampaign, false)
    end
end

function getMissionName(mission)
    if mission.is_face_down then
        local back = mission.getVar("back")
        if back then
            return back
        else
            return mission.getVar("front")
        end
    else
        return mission.getVar("front")
    end
end
function RecordMission(params)
    if campaignTracker then
        for i = 1, 33 do
            local name = campaignTracker.UI.getAttribute("mission"..i, "text")
            if name == "" then
                local missionName = getMissionName(params.mission)
                if params.subject then
                    missionName = missionName.." ("..params.subject.getName()..")"
                end
                campaignTracker.UI.setAttribute("mission"..i, "text", missionName)
                campaignTracker.UI.setAttribute("mission"..i.."Day", "text", tostring(currentDay))
                break
            end
        end
    end
end
function recordMission(_, _, obj)
    RecordMission({mission = obj})
end
function removeFromGame(_, _, obj)
    for _, attachment in pairs(obj.removeAttachments()) do
        if attachment.hasTag("Ranger") then
            discardRangerCard(attachment)
        elseif attachment.hasTag("Path") then
            local snaps = sharedBoard.getSnapPoints()
            attachment.setPositionSmooth(sharedBoard.positionToWorld(snaps[pathDiscardIndex].position) + Vector(0, 0.5, 0))
        end
    end

    trash.putObject(obj)
end
function PickAspect(params)
    pickAspect(params.color, nil, params.aspect)
end
function pickAspect(color, _, obj)
    if not playerBoards[color] then
        return
    end

    local aspect = getAspect(color)
    if aspect then
        aspect.destruct()
        Player[color].broadcast("You already have an aspect, replacing the old one")
    end

    local playerBoard = playerBoards[color]
    local snaps = playerBoard.getSnapPoints()

    local newAspect = obj.clone()
    newAspect.setPosition(playerBoard.positionToWorld(snaps[aspectIndex].position) + Vector(0, 0.01, 0))
    newAspect.setDescription(color)
    newAspect.setLock(true)
end
function PickRole(params)
    if not playerBoards[params.color] then
        return
    end

    local role = getRole(params.color)
    if role then
        role.destruct()
        Player[params.color].broadcast("You already have a role, replacing the old one")
    end

    local playerBoard = playerBoards[params.color]
    local snaps = playerBoard.getSnapPoints()

    local newRole = params.role.clone()
    if newRole.getStates() ~= nil and params.useUncommonWisdom ~= nil then
        if params.useUncommonWisdom and newRole.getStateId() == 1 then
            newRole = newRole.setState(2)
        elseif not params.useUncommonWisdom and newRole.getStateId() == 2 then
            newRole = newRole.setState(1)
        end
    end
    newRole.setPosition(playerBoard.positionToWorld(snaps[roleIndex].position) + Vector(0, 0.01, 0))
    newRole.setLock(false)
    newRole.setDescription(params.color)
end
function pickRole(color, _, obj)
    PickRole({color = color, role = obj})
end
function PickRanger(params)
    if not playerBoards[params.color] then
        return
    end

    local aspect = getAspect(params.color)
    if aspect then
        local requirement = params.ranger.getTable("requirement")
        if requirement then
            for statName, _ in pairs(energyOffsets) do
                local requiredStat = requirement[statName]
                if requiredStat then
                    local stat = aspect.getVar(statName)
                    if stat < requiredStat then
                        Player[params.color].broadcast("Ranger Card requires "..statName.." to be "..requiredStat.." but you only have "..stat.."!", Color.Red)
                        return
                    end
                end
            end
        end
    end

    local playerBoard = playerBoards[params.color]
    local snaps = playerBoard.getSnapPoints()

    for _ = 1, params.quantity do
        local newRanger = params.ranger.clone()
        if newRanger.getStates() ~= nil then
            -- Any not passed in taboo sets are assumed to be disabled
            if params.useUncommonWisdom and newRanger.getStateId() == 1 then
                newRanger = newRanger.setState(2)
            elseif not params.useUncommonWisdom and newRanger.getStateId() == 2 then
                newRanger = newRanger.setState(1)
            end
        end
        local position
        if not params.sideboard then
            position = playerBoard.positionToWorld(snaps[deckIndex].position) + params.offset
        else
            position = newRanger.getPosition()
        end
        newRanger.setPosition(position)
        newRanger.setRotation(Vector(0, 180, 180))
        newRanger.setLock(false)
        newRanger.setDescription(params.color)
        if params.sideboard then
            sideboards[params.color].putObject(newRanger)
        end
    end
end
function pickRanger(color, _, obj)
    local quantity
    if not obj.hasTag("Reward") and not obj.hasTag("Malady") then
        -- You get 2 copies of non reward/malady cards
        quantity = 2
    else
        quantity = 1
        if obj.hasTag("Reward") then
            Player[color].broadcast("Don't forget to remove a non-malady card from your deck")
        end
    end
    PickRanger({color = color, ranger = obj, quantity = quantity, offset = Vector(0, 0.5, 0)})
end
function UnlockReward(params)
    if unlockedRewards[params.reward] then
        Player[params.color].broadcast(params.reward.." is already Unlocked", Color.White)
    else
        unlockedRewards[params.reward] = true
        for i = 1, 3 do
            local rewardText = campaignTracker.UI.getAttribute("rewards"..i, "text")
            if rewardText == "" then
                campaignTracker.UI.setAttribute("rewards"..i, "text", params.reward)
                break
            else
                local _, count = rewardText:gsub("\n", "")
                if count < 10 or (i == 1 and count == 10) then
                    campaignTracker.UI.setAttribute("rewards"..i, "text", rewardText.."\n"..params.reward)
                    break
                end
            end
        end
        broadcastToAll("Unlocked reward "..params.reward, Color.White)
    end
end
function unlockReward(color, _, obj)
    UnlockReward({color = color, reward = obj.getName()})
end
function removeAttachment(_, _, obj)
    obj.removeAttachments()
end
function payCost(color, _, obj)
    local aspect = getAspect(color)
    if aspect then
        local cost = obj.getTable("cost")
        for statName, offset in pairs(energyOffsets) do
            local requiredCount = cost[statName]
            if requiredCount then
                local hits = Physics.cast({
                    origin = aspect.getPosition() + Vector(offset.x, 0, offset.z),
                    direction = Vector(0, 1, 0),
                    type = 1,
                    max_distance = 1,
                })

                local energy = nil
                for _, hit in pairs(hits) do
                    if hit.hit_object.hasTag("Energy") then
                        energy = hit.hit_object
                        break
                    end
                end

                if energy then
                    local count = energy.getQuantity()
                    if count == -1 then
                        count = 1
                    end
                    if count < requiredCount then
                        Player[color].broadcast("Ranger Card requires "..requiredCount.." "..statName.." energy to play, but you only have "..count.."!", Color.Red)
                        return
                    end

                    for _ = 1, requiredCount do
                        if count == 1 then
                            energy.destruct()
                        else
                            energy.takeObject().destruct()
                        end
                    end
                    Player[color].broadcast("Paid "..requiredCount.." "..statName.." energy to play "..obj.getName(), Color.White)
                end
            end
        end
    end
end
function setupTokens(_, _, obj)
    for i = 1, obj.getVar("tokens") do
        allPurposeBag.takeObject({position = obj.getPosition() + Vector(0, 0.5 * i, 0.35), rotation = Vector(0, 180, 0)})
    end
end
function ReturnCard(params)
    returnCard(nil, nil, params.card)
end
function returnCard(_, _, obj)
    for _, attachment in pairs(obj.removeAttachments()) do
        if attachment.hasTag("Ranger") then
            discardRangerCard(attachment)
        elseif attachment.hasTag("Path") then
            local snaps = sharedBoard.getSnapPoints()
            attachment.setPositionSmooth(sharedBoard.positionToWorld(snaps[pathDiscardIndex].position) + Vector(0, 0.5, 0))
        end
    end

    if obj.hasTag("Malady") then
        obj.destruct()
    elseif obj.hasTag("Path") then
        local set = obj.getDescription().." Set"
        for _, objData in pairs(pathBox.getObjects()) do
            if set == objData.name then
                local deck = pathBox.takeObject({guid = objData.guid})
                deck.putObject(obj)
                pathBox.putObject(deck)
                return
            elseif set == objData.description.." Set" then
                local card = pathBox.takeObject({guid = objData.guid})
                local deck = group({card, obj})[1]
                deck.setName(set)
                return
            end
        end
        pathBox.putObject(obj)
    elseif obj.hasTag("Mission") then
        local missionName = getMissionName(obj)
        for i = 1, 33 do
            local name = campaignTracker.UI.getAttribute("mission"..i, "text")
            if not completedMissions[i] and name:find(missionName) then
                local data = getObjectFromGUID("c46ac6").getData()
                data.Text.Text = "────────────"
                data.Text.fontSize = 24
                local xOffset, yOffset = campaignTracker.UI.getAttribute("mission"..i, "offsetXY"):match("([^ ]+) ([^ ]+)")
                xOffset = tonumber(xOffset) / 7 * 0.14 / 2.04
                yOffset = tonumber(yOffset) / 7 * 0.14 / 2.04
                spawnObjectData({data = data, position = campaignTracker.getPosition() + Vector(xOffset, 0.1, yOffset + 0.15)})
                completedMissions[i] = true
                break
            end
        end
        missionBox.putObject(obj)
    else -- helping hand missions
        missionBox.putObject(obj)
    end
end
function pickDeck(color, _, obj)
    if not playerBoards[color] then
        return
    end

    ClearPlayerDeck({color = color})

    local deck = obj.getTable("deck")
    deck.color = color
    recallBoxes[6].call("ImportDeck", deck)

    obj.destruct()
end
function ClearPlayerDeck(params)
    local role = getRole(params.color)
    if role then
        role.destruct()
    end
    local aspect = getAspect(params.color)
    if aspect then
        aspect.destruct()
    end
    local deck = getRangerDeck(params.color)
    if deck then
        deck.destruct()
    end
end

function onScriptingButtonDown(index, color)
    local position = Player[color].getPointerPosition() + Vector(0, 2, 0)
    local rotation = Vector(0, 180, 0)
    if index == 1 then
        harmBag.takeObject({position = position, rotation = rotation})
    elseif index == 2 then
        progressBag.takeObject({position = position, rotation = rotation})
    elseif index == 3 then
        allPurposeBag.takeObject({position = position, rotation = rotation})
    end
end

function onObjectEnterContainer(container, object)
    if container.hasTag("Label") and object.hasTag("Label") then
        makeLabel(container)
    end
end
function onObjectLeaveContainer(container, object)
    if container.hasTag("Label") and object.hasTag("Label") then
        makeLabel(container)
    end
end
function makeLabel(container)
    local quantity = container.getQuantity()
    if quantity == -1 then
        container.clearButtons()
    else
        local thickness = 0.2
        local offset = -0.09
        local zOffset
        if container.getName() == "Progress Counter" then
            zOffset = 0.4
        else
            zOffset = 0
        end
        if container.getButtons() == nil then
            container.createButton({
                click_function = "null",
                label = quantity,
                position = Vector(0, thickness * quantity + offset, zOffset),
                font_size = 1000,
                font_color = {1, 1, 1},
                width = 0,
                height = 0,
            })
        else
            container.editButton({index = 0, label = quantity, position = Vector(0, thickness * quantity + offset, zOffset)})
        end
    end
end

function HasTag(params)
    return hasTag(params.data, params.tagToFind)
end
function hasTag(data, tagToFind)
    for _, tag in pairs(data.tags) do
        if tag == tagToFind then
            return true
        end
    end
    return false
end
function getAspect(color)
    if not playerBoards[color] then
        return
    end

    local playerBoard = playerBoards[color]
    local snaps = playerBoard.getSnapPoints()
    local hits = Physics.cast({
        origin = playerBoard.positionToWorld(snaps[aspectIndex].position) + Vector(0, -0.01, 0),
        direction = Vector(0, 1, 0),
        type = 1,
        max_distance = 1,
    })

    local aspect = nil
    for _, hit in pairs(hits) do
        if hit.hit_object.hasTag("Aspect") then
            aspect = hit.hit_object
            break
        end
    end

    return aspect
end
function getRole(color)
    if not playerBoards[color] then
        return
    end

    local playerBoard = playerBoards[color]
    local snaps = playerBoard.getSnapPoints()
    local hits = Physics.cast({
        origin = playerBoard.positionToWorld(snaps[roleIndex].position) + Vector(0, -0.01, 0),
        direction = Vector(0, 1, 0),
        type = 1,
        max_distance = 1,
    })

    local aspect = nil
    for _, hit in pairs(hits) do
        if hit.hit_object.hasTag("Role") then
            aspect = hit.hit_object
            break
        end
    end

    return aspect
end
function getRangerDeck(color)
    if not playerBoards[color] then
        return
    end

    local playerBoard = playerBoards[color]
    local snaps = playerBoard.getSnapPoints()
    local hits = Physics.cast({
        origin = playerBoard.positionToWorld(snaps[deckIndex].position) + Vector(0, -0.01, 0),
        direction = Vector(0, 1, 0),
        type = 1,
        max_distance = 1,
    })

    local deck = nil
    for _, hit in pairs(hits) do
        if hit.hit_object.hasTag("Ranger") then
            deck = hit.hit_object
            break
        end
    end

    return deck
end
function getInjuryCount(color)
    if not playerBoards[color] then
        return 0
    end

    local playerBoard = playerBoards[color]
    local snaps = playerBoard.getSnapPoints()
    local hits = Physics.cast({
        origin = playerBoard.positionToWorld(snaps[roleIndex].position) + Vector(0, -0.01, 0),
        direction = Vector(0, 1, 0),
        type = 1,
        max_distance = 1,
    })

    local currentInjury = 0
    for _, hit in pairs(hits) do
        if hit.hit_object.hasTag("Counter") then
            currentInjury = hit.hit_object.getQuantity()
            if currentInjury == -1 then
                currentInjury = 1
            end
            break
        end
    end

    return currentInjury
end

function DrawPath(player)
    drawPath(player.color)
end
function drawPath(color)
    local snaps = sharedBoard.getSnapPoints()
    local hits = Physics.cast({
        origin = sharedBoard.positionToWorld(snaps[pathIndex].position) + Vector(0, -0.01, 0),
        direction = Vector(0, 1, 0),
        type = 1,
        max_distance = 1,
    })

    local pathDeck = nil
    for _, hit in pairs(hits) do
        if hit.hit_object.hasTag("Path") then
            pathDeck = hit.hit_object
            break
        end
    end

    if not pathDeck then
        hits = Physics.cast({
            origin = sharedBoard.positionToWorld(snaps[pathDiscardIndex].position) + Vector(0, -0.01, 0),
            direction = Vector(0, 1, 0),
            type = 1,
            max_distance = 1,
        })

        local pathDiscard = nil
        for _, hit in pairs(hits) do
            if hit.hit_object.hasTag("Path") then
                pathDiscard = hit.hit_object
                break
            end
        end

        if not pathDiscard then
            broadcastToAll("Unable to find path deck nor discard", Color.Red)
            return
        end

        pathDeck = pathDiscard
        pathDeck.setPositionSmooth(sharedBoard.positionToWorld(snaps[pathIndex].position) + Vector(0, 0.5, 0), false, true)
        pathDeck.setRotationSmooth(Vector(0, 180, 180), false, true)
        pathDeck.shuffle()
    end

    pathDeck.deal(1, color)
end

function DrawRanger(player)
    drawRanger(player.color)
end
function drawRanger(color)
    local deck = getRangerDeck(color)
    if not deck then
        broadcastToAll(color.." has run out of cards in Ranger Deck, the day ends immediately", Color.Red)
        return
    end

    deck.deal(1, color)
end

local fatigueTimers = {}
function SufferFatigue(player)
    local deck = getRangerDeck(player.color)
    if not deck then
        broadcastToAll(player.color.." has run out of cards in Ranger Deck, the day ends immediately", Color.Red)
        return
    end

    --playerBoards value existing is already checked by getRangerDeck
    local playerBoard = playerBoards[player.color]
    local snaps = playerBoard.getSnapPoints()

    if deck.type == "Deck" then
        deck.takeObject({position = playerBoard.positionToWorld(snaps[fatigueIndex].position) + Vector(0, 0.5, 0), rotation = Vector(0, 90, 180)})
    elseif deck.type == "Card" then
        deck.setPositionSmooth(playerBoard.positionToWorld(snaps[fatigueIndex].position) + Vector(0, 0.5, 0))
        deck.setRotationSmooth(Vector(0, 90, 180))
    end

    -- Set timer to calculate total fatigue suffered
    if fatigueTimers[player.color] then
        Wait.stop(fatigueTimers[player.color].timer)
    else
        fatigueTimers[player.color] = {count = 0}
    end
    fatigueTimers[player.color].count = fatigueTimers[player.color].count + 1
    fatigueTimers[player.color].timer = Wait.time(function()
        player.broadcast("Suffered "..fatigueTimers[player.color].count.." Fatigue", Color.White)
        fatigueTimers[player.color] = nil
    end, 1)
end

function SufferInjury(player)
    if not playerBoards[player.color] then
        return
    end

    local currentInjury = getInjuryCount(player.color)
    currentInjury = currentInjury + 1

    local playerBoard = playerBoards[player.color]
    local snaps = playerBoard.getSnapPoints()
    harmBag.takeObject({position = playerBoard.positionToWorld(snaps[roleIndex].position) + Vector(0, 0.5, 0), rotation = Vector(0, 180, 0)})

    if currentInjury >= 3 then
        broadcastToAll(player.color.." has "..currentInjury.. " injuries, you must now end the day after this turn", Color.Red)
        if currentInjury == 3 then
            for _, obj in pairs(maladiesBox.getObjects()) do
                if obj.name == "Lingering Injury" then
                    local injury = maladiesBox.takeObject({guid = obj.guid})
                    local card = injury.clone()
                    card.setPositionSmooth(playerBoard.positionToWorld(snaps[discardIndex].position) + Vector(0, 0.5, 0))
                    card.setDescription(player.color)
                    Wait.frames(function() maladiesBox.putObject(injury) end, 3)
                    player.broadcast("Adding a Lingering Injury to your deck", Color.White)
                    break
                end
            end
        end
    end

    -- All fatigue gets discarded
    local hits = Physics.cast({
        origin = playerBoard.positionToWorld(snaps[fatigueIndex].position) + Vector(0, -0.01, 0),
        direction = Vector(0, 1, 0),
        type = 1,
        max_distance = 1,
    })

    for _, hit in pairs(hits) do
        if hit.hit_object.hasTag("Ranger") then
            hit.hit_object.setPositionSmooth(playerBoard.positionToWorld(snaps[discardIndex].position) + Vector(0, 0.5, 0), false, true)
            hit.hit_object.setRotationSmooth(Vector(0, 180, 0), false, true)
            break
        end
    end
end

function DrawChallenge(_)
    local snaps = sharedBoard.getSnapPoints()
    local hits = Physics.cast({
        origin = sharedBoard.positionToWorld(snaps[challengeIndex].position) + Vector(0, -0.01, 0),
        direction = Vector(0, 1, 0),
        type = 1,
        max_distance = 1,
    })

    local challenges = nil
    for _, hit in pairs(hits) do
        if hit.hit_object.hasTag("Challenge") then
            challenges = hit.hit_object
            break
        end
    end

    if not challenges then
        broadcastToAll("Unable to find challenge deck", Color.Red)
        return
    end

    hits = Physics.cast({
        origin = sharedBoard.positionToWorld(snaps[challengeDiscardIndex].position) + Vector(0, -0.01, 0),
        direction = Vector(0, 1, 0),
        type = 1,
        max_distance = 1,
    })

    local challengeDiscard = nil
    for _, hit in pairs(hits) do
        if hit.hit_object.hasTag("Challenge") then
            challengeDiscard = hit.hit_object
            break
        end
    end

    if challengeDiscard then
        local shuffle = false
        if challengeDiscard.type == "Deck" then
            local objs = challengeDiscard.getObjects()
            shuffle = hasTag(objs[#objs], "Shuffle")
        elseif challengeDiscard.type == "Card" then
            if challengeDiscard.hasTag("Shuffle") then
                shuffle = true
            end
        end

        if shuffle then
            challenges.putObject(challengeDiscard)
            challenges.shuffle()
            printToAll("Reshuffling challenge deck since previous challenge had reshuffle icon", Color.White)
        end
    end

    local card
    if challenges.type == "Deck" then
        card = challenges.takeObject({position = sharedBoard.positionToWorld(snaps[challengeDiscardIndex].position) + Vector(0, 0.5, 0), rotation = Vector(0, 180, 0)})
    elseif challenges.type == "Card" then
        card = challenges
        challenges.setPositionSmooth(sharedBoard.positionToWorld(snaps[challengeDiscardIndex].position) + Vector(0, 0.5, 0))
        challenges.setRotationSmooth(Vector(0, 180, 0))
    end

    -- Wait a frame so card coming from deck can have values
    Wait.frames(function()
        UI.setAttribute("challenge", "visibility", "")
        UI.setAttribute("awareness", "text", card.getVar("awareness"))
        UI.setAttribute("spirit", "text", card.getVar("spirit"))
        UI.setAttribute("fitness", "text", card.getVar("fitness"))
        UI.setAttribute("focus", "text", card.getVar("focus"))
        local effect = card.getVar("effect")
        UI.setAttribute("effect", "text", effect)
        if effect == "Mountain" then
            UI.setAttribute("effectCell", "color", "#294574")
        elseif effect == "Crest" then
            UI.setAttribute("effectCell", "color", "#902329")
        elseif effect == "Sun" then
            UI.setAttribute("effectCell", "color", "#dc802b")
        end
    end, 1)
end

function StartTheDay(_)
    UI.setAttribute("playerButtons", "visibility", "")
    UI.setAttribute("partyButtons", "visibility", "")

    if campaign > 0 then
        broadcastToAll("Starting Day "..currentDay.." with "..currentWeather, Color.White)
    end

    for color, _ in pairs(playerBoards) do
        local aspect = getAspect(color)
        -- Assume if aspect exists then someone is playing the ranger to account for multihanded play
        if aspect then
            for energy, bag in pairs(energyBags) do
                local count = aspect.getVar(energy)
                for _ = 1, count do
                    bag.takeObject({position = aspect.getPosition() + energyOffsets[energy], rotation = Vector(0, 180, 0)})
                end
            end

            local deck = getRangerDeck(color)
            if not deck then
                broadcastToAll("Ranger Deck is empty for "..color, Color.Red)
            else
                local setup = {}
                for _, card in pairs(deck.getObjects()) do
                    if hasTag(card, "Setup") and not setup[card.name] then
                        setup[card.name] = card.guid
                    end
                end
                local options = 0
                for _, _ in pairs(setup) do
                    options = options + 1
                end

                if options > 1 then
                    Player[color].broadcast("Deck has multiple options for cards with Setup keyword, you'll need to pick one to put into play.", Color.Red)
                    for _, guid in pairs(setup) do
                        local card = deck.takeObject({guid = guid})
                        Wait.frames(function() deck.putObject(card) end, 3)
                    end
                    Wait.frames(function() deck.Container.search(color, options) end, 3)
                    deck.setLuaScript("function onSearchEnd(color) self.shuffle() self.deal(6, color) self.setLuaScript() self.reload() end")
                else
                    if options == 1 then
                        local name, guid = next(setup)
                        deck.takeObject({guid = guid, position = deck.getPosition() + Vector(0, 0, 3.9), rotation = Vector(0, 180, 0)})
                        Player[color].broadcast("Putting "..name.." into play via Setup keyword", Color.White)
                    end
                    deck.shuffle()
                    deck.deal(6, color)
                end
            end
        end
    end

    local snaps = sharedBoard.getSnapPoints()
    local hits = Physics.cast({
        origin = sharedBoard.positionToWorld(snaps[challengeIndex].position) + Vector(0, -0.01, 0),
        direction = Vector(0, 1, 0),
        type = 1,
        max_distance = 1,
    })

    local challenges = nil
    for _, hit in pairs(hits) do
        if hit.hit_object.hasTag("Challenge") then
            challenges = hit.hit_object
            break
        end
    end

    if not challenges then
        broadcastToAll("Unable to find challenge deck", Color.Red)
        return
    end

    hits = Physics.cast({
        origin = sharedBoard.positionToWorld(snaps[challengeDiscardIndex].position) + Vector(0, -0.01, 0),
        direction = Vector(0, 1, 0),
        type = 1,
        max_distance = 1,
    })

    local challengeDiscard = nil
    for _, hit in pairs(hits) do
        if hit.hit_object.hasTag("Challenge") then
            challengeDiscard = hit.hit_object
            break
        end
    end

    if challengeDiscard then
        challenges.putObject(challengeDiscard)
    end
    challenges.shuffle()

    for _, obj in pairs(weatherBox.getObjects()) do
        if obj.name == currentWeather then
            local weather = weatherBox.takeObject({guid = obj.guid, position = sharedBoard.positionToWorld(snaps[weatherIndex].position), rotation = Vector(0, 180, 0)})
            Wait.condition(function() setupTokens(nil, nil, weather) end, function() return not weather.isSmoothMoving() end)
            break
        end
    end

    if #getObjectsWithTag("Location") > 0 then
        campaignMap.call("Travel", {location = currentLocation, connection = campaignTracker.UI.getAttribute("terrain", "text"), skipLocationCard = true})
    end
end

function Refresh(_)
    for _, obj in pairs(getObjectsWithTag("Energy")) do
        if not obj.getLock() then
            obj.destruct()
        end
    end

    for color, playerBoard in pairs(playerBoards) do
        local aspect = getAspect(color)
        -- Assume if aspect exists then someone is playing the ranger to account for multihanded play
        if aspect then
            for energy, bag in pairs(energyBags) do
                local count = aspect.getVar(energy)
                for _ = 1, count do
                    bag.takeObject({position = aspect.getPosition() + energyOffsets[energy], rotation = Vector(0, 180, 0)})
                end
            end

            local role = getRole(color)
            if role then
                role.setRotationSmooth(Vector(0, 180, 0), false, true)
            end

            local deck = getRangerDeck(color)
            if not deck then
                broadcastToAll(color.." has run out of cards in Ranger Deck, the day ends immediately", Color.Red)
            else
                local currentInjury = getInjuryCount(color)
                local deckCount
                if deck.type == "Deck" then
                    deckCount = #deck.getObjects()
                else
                    deckCount = 1
                end
                -- We will also be drawing 1 card as well
                if currentInjury + 1 <= deckCount then
                    local snaps = playerBoard.getSnapPoints()

                    for _ = 1, currentInjury do
                        -- We should only ever have a deck here since a single card wouldn't be able to take fatigue and draw still
                        deck.takeObject({position = playerBoard.positionToWorld(snaps[fatigueIndex].position) + Vector(0, 0.5, 0), rotation = Vector(0, 90, 180)})
                    end

                    deck.deal(1, color)
                else
                    broadcastToAll(color.." has run out of cards in Ranger Deck, the day ends immediately", Color.Red)
                end
            end
        end
    end

    for _, rangerCard in pairs(getObjectsWithTag("Ranger")) do
        if not rangerCard.is_face_down and not rangerCard.isSmoothMoving() then
            rangerCard.setRotationSmooth(Vector(0, 180, 0), false, true)
        end
    end

    for _, pathCard in pairs(getObjectsWithTag("Path")) do
        if not pathCard.is_face_down then
            pathCard.setRotationSmooth(Vector(0, 180, 0), false, true)
        end
    end
end

function discardRangerCard(obj)
    local color = obj.getDescription()
    local playerBoard = playerBoards[color]
    local snaps = playerBoard.getSnapPoints()

    obj.use_hands = false
    obj.setPositionSmooth(playerBoard.positionToWorld(snaps[deckIndex].position) + Vector(0, 0.5, 0), false, true)
    obj.setRotationSmooth(Vector(0, 180, 180), false, true)
    Wait.frames(function() obj.use_hands = true end, 3)
end

function returnPathCards(pathSets)
    local pathBoxSets = {}
    for _, obj in pairs(pathBox.getObjects()) do
        if obj.description == "" then
            pathBoxSets[obj.name] = obj.guid
        else
            pathBoxSets[obj.description] = obj.guid
        end
    end

    for set, cards in pairs(pathSets) do
        local deck
        if pathBoxSets[set.." Set"] then
            deck = pathBox.takeObject({guid = pathBoxSets[set.." Set"]})
            for _, card in pairs(cards) do
                deck.putObject(card)
            end
        elseif pathBoxSets[set] then
            local card = pathBox.takeObject({guid = pathBoxSets[set]})
            table.insert(cards, card)
            deck = group(cards)[1]
            deck.setName(set.." Set")
        else
            deck = group(cards)[1]
            deck.setName(set.." Set")
        end
        pathBox.putObject(deck)
    end
end

function ClearPlayArea(_)
    local snaps = sharedBoard.getSnapPoints()
    local hits = Physics.cast({
        origin = sharedBoard.positionToWorld(snaps[pathDiscardIndex].position) + Vector(0, -0.01, 0),
        direction = Vector(0, 1, 0),
        type = 1,
        max_distance = 1,
    })
    local pathDiscard = nil
    for _, hit in pairs(hits) do
        if hit.hit_object.hasTag("Path") then
            pathDiscard = hit.hit_object
            break
        end
    end

    for _, obstacle in pairs(getObjectsWithTag("Obstacle")) do
        if obstacle.getRotation():equals(Vector(0, 180, 0)) and obstacle ~= pathDiscard then
            broadcastToAll("Detecting uncleared and unexhausted Obstacle \""..obstacle.getName().."\"", Color.Red)
            return
        end
    end

    for _, locationCard in pairs(getObjectsWithTag("Location")) do
        locationCard.setLock(false)
        locationCard.setRotation(Vector(0, 180, 0))
        locationBox.putObject(locationCard)
    end

    local attachments = false
    for _, rangerCard in pairs(getObjectsWithTag("Ranger")) do
        if rangerCard.getDescription() ~= "" then
            if not rangerCard.is_face_down then
                -- Faceup deck should be discard pile
                if rangerCard.type == "Card" then
                    -- Skip over cards in player hands
                    if not rangerCard.hasTag("Persistent") and not rangerCard.hasTag("Gear") and #rangerCard.getZones() == 0 then
                        if rangerCard.hasTag("Attachment") then
                            attachments = true
                        else
                            if #rangerCard.getAttachments() > 0 then
                                for _, attachment in pairs(rangerCard.removeAttachments()) do
                                    -- Only ranger cards should be attached to ranger cards
                                    discardRangerCard(attachment)
                                end
                            end
                            discardRangerCard(rangerCard)
                        end
                    end
                end
            end
        end
    end

    if attachments then
        broadcastToAll("Detecting unattached attachments, manual clean up required for them. In future make sure you use F6 tool and drag from attachment to the card it's attached to", Color.Red)
    end

    -- Only exclude this area if the Lure mission exists
    local capturedPrey = nil
    if getObjectFromGUID("cada94") then
        hits = Physics.cast({
            origin = sharedBoard.positionToWorld(snaps[capturedPreyIndex].position) + Vector(0, -0.01, 0),
            direction = Vector(0, 1, 0),
            type = 1,
            max_distance = 1,
        })
        for _, hit in pairs(hits) do
            if hit.hit_object.hasTag("Path") then
                capturedPrey = hit.hit_object
                break
            end
        end
    end

    local pathSets = {}
    for _, pathCard in pairs(getObjectsWithTag("Path")) do
        if not capturedPrey or pathCard.guid ~= capturedPrey.guid then
            if pathCard.type == "Deck" then
                local count = 1
                for _, data in pairs(pathCard.getObjects()) do
                    local description = data.description
                    if not pathSets[description] then
                        pathSets[description] = {}
                    end
                    if pathCard.remainder then
                        table.insert(pathSets[description], pathCard.remainder)
                    else
                        table.insert(pathSets[description], pathCard.takeObject({guid = data.guid, position = pathCard.getPosition() + Vector(count, 0, 0)}))
                    end
                    count = count + 1
                end
            elseif pathCard.type == "Card" then
                if not pathCard.is_face_down or (pathDiscard and pathCard.guid == pathDiscard.guid) then
                    attachments = pathCard.getAttachments()
                    local persistent = pathCard.hasTag("Persistent")
                    if #attachments > 0 then
                        for _, attachment in pairs(attachments) do
                            if hasTag(attachment, "Persistent") then
                                persistent = true
                                break
                            end
                        end
                    end

                    if not persistent then
                        if #attachments > 0 then
                            for _, attachment in pairs(pathCard.removeAttachments()) do
                                if attachment.hasTag("Ranger") then
                                    discardRangerCard(attachment)
                                elseif attachment.hasTag("Path") then
                                    local description = attachment.getDescription()
                                    if not pathSets[description] then
                                        pathSets[description] = {}
                                    end
                                    table.insert(pathSets[description], pathCard)
                                end
                            end
                        end

                        local description = pathCard.getDescription()
                        if not pathSets[description] then
                            pathSets[description] = {}
                        end
                        table.insert(pathSets[description], pathCard)
                    end
                end
            end
        end
    end

    Wait.frames(function()
        returnPathCards(pathSets)

        Wait.frames(function()
            for _, obj in pairs(getObjectsWithTag("Counter")) do
                hits = Physics.cast({
                    origin = obj.getPosition(),
                    direction = Vector(0, -1, 0),
                    type = 1,
                    max_distance = 0.4,
                })
                local found = false
                for _, hit in pairs(hits) do
                    if hit.hit_object.type == "Card" then
                        found = true
                        break
                    end
                end
                if not found then
                    obj.destruct()
                end
            end
        end, 2)
    end, 4)

    for color, rangerToken in pairs(rangerTokens) do
        local playerBoard = playerBoards[color]
        snaps = playerBoard.getSnapPoints()

        rangerToken.setPositionSmooth(playerBoard.positionToWorld(snaps[tokenIndex].position) + Vector(0, 0.5, 0), false, true)
        rangerToken.setRotationSmooth(Vector(0, 180, 0), false, true)
    end
end

function EndTheDay(_)
    for _, obj in pairs(getObjectsWithTag("Energy")) do
        obj.destruct()
    end

    for _, obj in pairs(getObjectsWithTag("Counter")) do
        obj.destruct()
    end

    -- Helping Hand missions don't persist from day to day
    local helpingHand = getObjectFromGUID("ebcf7e")
    if helpingHand then
        missionBox.putObject(helpingHand)
    end
    helpingHand = getObjectFromGUID("f67a50")
    if helpingHand then
        missionBox.putObject(helpingHand)
    end

    for _, weatherCard in pairs(getObjectsWithTag("Weather")) do
        weatherCard.setRotation(Vector(0, 180, 0))
        weatherBox.putObject(weatherCard)
    end

    for _, roleCard in pairs(getObjectsWithTag("Role")) do
        if roleCard.getDescription() ~= "" then
            if roleCard.type == "Card" then
                if #roleCard.getAttachments() > 0 then
                    for _, attachment in pairs(roleCard.removeAttachments()) do
                        -- Only ranger cards should be attached to role cards
                        discardRangerCard(attachment)
                    end
                end
            end
        end
    end

    for _, rangerCard in pairs(getObjectsWithTag("Ranger")) do
        if rangerCard.getDescription() ~= "" then
            if rangerCard.type == "Card" then
                if #rangerCard.getAttachments() > 0 then
                    for _, attachment in pairs(rangerCard.removeAttachments()) do
                        -- Only ranger cards should be attached to ranger cards
                        discardRangerCard(attachment)
                    end
                end
                discardRangerCard(rangerCard)
            end
        end
    end

    -- Put discard and fatigue stacks back into deck
    for _, playerBoard in pairs(playerBoards) do
        local snaps = playerBoard.getSnapPoints()

        local hits = Physics.cast({
            origin = playerBoard.positionToWorld(snaps[discardIndex].position) + Vector(0, -0.01, 0),
            direction = Vector(0, 1, 0),
            type = 1,
            max_distance = 1,
        })
        for _, hit in pairs(hits) do
            if hit.hit_object.hasTag("Ranger") then
                hit.hit_object.setPositionSmooth(playerBoard.positionToWorld(snaps[deckIndex].position) + Vector(0, 0.5, 0), false, true)
                hit.hit_object.setRotationSmooth(Vector(0, 180, 180), false, true)
                break
            end
        end

        hits = Physics.cast({
            origin = playerBoard.positionToWorld(snaps[fatigueIndex].position) + Vector(0, -0.01, 0),
            direction = Vector(0, 1, 0),
            type = 1,
            max_distance = 1,
        })
        for _, hit in pairs(hits) do
            if hit.hit_object.hasTag("Ranger") then
                hit.hit_object.setPositionSmooth(playerBoard.positionToWorld(snaps[deckIndex].position) + Vector(0, 0.5, 0), false, true)
                hit.hit_object.setRotationSmooth(Vector(0, 180, 180), false, true)
                break
            end
        end
    end

    -- Clean up remaining path cards
    local pathSets = {}
    for _, pathCard in pairs(getObjectsWithTag("Path")) do
        if pathCard.type == "Deck" then
            local count = 1
            for _, data in pairs(pathCard.getObjects()) do
                local description = data.description
                if not pathSets[description] then
                    pathSets[description] = {}
                end
                if pathCard.remainder then
                    table.insert(pathSets[description], pathCard.remainder)
                else
                    table.insert(pathSets[description], pathCard.takeObject({guid = data.guid, position = pathCard.getPosition() + Vector(count, 0, 0)}))
                end
                count = count + 1
            end
        elseif pathCard.type == "Card" then
            if #pathCard.getAttachments() > 0 then
                for _, attachment in pairs(pathCard.removeAttachments()) do
                    if attachment.hasTag("Ranger") then
                        discardRangerCard(attachment)
                    elseif attachment.hasTag("Path") then
                        local description = attachment.getDescription()
                        if not pathSets[description] then
                            pathSets[description] = {}
                        end
                        table.insert(pathSets[description], pathCard)
                    elseif attachment.guid == "ebcf7e" or attachment.guid == "f67a50" then
                        missionBox.putObject(attachment)
                    end
                end
            end

            local description = pathCard.getDescription()
            if not pathSets[description] then
                pathSets[description] = {}
            end
            table.insert(pathSets[description], pathCard)
        end
    end

    Wait.frames(function()
        returnPathCards(pathSets)
    end, 4)
end

function exportCampaign(_, _, _)
    if campaign <= 0 then
        broadcastToAll("You need to start campaign first before exporting it!", Color.Red)
        return
    end

    EndTheDay()
    Wait.time(function()
        local data = {players = {}, trash = {}, tracker = {missions = {}}}

        -- Exporting script state values
        data.currentLocation = currentLocation
        data.currentWeather = currentWeather
        data.currentDay = currentDay
        data.hardWeather = hardWeather
        data.showRewards = showRewards
        data.useUncommonWisdom = useUncommonWisdom
        data.campaign = campaign
        data.unlockedRewards = unlockedRewards
        data.missionProgress = missionProgress
        data.completedMissions = completedMissions

        for color,_ in pairs(playerBoards) do
            local player = {}
            local found = false
            local useUncommonWisdom = false

            local aspect = getAspect(color)
            if aspect then
                found = true
                player.awa = aspect.getVar("awareness")
                player.fit = aspect.getVar("fitness")
                player.foc = aspect.getVar("focus")
                player.spi = aspect.getVar("spirit")
            end

            local role = getRole(color)
            if role then
                found = true
                player.role = role.getVar("id")
                if role.getStateId() == 2 then
                    useUncommonWisdom = true
                end
            end

            local deck = getRangerDeck(color)
            if deck then
                found = true
                player.slots = {}
                for _, card in pairs(deck.getData().ContainedObjects) do
                    if card.States and card.States[1] then
                        useUncommonWisdom = true
                    end
                    local _, finish = card.LuaScript:find("id = \"")
                    local id = card.LuaScript:sub(finish + 1, finish + 5)
                    if player.slots[id] then
                        player.slots[id] = player.slots[id] + 1
                    else
                        player.slots[id] = 1
                    end
                end
            end

            local objs = sideboards[color].getObjects()
            if #objs > 0 then
                found = true
                player.sideboard = {}
                for _, card in pairs(sideboards[color].getData().ContainedObjects) do
                    if card.States and card.States[1] then
                        useUncommonWisdom = true
                    end
                    local _, finish = card.LuaScript:find("id = \"")
                    if finish then
                        local id = card.LuaScript:sub(finish + 1, finish + 5)
                        if player.sideboard[id] then
                            player.sideboard[id] = player.sideboard[id] + 1
                        else
                            player.sideboard[id] = 1
                        end
                    end
                end
            end

            if found then
                player.color = color
                player.useUncommonWisdom = useUncommonWisdom
                table.insert(data.players, player)
            end
        end

        for _, obj in pairs(trash.getObjects()) do
            table.insert(data.trash, obj.name)
        end

        data.tracker.rangers = campaignTracker.UI.getAttribute("rangers", "text")
        data.tracker.events1 = campaignTracker.UI.getAttribute("events1", "text")
        data.tracker.events2 = campaignTracker.UI.getAttribute("events2", "text")
        data.tracker.connection = campaignTracker.UI.getAttribute("terrain", "text")
        for i = 1, 33 do
            local name = campaignTracker.UI.getAttribute("mission"..i, "text")
            if name ~= " " then
                table.insert(data.tracker.missions, {name = name, day = campaignTracker.UI.getAttribute("mission"..i.."Day", "text")})
            end
        end
        for i = 1, 30 do
            for j = 1, 3 do
                local name = campaignTracker.UI.getAttribute("day"..i.."-"..j, "text")
                if name and name ~= " " then
                    table.insert(data.tracker.days, {name = name, day = i.."-"..j})
                end
            end
        end

        for _,tab in pairs(Notes.getNotebookTabs()) do
            if tab.title == "Campaign" then
                Notes.editNotebookTab({
                    index = tab.index,
                    body = JSON.encode_pretty(data),
                })
                broadcastToAll("Notebook Tab \"Campaign\" has been updated", Color.White)
                break
            end
        end
    end, 1)
end
