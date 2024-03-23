TeleportOutsideNamespace = {
    name = "TeleportOutside",
    version = "1.1",
    author = "TheMrPancake",
}

local houseList = {}

local function teleportOutsideHouse(houseInput)
    if houseInput == "" then
        d("You need to specify a houseId")
        return
    end
    if tonumber(houseInput) then
        RequestJumpToHouse(houseInput, true)
        return
    elseif type(houseInput) == "string" then
        for houseId, houseName in pairs(houseList) do
            if houseName:lower():find(houseInput:lower()) then
                RequestJumpToHouse(houseId, true)
                return end
        end
    end
end

local function createHouseIdList()
    for houseId = 1, 115 do
        local houseCollectibleId = GetCollectibleIdForHouse(houseId)
        if houseCollectibleId ~= 0 then
            local houseName = GetCollectibleName(houseCollectibleId)
            houseList[houseId] = houseName
        end
    end
end

local function Init(event, name)
    if name ~= TeleportOutsideNamespace.name then return end
    EVENT_MANAGER:UnregisterForEvent(TeleportOutsideNamespace.name, EVENT_ADD_ON_LOADED)
    createHouseIdList()
    SLASH_COMMANDS["/tpo"] = teleportOutsideHouse
end

EVENT_MANAGER:RegisterForEvent(TeleportOutsideNamespace.name, EVENT_ADD_ON_LOADED, Init)