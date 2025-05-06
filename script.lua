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

campaignTracker = "f0d81f"
valleyMap = "8b7726"

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

-- Save State Data
currentLocation = ""
currentWeather = "A Perfect Day"
currentDay = 1
hardWeather = false
showRewards = false
prologue = false
campaign = false
unlockedRewards = {}
missionProgress = {}

function onSave()
    local data = {
        currentLocation = currentLocation,
        currentWeather = currentWeather,
        currentDay = currentDay,
        hardWeather = hardWeather,
        showRewards = showRewards,
        prologue = prologue,
        campaign = campaign,
        unlockedRewards = unlockedRewards,
        missionProgress = missionProgress,
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
    campaignTracker = getObjectFromGUID(campaignTracker)
    valleyMap = getObjectFromGUID(valleyMap)
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
        prologue = jsonData.prologue
        campaign = jsonData.campaign
        unlockedRewards = jsonData.unlockedRewards
        missionProgress = jsonData.missionProgress
    end

    if Player["White"].seated and not Player["Red"].seated then
        Player["White"].changeColor("Red")
    end
end
function onObjectSpawn(obj)
    addContextMenuItems(obj)
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
            if #obj.getAttachments() > 0 then
                obj.addContextMenuItem("Remove Attachment", removeAttachment, false)
            end
            if obj.hasTag("Ranger") then
                obj.addContextMenuItem("Remove Card", removeCard, false)
            end
        end
    elseif obj.type == "Deck" then
        if obj.hasTag("Prebuilt") then
            obj.addContextMenuItem("Pick Deck", pickDeck, false)
        end
    end
end

function RecordMission(params)
    recordMission(nil, nil, params.mission)
end
function recordMission(_, _, obj)
    local missions = campaignTracker.getTable("missions")
    for _, data in pairs(missions) do
        local name = getObjectFromGUID(data.name)
        if name.getValue() == " " then
            local missionName
            if obj.is_face_down then
                local back = obj.getVar("back")
                if back then
                    missionName = back
                else
                    missionName = obj.getVar("front")
                end
            else
                missionName = obj.getVar("front")
            end
            name.setValue(missionName)
            getObjectFromGUID(data.day).setValue(tostring(currentDay))
            break
        end
    end
end
function PickAspect(params)
    pickAspect(params.color, _, params.aspect)
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
    pickRole(params.color, _, params.role)
end
function pickRole(color, _, obj)
    if not playerBoards[color] then
        return
    end

    local role = getRole(color)
    if role then
        role.destruct()
        Player[color].broadcast("You already have a role, replacing the old one")
    end

    local playerBoard = playerBoards[color]
    local snaps = playerBoard.getSnapPoints()

    local newRole = obj.clone()
    newRole.setPosition(playerBoard.positionToWorld(snaps[roleIndex].position) + Vector(0, 0.01, 0))
    newRole.setLock(false)
    newRole.setDescription(color)
end
function PickRanger(params)
    if not playerBoards[params.color] then
        return
    end

    local playerBoard = playerBoards[params.color]
    local snaps = playerBoard.getSnapPoints()

    for _ = 1, params.quantity do
        local newRanger = params.ranger.clone()
        newRanger.setPosition(playerBoard.positionToWorld(snaps[deckIndex].position) + params.offset)
        newRanger.setRotation(Vector(0, 180, 180))
        newRanger.setLock(false)
        newRanger.setDescription(params.color)
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
        local rewardGUIDs = {"b5ebd3", "b0f97f", "c4ffae"}
        for index, rewardGUID in pairs(rewardGUIDs) do
            local rewards = getObjectFromGUID(rewardGUID)
            local text = rewards.getValue()
            if text == " " then
                rewards.setValue(params.reward)
                break
            else
                local _, count = text:gsub("\n", "")
                if count < 10 or (index == 1 and count == 10) then
                    rewards.setValue(text.."\n"..params.reward)
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
function removeCard(_, _, obj)
    obj.destruct()
end
function pickDeck(color, _, obj)
    if not playerBoards[color] then
        return
    end

    obj.removeTag("Prebuilt")
    obj.clearContextMenu()

    local role = getRole(color)
    if role then
        role.destruct()
        Player[color].broadcast("You already have a role, replacing the old one")
    end
    local aspect = getAspect(color)
    if aspect then
        aspect.destruct()
        Player[color].broadcast("You already have an aspect, replacing the old one")
    end
    local deck = getRangerDeck(color)
    if deck then
        deck.destruct()
        Player[color].broadcast("You already have a ranger deck, replacing the old one")
    end

    local playerBoard = playerBoards[color]
    local snaps = playerBoard.getSnapPoints()

    role = obj.takeObject()
    role.setPosition(playerBoard.positionToWorld(snaps[roleIndex].position) + Vector(0, 0.01, 0))
    role.setDescription(color)

    aspect = obj.takeObject()
    aspect.setPosition(playerBoard.positionToWorld(snaps[aspectIndex].position) + Vector(0, 0.01, 0))
    aspect.setLock(true)
    aspect.setDescription(color)

    for _, data in pairs(obj.getObjects()) do
        local card
        if obj.remainder then
            card = obj.remainder
        else
            card = obj.takeObject({guid = data.guid})
        end
        card.setPosition(playerBoard.positionToWorld(snaps[deckIndex].position) + Vector(0, 0.5, 0))
        card.setRotation(Vector(0, 180, 180))
        card.setDescription(color)
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
        local offset = -0.1
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

function DrawRanger(player)
    local deck = getRangerDeck(player.color)
    if not deck then
        broadcastToAll(player.color.." has run out of cards in Ranger Deck, the day ends immediately", Color.Red)
        return
    end

    deck.deal(1, player.color)
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
        broadcastToAll(player.color.." now has "..currentInjury.. " injuries, you must now end the day after this turn", Color.Red)
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

    if challenges.type == "Deck" then
        challenges.takeObject({position = sharedBoard.positionToWorld(snaps[challengeDiscardIndex].position) + Vector(0, 0.5, 0), rotation = Vector(0, 180, 0)})
    elseif challenges.type == "Card" then
        challenges.setPositionSmooth(sharedBoard.positionToWorld(snaps[challengeDiscardIndex].position) + Vector(0, 0.5, 0))
        challenges.setRotationSmooth(Vector(0, 180, 0))
    end
end

function StartTheDay(_)
    if not prologue then
        broadcastToAll("Starting Day "..currentDay.." with "..currentWeather, Color.White)
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

            local deck = getRangerDeck(color)
            if not deck then
                broadcastToAll("Ranger Deck is empty for "..color, Color.Red)
            else
                deck.shuffle()
                deck.deal(6, color)
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
            weatherBox.takeObject({guid = obj.guid, position = sharedBoard.positionToWorld(snaps[weatherIndex].position), rotation = Vector(0, 180, 0)})
            break
        end
    end

    if #getObjectsWithTag("Location") > 0 then
        valleyMap.call("Travel", {location = currentLocation, connection = getObjectFromGUID("0b7329").getValue(), skipLocationCard = true})
    end
end

function Refresh(_)
    for _, obj in pairs(getObjectsWithTag("Energy")) do
        obj.destruct()
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
        if not rangerCard.is_face_down then
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

    obj.setPositionSmooth(playerBoard.positionToWorld(snaps[deckIndex].position) + Vector(0, 0.5, 0), false, true)
    obj.setRotationSmooth(Vector(0, 180, 180), false, true)
end

function ClearPlayArea(_)
    if getObjectFromGUID("ebcf7e") or getObjectFromGUID("f67a50") then
        -- TODO: properly handle the helping hand adding persistent
        broadcastToAll("Detecting Helping Hand Mission, you'll need to manually clean up play area", Color.Red)
        return
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
            if not pathCard.is_face_down or (pathDiscard and pathCard.guid == pathDiscard.guid) then
                local attachments = pathCard.getAttachments()
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

    Wait.frames(function()
        local pathBoxSets = {}
        for _, obj in pairs(pathBox.getObjects()) do
            pathBoxSets[obj.name] = obj.guid
        end

        for set, cards in pairs(pathSets) do
            local deck
            if pathBoxSets[set.." Set"] then
                deck = pathBox.takeObject({guid = pathBoxSets[set.." Set"]})
                for _, card in pairs(cards) do
                    deck.putObject(card)
                end
            else
                deck = group(cards)[1]
                deck.setName(set.." Set")
            end
            pathBox.putObject(deck)
        end

        Wait.frames(function()
            for _, obj in pairs(getObjectsWithTag("Counter")) do
                hits = Physics.cast({
                    origin = obj.getPosition(),
                    direction = Vector(0, -1, 0),
                    type = 1,
                    max_distance = 0.1,
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
        local snaps = playerBoard.getSnapPoints()

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
    for color, playerBoard in pairs(playerBoards) do
        local playerBoard = playerBoards[color]
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
        local pathBoxSets = {}
        for _, obj in pairs(pathBox.getObjects()) do
            pathBoxSets[obj.name] = obj.guid
        end

        for set, cards in pairs(pathSets) do
            local deck
            if pathBoxSets[set.." Set"] then
                deck = pathBox.takeObject({guid = pathBoxSets[set.." Set"]})
                for _, card in pairs(cards) do
                    deck.putObject(card)
                end
            else
                deck = group(cards)[1]
                deck.setName(set.." Set")
            end
            pathBox.putObject(deck)
        end
    end, 4)
end
