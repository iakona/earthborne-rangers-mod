---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Whimsical.
--- DateTime: 2021-03-16 3:26 p.m.
---

--- Original Memory Bag by MrStump
--- https://steamcommunity.com/sharedfiles/filedetails/?id=953770080

---@class MemoryListEntry
---@field public position Vector
---@field public rotation Vector
---@field public lock boolean
--local MemoryListEntry={}

---@type table<string, MemoryListEntry>
local memory_list = {}

local POSTFIX = {
    SAVE = "_memory_object",
    ZONE = "_memory_zone",
    SHUFFLE = "_memory_shuffle"
}

---@type table<string, any>
local BUTTON = {
    POSITION = Vector(0, 0, -5),
    ROTATION = Vector(0, 180, 0),
    HEIGHT = 1200,
    WIDTH = 2800,
    FONT_SIZE = 800,
    COLOR = Color.Black,
    FONT_COLOR = Color.White
}

local ipairs = ipairs
local pairs = pairs

---@return string
local function get_prefix()
    return self:getDescription()
end

local function updateSave()
    local data_to_save = {["ml"]=memory_list}
    local saved_data = JSON.encode(data_to_save)
    self.script_state = saved_data
end

---@param label string
---@param action string
local function createButton(label, action)
    self:clearButtons()

    ---@type CreateClassicUIButton
    local parameters = {
        label = label,
        click_function = action,
        function_owner = self
    }

    for key, value in pairs(BUTTON) do
        parameters[key:lower()] = value
    end

    self:createButton(parameters)
end

function create_place_button() createButton("Place", "place_objects") end
local function create_recall_button() createButton("Recall", "recall_objects") end

---@param tag string
---@param lock boolean
---@return fun(object:TTSObject)
local function create_object_callback(tag, lock)
    ---@param object TTSObject
    return function (object)
        object:setLock(lock)
        if object:hasTag(tag) then object:shuffle() end
    end
end

---@param object TTSObject
local function record_objects(object)
    memory_list[object:getGUID()] = {
        position = object:getPosition(),
        rotation = object:getRotation(),
        lock = object:getLock()
    }
    self:putObject(object)
end

---@param objects TTSObject[]
local function update_objects(objects)
    for _, object in ipairs(objects) do
        record_objects(object)
    end
end

--Sends objects from bag/table to their saved position/rotation
function place_objects()
    local prefix = get_prefix()
    local shuffle_tag = prefix .. POSTFIX.SHUFFLE
    local content = self.getObjects()

    for _, item in ipairs(content) do
        local entry = memory_list[item.guid]
        if entry then
            self.takeObject {
                guid=item.guid,
                position=entry.position,
                rotation=entry.rotation,
                callback_function = create_object_callback(shuffle_tag, entry.lock)
            }
        end
    end

    broadcastToAll(self.getName().." Placed", {1,1,1})
    for _, box in pairs(Global.getTable("recallBoxes")) do
        if box ~= self then
            box.clearButtons()
        end
    end
    create_recall_button()
end

--Recalls objects to bag from table
function recall_objects()
    memory_list = {}
    local prefix = get_prefix()

    if prefix=="" then
        broadcastToAll("Error in Memory Bag: Tag prefix not set.")
        return
    end

    local save_tag = prefix .. POSTFIX.SAVE
    local zone_tag = prefix .. POSTFIX.ZONE

    local zones = getObjectsWithTag(zone_tag)
    if #zones>0 then
        for _, zone in ipairs(zones) do
            update_objects(zone:getObjects())
        end
    else
        update_objects(getObjectsWithTag(save_tag))
    end
    updateSave()
    broadcastToAll(self.getName().." Recalled", {1,1,1})
    for _, box in pairs(Global.getTable("recallBoxes")) do
        if box ~= self then
            box.call('create_place_button')
        end
    end
    create_place_button()
end

function onload(saved_data)
    if saved_data ~= "" then
        local loaded_data = JSON.decode(saved_data)
        --Set up information off of loaded_data
        memory_list = loaded_data.ml
    else
        --Set up information for if there is no saved saved data
        memory_list = {}
    end

    if self:getQuantity()==0 then
        create_recall_button()
    else
        create_place_button()
    end

    self.UI.setAttribute("input", "tooltip", "Enter RangersDB\ndeck id to import")
end

function importDeck(player, input)
    if input == "" then
        return
    end

    local playerBoards = Global.getTable("playerBoards")
    if not playerBoards[player.color] then
        return
    end

    local url = "https://gapi.rangersdb.com/v1/graphql"
    local bodyData = {
        operationName = "getDeck",
        variables = {
            deckId = input,
        },
        query = "query getDeck($deckId: Int!) { deck: rangers_deck_by_pk(id: $deckId) { name taboo_set_id awa fit foc spi meta slots user { handle } } }",
    }
    local body = JSON.encode(bodyData)
    WebRequest.custom(url, "POST", true, body, {}, function(response)
        local json = JSON.decode(response.text)
        if json.errors then
            player.broadcast("Recieved error from RangersDB website, please try again later", Color.Red)
        elseif not json.data or not json.data.deck then
            player.broadcast("No RangersDB deck found for "..input, Color.Red)
        else
            local deck = json.data.deck
            local importString = "Importing "..deck.name
            if deck.user.handle then
                importString = importString.." by "..deck.user.handle
            end
            player.broadcast(importString, Color.White)
            ImportDeck({color = player.color, useUncommonWisdom = deck.taboo_set_id == "set_01", awa = deck.awa, fit = deck.fit, foc = deck.foc, spi = deck.spi, role = deck.meta.role, slots = deck.slots})
            self.UI.setAttribute("input", "text", "")
        end
    end)
end
function ImportDeck(params)
    Global.call("ClearPlayerDeck", {color = params.color})

    -- Waiting 1 frame to make sure previous player deck is cleared out
    Wait.frames(function()
        local recallBoxes = Global.getTable("recallBoxes")

        local aspectBox = recallBoxes[1]
        local aspects = aspectBox.getObjects()
        local found = false
        if #aspects == 0 then
            aspects = getObjectsWithTag("Aspect")
            for _, aspect in pairs(aspects) do
                -- Description means it was picked by a player
                if aspect.getDescription() == "" then
                    if aspect.getVar("awareness") == params.awa and aspect.getVar("fitness") == params.fit and aspect.getVar("focus") == params.foc and aspect.getVar("spirit") == params.spi then
                        Global.call("PickAspect", {color = params.color, aspect = aspect})
                        found = true
                        break
                    end
                end
            end
        else
            local aspectScript = "awareness = "..params.awa.."\nfitness = "..params.fit.."\nfocus = "..params.foc.."\nspirit = "..params.spi
            for _, data in pairs(aspects) do
                if data.lua_script == aspectScript then
                    local aspect = aspectBox.takeObject({guid = data.guid})
                    Global.call("PickAspect", {color = params.color, aspect = aspect})
                    Wait.frames(function() aspectBox.putObject(aspect) end, 3)
                    found = true
                    break
                end
            end
        end
        if not found then
            Player[params.color].broadcast("Unable to find aspect with AWA "..params.awa.." FIT "..params.fit.." FOC "..params.foc.." SPI "..params.spi, Color.Red)
        end

        local roleBox = recallBoxes[4]
        local roles = roleBox.getObjects()
        found = false
        if #roles == 0 then
            roles = getObjectsWithTag("Role")
            for _, role in pairs(roles) do
                -- Description means it was picked by a player
                if role.getDescription() == "" then
                    if role.getVar("id") == params.role then
                        Global.call("PickRole", {color = params.color, role = role, useUncommonWisdom = params.useUncommonWisdom})
                        found = true
                        break
                    end
                end
            end
        else
            local roleScript = "id = \""..params.role.."\""
            for _, data in pairs(roles) do
                if data.lua_script == roleScript then
                    local role = roleBox.takeObject({guid = data.guid})
                    Global.call("PickRole", {color = params.color, role = role, useUncommonWisdom = params.useUncommonWisdom})
                    Wait.frames(function() roleBox.putObject(role) end, 3)
                    found = true
                    break
                end
            end
        end
        if not found then
            Player[params.color].broadcast("Unable to find role with id "..params.role, Color.Red)
        end

        -- Waiting 1 frame to make sure aspect values can be queried
        Wait.frames(function()
            local personalityBox = recallBoxes[2]
            local backgroundBox = recallBoxes[3]
            local specialtyBox = recallBoxes[4]
            local rewardBox = recallBoxes[5]
            local maladyBox = Global.getVar("maladiesBox")
            local function getBox(id)
                local num = tonumber(id)
                if num >= 1093 and num <= 1108 then
                    return personalityBox
                elseif num >= 1001 and num <= 1036 then
                    return backgroundBox
                elseif num >= 1037 and num <= 1092 then
                    return specialtyBox
                elseif num >= 1201 and num <= 1231 then
                    return rewardBox
                elseif num == 1240 then
                    return maladyBox
                else
                    Player[params.color].broadcast("Unable to find ranger card id "..id.." is out of range of any known mapping", Color.Red)
                    return nil
                end
            end

            local count = 1
            for id, quantity in pairs(params.slots) do
                local box = getBox(id)
                if box then
                    local rangers = box.getObjects()
                    found = false
                    if #rangers == 0 then
                        rangers = getObjectsWithTag("Ranger")
                        for _, ranger in pairs(rangers) do
                            -- Description means it was picked by a player
                            if ranger.getDescription() == "" then
                                if ranger.getVar("id") == id then
                                    Global.call("PickRanger", {color = params.color, ranger = ranger, useUncommonWisdom = params.useUncommonWisdom, quantity = quantity, offset = Vector(0, 0.1 * count, 0)})
                                    count = count + 1
                                    found = true
                                    break
                                end
                            end
                        end
                    else
                        local rangerScript = "id = \""..id.."\""
                        for _, data in pairs(rangers) do
                            if data.lua_script:find(rangerScript) then
                                local ranger = box.takeObject({guid = data.guid})
                                -- Need to store off count so the delayed PickRanger call will still have the proper value
                                local cachedCount = count
                                -- Adding delay here so we can query for info about the card
                                Wait.frames(function() Global.call("PickRanger", {color = params.color, ranger = ranger, useUncommonWisdom = params.useUncommonWisdom, quantity = quantity, offset = Vector(0, 0.1 * cachedCount, 0)}) end, 1)
                                Wait.frames(function() box.putObject(ranger) end, 3)
                                count = count + 1
                                found = true
                                break
                            end
                        end
                    end
                    if not found then
                        Player[params.color].broadcast("Unable to find ranger card with id "..id, Color.Red)
                    end
                end
            end

            -- We need to wait for the ranger cards to go back into the box before we try grabbing them
            if params.sideboard then
                Wait.frames(function()
                    for id, quantity in pairs(params.sideboard) do
                        local box = getBox(id)
                        if box then
                            local rangers = box.getObjects()
                            found = false
                            if #rangers == 0 then
                                rangers = getObjectsWithTag("Ranger")
                                for _, ranger in pairs(rangers) do
                                    -- Description means it was picked by a player
                                    if ranger.getDescription() == "" then
                                        if ranger.getVar("id") == id then
                                            Global.call("PickRanger", {color = params.color, ranger = ranger, useUncommonWisdom = params.useUncommonWisdom, quantity = quantity, sideboard = true})
                                            found = true
                                            break
                                        end
                                    end
                                end
                            else
                                local rangerScript = "id = \""..id.."\""
                                for _, data in pairs(rangers) do
                                    if data.lua_script:find(rangerScript) then
                                        local ranger = box.takeObject({guid = data.guid})
                                        -- Adding delay here so we can query for info about the card
                                        Wait.frames(function() Global.call("PickRanger", {color = params.color, ranger = ranger, useUncommonWisdom = params.useUncommonWisdom, quantity = quantity, sideboard = true}) end, 1)
                                        Wait.frames(function() box.putObject(ranger) end, 3)
                                        found = true
                                        break
                                    end
                                end
                            end
                            if not found then
                                Player[params.color].broadcast("Unable to find ranger card with id "..id, Color.Red)
                            end
                        end
                    end
                end, 3)
            end
        end, 1)
    end, 1)
end
