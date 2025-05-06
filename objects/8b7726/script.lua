pivotalLocations = {
    ["Branch"] = true,
    ["Lone Tree Station"] = true,
    ["Marsh of Rebirth"] = true,
    ["Meadow"] = true,
    ["Northern Outpost"] = true,
    ["Spire"] = true,
    ["The Fractured Wall"] = true,
    ["Tumbledown"] = true,
    ["White Sky"] = true,
}

function onLoad(_)
    -- Pivotal Locations
    self.createButton({
        click_function = "Branch",
        function_owner = self,
        position       = Vector(0.257, 0, -0.148),
        width          = 30,
        height         = 30,
        tooltip        = "Branch",
    })
    self.createButton({
        click_function = "LoneTreeStation",
        function_owner = self,
        position       = Vector(-0.318, 0, -0.666),
        width          = 30,
        height         = 30,
        tooltip        = "Lone Tree Station",
    })
    self.createButton({
        click_function = "MarshofRebirth",
        function_owner = self,
        position       = Vector(0.242, 0, 0.5),
        width          = 30,
        height         = 30,
        tooltip        = "Marsh of Rebirth",
    })
    self.createButton({
        click_function = "Meadow",
        function_owner = self,
        position       = Vector(-0.181, 0, 0.223),
        width          = 30,
        height         = 30,
        tooltip        = "Meadow",
    })
    self.createButton({
        click_function = "NorthernOutpost",
        function_owner = self,
        position       = Vector(0.133, 0, -0.893),
        width          = 30,
        height         = 30,
        tooltip        = "Northern Outpost",
    })
    self.createButton({
        click_function = "Spire",
        function_owner = self,
        position       = Vector(-0.069, 0, -0.236),
        width          = 30,
        height         = 30,
        tooltip        = "Spire",
    })
    self.createButton({
        click_function = "TheFracturedWall",
        function_owner = self,
        position       = Vector(0.448, 0, -0.453),
        width          = 30,
        height         = 30,
        tooltip        = "The Fractured Wall",
    })
    self.createButton({
        click_function = "Tumbledown",
        function_owner = self,
        position       = Vector(-0.065, 0, 0.859),
        width          = 30,
        height         = 30,
        tooltip        = "Tumbledown",
    })
    self.createButton({
        click_function = "WhiteSky",
        function_owner = self,
        position       = Vector(0.011, 0, -0.565),
        width          = 30,
        height         = 30,
        tooltip        = "White Sky",
    })

    -- Non-Pivotal Locations
    self.createButton({
        click_function = "AncestorsGrove",
        function_owner = self,
        position       = Vector(-0.488, 0, -0.423),
        width          = 30,
        height         = 30,
        tooltip        = "Ancestor's Grove",
    })
    self.createButton({
        click_function = "ArchaeologicalOutpost",
        function_owner = self,
        position       = Vector(-0.428, 0, 0.492),
        width          = 30,
        height         = 30,
        tooltip        = "Archaeological Outpost",
    })
    self.createButton({
        click_function = "AtroxMountain",
        function_owner = self,
        position       = Vector(-0.102, 0, -0.841),
        width          = 30,
        height         = 30,
        tooltip        = "Atrox Mountain",
    })
    self.createButton({
        click_function = "BiologicalOutpost",
        function_owner = self,
        position       = Vector(0.292, 0, 0.017),
        width          = 30,
        height         = 30,
        tooltip        = "Biological Outpost",
    })
    self.createButton({
        click_function = "BoulderField",
        function_owner = self,
        position       = Vector(-0.23, 0, -0.492),
        width          = 30,
        height         = 30,
        tooltip        = "Boulder Field",
    })
    self.createButton({
        click_function = "BowloftheSun",
        function_owner = self,
        position       = Vector(0.055, 0, 0.653),
        width          = 30,
        height         = 30,
        tooltip        = "Bowl of the Sun",
    })
    self.createButton({
        click_function = "CrossroadsStation",
        function_owner = self,
        position       = Vector(0.081, 0, -0.134),
        width          = 30,
        height         = 30,
        tooltip        = "Crossroads Station",
    })
    self.createButton({
        click_function = "GoldenShore",
        function_owner = self,
        position       = Vector(0.079, 0, -0.761),
        width          = 30,
        height         = 30,
        tooltip        = "Golden Shore",
    })
    self.createButton({
        click_function = "GreenbriarKnoll",
        function_owner = self,
        position       = Vector(-0.166, 0, -0.007),
        width          = 30,
        height         = 30,
        tooltip        = "Greenbriar Knoll",
    })
    self.createButton({
        click_function = "HeadwatersStation",
        function_owner = self,
        position       = Vector(-0.36, 0, -0.141),
        width          = 30,
        height         = 30,
        tooltip        = "Headwaters Station",
    })
    self.createButton({
        click_function = "KobosMarket",
        function_owner = self,
        position       = Vector(-0.352, 0, -0.287),
        width          = 30,
        height         = 30,
        tooltip        = "Kobo's Market",
    })
    self.createButton({
        click_function = "MichaelsBog",
        function_owner = self,
        position       = Vector(0.24, 0, 0.358),
        width          = 30,
        height         = 30,
        tooltip        = "Michael's Bog",
    })
    self.createButton({
        click_function = "MountNim",
        function_owner = self,
        position       = Vector(0.318, 0, -0.63),
        width          = 30,
        height         = 30,
        tooltip        = "Mount Nim",
    })
    self.createButton({
        click_function = "MoundoftheNavigator",
        function_owner = self,
        position       = Vector(0.255, 0, 0.201),
        width          = 30,
        height         = 30,
        tooltip        = "Mound of the Navigator",
    })
    self.createButton({
        click_function = "RingsoftheMoon",
        function_owner = self,
        position       = Vector(-0.275, 0, 0.445),
        width          = 30,
        height         = 30,
        tooltip        = "Rings of the Moon",
    })
    self.createButton({
        click_function = "StoneweaverBridge",
        function_owner = self,
        position       = Vector(0.07, 0, 0.23),
        width          = 30,
        height         = 30,
        tooltip        = "Stoneweaver Bridge",
    })
    self.createButton({
        click_function = "SunkenOutpost",
        function_owner = self,
        position       = Vector(0.327, 0, 0.597),
        width          = 30,
        height         = 30,
        tooltip        = "Sunken Outpost",
    })
    self.createButton({
        click_function = "Terravore",
        function_owner = self,
        position       = Vector(0.469, 0, 0.073),
        width          = 30,
        height         = 30,
        tooltip        = "Terravore",
    })
    self.createButton({
        click_function = "TheAlluvialRuins",
        function_owner = self,
        position       = Vector(-0.122, 0, 0.6),
        width          = 30,
        height         = 30,
        tooltip        = "The Alluvial Ruins",
    })
    self.createButton({
        click_function = "TheConcordantZiggurats",
        function_owner = self,
        position       = Vector(-0.464, 0, 0.224),
        width          = 30,
        height         = 30,
        tooltip        = "The Concordant Ziggurats",
    })
    self.createButton({
        click_function = "TheCypressCitadel",
        function_owner = self,
        position       = Vector(0.369, 0, 0.446),
        width          = 30,
        height         = 30,
        tooltip        = "The Cypress Citadel",
    })
    self.createButton({
        click_function = "TheFrowningGate",
        function_owner = self,
        position       = Vector(0.141, 0, 0.539),
        width          = 30,
        height         = 30,
        tooltip        = "The Frowning Gate",
    })
    self.createButton({
        click_function = "TheFurrow",
        function_owner = self,
        position       = Vector(0.546, 0, -0.133),
        width          = 30,
        height         = 30,
        tooltip        = "The Furrow",
    })
    self.createButton({
        click_function = "TheGreenbridge",
        function_owner = self,
        position       = Vector(0.347, 0, 0.347),
        width          = 30,
        height         = 30,
        tooltip        = "The Greenbridge",
    })
    self.createButton({
        click_function = "TheHighBasin",
        function_owner = self,
        position       = Vector(0.394, 0, -0.242),
        width          = 30,
        height         = 30,
        tooltip        = "The High Basin",
    })
    self.createButton({
        click_function = "ThePhilosophersGarden",
        function_owner = self,
        position       = Vector(0.178, 0, -0.312),
        width          = 30,
        height         = 30,
        tooltip        = "The Philosopher's Garden",
    })
    self.createButton({
        click_function = "ThePlummet",
        function_owner = self,
        position       = Vector(-0.59, 0, -0.111),
        width          = 30,
        height         = 30,
        tooltip        = "The Plummet",
    })
    self.createButton({
        click_function = "WatchersRock",
        function_owner = self,
        position       = Vector(-0.318, 0, 0.845),
        width          = 30,
        height         = 30,
        tooltip        = "Watcher's Rock",
    })
end

function Branch(_, _, alt_click)
    local location = "Branch"
    local connections = {
        ["Crossroads Station"] = "Old-Growth",
        ["The High Basin"] = "Old-Growth",
        ["The Philosopher's Garden"] = "Old-Growth",
    }
    travel(location, connections, alt_click)
end
function LoneTreeStation(_, _, alt_click)
    local location = "Lone Tree Station"
    local connections = {
        ["Ancestor's Grove"] = "Old-Growth",
        ["Atrox Mountain"] = "Mountain Pass",
        ["Boulder Field"] = "Woods",
    }
    travel(location, connections, alt_click)
end
function MarshofRebirth(_, _, alt_click)
    local location = "Marsh of Rebirth"
    local connections = {
        ["Michael's Bog"] = "Swamp",
        ["Mound of the Navigator"] = "Swamp",
        ["Sunken Outpost"] = "Swamp",
        ["The Cypress Citadel"] = "Swamp",
        ["The Frowning Grate"] = "Swamp",
        ["The Greenbridge"] = "Swamp",
    }
    travel(location, connections, alt_click)
end
function Meadow(_, _, alt_click)
    local location = "Meadow"
    local connections = {
        ["Greenbriar Knoll"] = "Grassland",
        ["Rings of the Moon"] = "Ravine",
        ["Stoneweaver Bridge"] = "Grassland",
        ["The Concordant Ziggurats"] = "Grassland",
    }
    travel(location, connections, alt_click)
end
function NorthernOutpost(_, _, alt_click)
    local location = "Northern Outpost"
    local connections = {
        ["Atrox Mountain"] = "Woods",
        ["Golden Shore"] = "Woods",
        ["Mount Nim"] = "Mountain Pass",
    }
    travel(location, connections, alt_click)
end
function Spire(_, _, alt_click)
    local location = "Spire"
    local connections = {
        ["Crossroads Station"] = "Grassland",
        ["Greenbriar Knoll"] = "Woods",
        ["Kobo's Market"] = "Lakeshore",
        ["Stoneweaver Bridge"] = "River",
        ["The Philosopher's Garden"] = "Old-Growth",
        ["White Sky"] = "River",
    }
    travel(location, connections, alt_click)
end
function TheFracturedWall(_, _, alt_click)
    local location = "The Fractured Wall"
    local connections = {
        ["Mount Nim"] = "Mountain Pass",
        ["The Furrow"] = "Mountain Pass",
        ["The High Basin"] = "Lakeshore",
        ["The Philosopher's Garden"] = "Woods",
    }
    travel(location, connections, alt_click)
end
function Tumbledown(_, _, alt_click)
    local location = "Tumbledown"
    local connections = {
        ["Bowl of the Sun"] = "Mountain Pass",
        ["The Alluvial Ruins"] = "River",
        ["Watcher's Rock"] = "Mountain Pass",
    }
    travel(location, connections, alt_click)
end
function WhiteSky(_, _, alt_click)
    local location = "White Sky"
    local connections = {
        ["Boulder Field"] = "Woods",
        ["Lone Tree Station"] = "Lakeshore",
        ["Mount Nim"] = "Mountain Pass",
        ["Spire"] = "River",
    }
    travel(location, connections, alt_click)
end

function AncestorsGrove(_, _, alt_click)
    local location = "Ancestor's Grove"
    local connections = {
        ["Boulder Field"] = "Woods",
        ["Kobo's Market"] = "Mountain Pass",
        ["Lone Tree Station"] = "Old-Growth",
        ["The Plummet"] = "Mountain Pass",
    }
    travel(location, connections, alt_click)
end
function ArchaeologicalOutpost(_, _, alt_click)
    local location = "Archaeological Outpost"
    local connections = {
        ["Rings of the Moon"] = "Ravine",
        ["The Alluvial Ruins"] = "Mountain Pass",
        ["The Concordant Ziggurats"] = "Grassland",
        ["Watcher's Rock"] = "Ravine",
    }
    travel(location, connections, alt_click)
end
function AtroxMountain(_, _, alt_click)
    local location = "Atrox Mountain"
    local connections = {
        ["Golden Shore"] = "Lakeshore",
        ["Lone Tree Station"] = "Mountain Pass",
        ["Northern Outpost"] = "Woods",
    }
    travel(location, connections, alt_click)
end
function BiologicalOutpost(_, _, alt_click)
    local location = "Biological Outpost"
    local connections = {
        ["Crossroads Station"] = "Old-Growth",
        ["Mound of the Navigator"] = "Woods",
        ["Stoneweaver Bridge"] = "River",
        ["The High Basin"] = "River",
    }
    travel(location, connections, alt_click)
end
function BoulderField(_, _, alt_click)
    local location = "Boulder Field"
    local connections = {
        ["Ancestor's Grove"] = "Woods",
        ["Kobo's Market"] = "Grassland",
        ["Lone Tree Station"] = "Woods",
        ["White Sky"] = "Woods",
    }
    travel(location, connections, alt_click)
end
function BowloftheSun(_, _, alt_click)
    local location = "Bowl of the Sun"
    local connections = {
        ["The Alluvial Ruins"] = "Ravine",
        ["The Frowning Gate"] = "Mountain Pass",
        ["Tumbledown"] = "Mountain Pass",
    }
    travel(location, connections, alt_click)
end
function CrossroadsStation(_, _, alt_click)
    local location = "Crossroads Station"
    local connections = {
        ["Biological Outpost"] = "Old-Growth",
        ["Branch"] = "Old-Growth",
        ["Spire"] = "Grassland",
    }
    travel(location, connections, alt_click)
end
function GoldenShore(_, _, alt_click)
    local location = "Golden Shore"
    local connections = {
        ["Atrox Mountain"] = "Lakeshore",
        ["Mount Nim"] = "Lakeshore",
        ["Northern Outpost"] = "Woods",
    }
    travel(location, connections, alt_click)
end
function GreenbriarKnoll(_, _, alt_click)
    local location = "Greenbriar Knoll"
    local connections = {
        ["Meadow"] = "Grassland",
        ["Spire"] = "Woods",
        ["Stoneweaver Bridge"] = "Ravine",
    }
    travel(location, connections, alt_click)
end
function HeadwatersStation(_, _, alt_click)
    local location = "Headwaters Station"
    local connections = {
        ["The Concordant Ziggurats"] = "River",
    }
    travel(location, connections, alt_click)
end
function KobosMarket(_, _, alt_click)
    local location = "Kobo's Market"
    local connections = {
        ["Ancestor's Grove"] = "Mountain Pass",
        ["Boulder Field"] = "Grassland",
        ["Spire"] = "Lakeshore",
        ["The Plummet"] = "Lakeshore",
    }
    travel(location, connections, alt_click)
end
function MichaelsBog(_, _, alt_click)
    local location = "Michael's Bog"
    local connections = {
        ["Sunken Outpost"] = "Swamp",
        ["The Cypress Citadel"] = "Swamp",
        ["The Frowning Gate"] = "Swamp",
    }
    travel(location, connections, alt_click)
end
function MountNim(_, _, alt_click)
    local location = "Mount Nim"
    local connections = {
        ["Golden Shore"] = "Lakeshore",
        ["Northern Outpost"] = "Mountain Pass",
        ["The Fractured Wall"] = "Mountain Pass",
        ["White Sky"] = "Mountain Pass",
    }
    travel(location, connections, alt_click)
end
function MoundoftheNavigator(_, _, alt_click)
    local location = "Mound of the Navigator"
    local connections = {
        ["Biological Outpost"] = "Woods",
        ["Stoneweaver Bridge"] = "Ravine",
        ["Terravore"] = "Old-Growth",
        ["The Greenbridge"] = "Swamp",
    }
    travel(location, connections, alt_click)
end
function RingsoftheMoon(_, _, alt_click)
    local location = "Rings of the Moon"
    local connections = {
        ["Archaeological Outpost"] = "Ravine",
        ["Meadow"] = "Ravine",
        ["The Alluvial Ruins"] = "River",
        ["The Concordant Ziggurats"] = "River",
    }
    travel(location, connections, alt_click)
end
function StoneweaverBridge(_, _, alt_click)
    local location = "Stoneweaver Bridge"
    local connections = {
        ["Biological Outpost"] = "River",
        ["Greenbriar Knoll"] = "Ravine",
        ["Meadow"] = "Grassland",
        ["Mound of the Navigator"] = "Ravine",
        ["Spire"] = "River",
        ["The Alluvial Ruins"] = "River",
    }
    travel(location, connections, alt_click)
end
function SunkenOutpost(_, _, alt_click)
    local location = "Sunken Outpost"
    local connections = {
        ["Michael's Bog"] = "Swamp",
        ["The Frowning Gate"] = "Swamp",
        ["The Greenbridge"] = "Swamp",
    }
    travel(location, connections, alt_click)
end
function Terravore(_, _, alt_click)
    local location = "Terravore"
    local connections = {
        ["Mound of the Navigator"] = "Old-Growth",
        ["The Furrow"] = "Ravine",
    }
    travel(location, connections, alt_click)
end
function TheAlluvialRuins(_, _, alt_click)
    local location = "The Alluvial Ruins"
    local connections = {
        ["Archaeological Outpost"] = "Mountain Pass",
        ["Bowl of the Sun"] = "Ravine",
        ["Rings of the Moon"] = "River",
        ["Stoneweaver Bridge"] = "River",
        ["The Frowning Gate"] = "Ravine",
        ["Tumbledown"] = "River",
    }
    travel(location, connections, alt_click)
end
function TheConcordantZiggurats(_, _, alt_click)
    local location = "The Concordant Ziggurats"
    local connections = {
        ["Archaeological Outpost"] = "Grassland",
        ["Headwaters Station"] = "River",
        ["Meadow"] = "Grassland",
        ["Rings of the Moon"] = "River",
        ["The Plummet"] = "Ravine",
    }
    travel(location, connections, alt_click)
end
function TheCypressCitadel(_, _, alt_click)
    local location = "The Cypress Citadel"
    local connections = {
        ["Michael's Bog"] = "Swamp",
    }
    travel(location, connections, alt_click)
end
function TheFrowningGate(_, _, alt_click)
    local location = "The Concordant Ziggurats"
    local connections = {
        ["Bowl of the Sun"] = "Mountain Pass",
        ["Michael's Bog"] = "Swamp",
        ["Sunken Outpost"] = "Swamp",
        ["The Alluvial Ruins"] = "Ravine",
    }
    travel(location, connections, alt_click)
end
function TheFurrow(_, _, alt_click)
    local location = "The Furrow"
    local connections = {
        ["Terravore"] = "Ravine",
        ["The Fractured Wall"] = "Mountain Pass",
        ["The High Basin"] = "Lakeshore",
    }
    travel(location, connections, alt_click)
end
function TheGreenbridge(_, _, alt_click)
    local location = "The Greenbridge"
    local connections = {
        ["Mound of the Navigator"] = "Swamp",
        ["Sunken Outpost"] = "Swamp",
    }
    travel(location, connections, alt_click)
end
function TheHighBasin(_, _, alt_click)
    local location = "The High Basin"
    local connections = {
        ["Biological Outpost"] = "River",
        ["Branch"] = "Old-Growth",
        ["The Fractured Wall"] = "Lakeshore",
        ["The Furrow"] = "Lakeshore",
    }
    travel(location, connections, alt_click)
end
function ThePhilosophersGarden(_, _, alt_click)
    local location = "The Philosopher's Garden"
    local connections = {
        ["Branch"] = "Old-Growth",
        ["Spire"] = "Old-Growth",
        ["The Fractured Wall"] = "Woods",
    }
    travel(location, connections, alt_click)
end
function ThePlummet(_, _, alt_click)
    local location = "The Plummet"
    local connections = {
        ["Ancestor's Grove"] = "Mountain Pass",
        ["Kobo's Market"] = "Lakeshore",
        ["The Concordant Ziggurats"] = "Ravine",
    }
    travel(location, connections, alt_click)
end
function WatchersRock(_, _, alt_click)
    local location = "Watcher's Rock"
    local connections = {
        ["Archaeological Outpost"] = "Ravine",
        ["Tumbledown"] = "Mountain Pass",
    }
    travel(location, connections, alt_click)
end

function Travel(params)
    setupLocation(params.location, params.connection, params.skipLocationCard)
end
function travel(newLocation, connections, alt_click)
    if not Global.getVar("prologue") and not Global.getVar("campaign") then
        broadcastToAll("Please start campaign (or prologue) first before traveling", Color.Red)
        return
    end

    if #getObjectsWithTag("Location") > 0 then
        broadcastToAll("Make sure you Clear Play Area before traveling", Color.Red)
        return
    end

    if Global.getVar("prologue") then
        if newLocation ~= "Boulder Field" then
            broadcastToAll("For the Prologue you can only travel to Boulder Field", Color.Red)
            return
        end
    end

    local currentLocation = Global.getVar("currentLocation")
    local connection = connections[currentLocation]
    if not connection then
        if newLocation == "Marsh of Rebirth" then
            connection = "Swamp"
        elseif alt_click then
            connection = "Unknown"
            broadcastToAll("No connection found from "..currentLocation.." to "..newLocation.." overriding, terrain set will need to be manually setup", Color.Red)
        else
            broadcastToAll("Unable to find connection from "..currentLocation.." to "..newLocation, Color.Red)
            return
        end
    end

    if connection == "River" then
        if #getObjectsWithTag("Vehicle") == 0 then
            broadcastToAll("Unable to find vehicle required for connection from "..currentLocation.." to "..newLocation, Color.Red)
            return
        end
    end

    printToAll("Traveling from "..currentLocation.." to "..newLocation.." via "..connection, Color.White)
    setupLocation(newLocation, connection, false)
end
function setupLocation(location, connection, skipLocationCard)
    broadcastToAll("Don't forget to handle the Arrival Setup on Location Card", Color.White)
    Global.setVar("currentLocation", location)

    getObjectFromGUID("9815de").setValue(location)
    getObjectFromGUID("0b7329").setValue(connection)

    local sharedBoard = Global.getVar("sharedBoard")
    local snaps = sharedBoard.getSnapPoints()

    if not skipLocationCard then
        local found = false
        local locationBox = Global.getVar("locationBox")
        for _, obj in pairs(locationBox.getObjects()) do
            if obj.name == location then
                found = true
                locationBox.takeObject({guid = obj.guid, position = sharedBoard.positionToWorld(snaps[Global.getVar("locationIndex")].position) + Vector(0, 0.01, 0)}).setLock(true)
                break
            end
        end

        if not found then
            broadcastToAll("Unable to find location card for "..location, Color.Red)
            return
        end
    end

    -- Location Specifc
    local detritusDeck = {}

    -- Mission Specific
    local ruins = {
        ["The Fractured Wall"] = true,
        ["The Furrow"] = true,
        ["Greenbriar Knoll"] = true,
        ["The Concodrant Ziggurats"] = true,
        ["Rings of the Moon"] = true,
        ["Sunken Outpost"] = true,
        ["The Alluvial Ruins"] = true,
    }
    local forest = {
        ["Lone Tree Station"] = true,
        ["Ancestor's Grove"] = true,
        ["The Philosopher's Garden"] = true,
        ["The High Basin"] = true,
        ["Branch"] = true,
        ["Biological Outpost"] = true,
        ["The Cypress Citadel"] = true,
    }
    local mountain = {
        ["Atrox Mountain"] = true,
        ["Mount Nim"] = true,
        ["The Plummet"] = true,
        ["Mound of the Navigator"] = true,
        ["Bowl of the Sun"] = true,
        ["Watcher's Rock"] = true,
        ["Tumbledown"] = true,
    }
    local watcherInTheBrush = getObjectFromGUID("24904e")
    if watcherInTheBrush and watcherInTheBrush.is_face_down then
        watcherInTheBrush = true
    else
        watcherInTheBrush = false
    end
    local secretInvasion = getObjectFromGUID("9d5ce7")
    if secretInvasion and secretInvasion.is_face_down then
        secretInvasion = true
    else
        secretInvasion = false
    end
    local invasion = getObjectFromGUID("4e5ca6")
    local seekers = 0
    local polyp = false
    if invasion then
        local function getMissionStartDay(missionName)
            local campaignTracker = Global.getVar("campaignTracker")
            local missions = campaignTracker.getTable("missions")

            for _, data in pairs(missions) do
                local name = getObjectFromGUID(data.name)
                if name.getValue() == missionName then
                    return getObjectFromGUID(data.day).getValue()
                end
            end
            return nil
        end

        if not invasion.is_face_down then
            -- Stage I
            invasion = false
            local currentDay = Global.getVar("currentDay")
            local missionStartDay = getMissionStartDay("Invasion - Stage I")
            local diff = currentDay - missionStartDay
            if diff == 0 or diff == 1 or diff == 2 then
                if ruins[location] then
                    invasion = true
                    seekers = 3
                end
            elseif diff == 3 or diff == 4 then
                if ruins[location] or forest[location] then
                    invasion = true
                    seekers = 3
                end
            elseif diff == 5 or diff == 6 then
                if ruins[location] or forest[location] or mountain[location] then
                    invasion = true
                    seekers = 3
                end
            end
        else
            -- Stage II
            if ruins[location] or forest[location] or mountain[location] then
                invasion = true
                polyp = true
                local currentDay = Global.getVar("currentDay")
                local missionStartDay = getMissionStartDay("Invasion - Stage II")
                local diff = currentDay - missionStartDay
                if diff == 0 or diff == 1 or diff == 2 then
                    seekers = 1
                elseif diff == 3 or diff == 4 then
                    seekers = 2
                elseif diff == 5 or diff == 6 then
                    seekers = 3
                end
            else
                invasion = false
            end
        end
    end

    -- Weather Specific
    local howlingWinds = getObjectFromGUID("c21306")
    if howlingWinds and not howlingWinds.is_face_down then
        howlingWinds = true
    else
        howlingWinds = false
    end
    local electricFog = getObjectFromGUID("42b94c")
    if electricFog and not electricFog.is_face_down then
        electricFog = true
    else
        electricFog = false
    end

    local useGeneralSet = watcherInTheBrush or secretInvasion or invasion or howlingWinds or electricFog
    local isPivotal = pivotalLocations[location]
    if Global.getVar("prologue") then
        isPivotal = true
    end

    -- Setup path deck
    local pathBox = Global.getVar("pathBox")
    local locationSet = location.." Set"
    local connectionSet = connection.." Set"
    local pathIndex = Global.getVar("pathIndex")
    local position = sharedBoard.positionToWorld(snaps[pathIndex].position) + Vector(0, 0.5, 0)
    for _, obj in pairs(pathBox.getObjects()) do
        if obj.name == connectionSet or (isPivotal and obj.name == locationSet) then
            if location == "Spire" and obj.name == locationSet then
                local deck = pathBox.takeObject({guid = obj.guid, position = position + Vector(5, 0, 0), rotation = Vector(0, 180, 180)})
                deck.setName("Spire Deck")
                deck.shuffle()
            else
                pathBox.takeObject({guid = obj.guid, position = position, rotation = Vector(0, 180, 180)})
            end
        elseif not isPivotal and obj.name == "The Valley Set" and location ~= "Headwaters Station" then
            local deck = pathBox.takeObject({guid = obj.guid})
            deck.shuffle()
            if location == "Archaeological Outpost" then
                deck.takeObject({guid = "a4cb62", position = position, rotation = Vector(0, 180, 180)})
            elseif location == "Bowl of the Sun" then
                deck.takeObject({guid = "74a0a6", position = position, rotation = Vector(0, 180, 180)})
            else
                deck.takeObject({position = position, rotation = Vector(0, 180, 180)})
            end
            deck.takeObject({position = position, rotation = Vector(0, 180, 180)})
            deck.takeObject({position = position, rotation = Vector(0, 180, 180)})
            pathBox.putObject(deck)
        elseif location == "The Alluvial Ruins" and (obj.name == "Old-Growth Set" or obj.name == "Lakeshore Set" or obj.name == "Grassland Set") then
            local deck = pathBox.takeObject({guid = obj.guid, position = position + Vector(5, 0, 0), rotation = Vector(0, 180, 180)})
            table.insert(detritusDeck, deck)
        elseif obj.name == "General Set" and useGeneralSet then
            local deck = pathBox.takeObject({guid = obj.guid})
            if watcherInTheBrush then
                deck.takeObject({guid = "879735", position = position, rotation = Vector(0, 180, 180)})
            end
            if secretInvasion then
                deck.takeObject({guid = "7c725b", position = position, rotation = Vector(0, 180, 180)})
                deck.takeObject({guid = "92a55f", position = position, rotation = Vector(0, 180, 180)})
                deck.takeObject({guid = "0d8b80", position = position, rotation = Vector(0, 180, 180)})
                deck.takeObject({guid = "23641e", position = position, rotation = Vector(0, 180, 180)})
                deck.takeObject({guid = "d5908d", position = position, rotation = Vector(0, 180, 180)})
            end
            if invasion then
                if polyp then
                    deck.takeObject({guid = "2828c9", position = position, rotation = Vector(0, 180, 180)})
                end
                local seekerGUIDs = {"7c725b", "92a55f", "0d8b80", "23641e", "d5908d"}
                for index = 1, seekers do
                    deck.takeObject({guid = seekerGUIDs[index], position = position, rotation = Vector(0, 180, 180)})
                end
            end
            if howlingWinds then
                deck.takeObject({guid = "8c4778", position = position, rotation = Vector(0, 180, 180)})
            end
            if electricFog then
                deck.takeObject({guid = "4ad92f", position = position, rotation = Vector(0, 180, 180)})
            end
            pathBox.putObject(deck)
        end
    end

    Wait.time(function()
        local hits = Physics.cast({
            origin = sharedBoard.positionToWorld(snaps[pathIndex].position) + Vector(0, -0.01, 0),
            direction = Vector(0, 1, 0),
            type = 1,
            max_distance = 1,
        })
        for _, hit in pairs(hits) do
            if hit.hit_object.hasTag("Path") then
                hit.hit_object.setName("Path Deck")
                hit.hit_object.shuffle()
                break
            end
        end

        if #detritusDeck > 0 then
            local deck = group(detritusDeck)[1]
            deck.setName("Detritus Deck")
            deck.shuffle()
        end
    end, 1.5)
end
