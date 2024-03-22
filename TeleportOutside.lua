TeleportOutsideNamespace = {
    name = "TeleportOutside",
    version = "1.0",
    author = "TheMrPancake",
}

local function teleportOutsideHouse(houseId)
    if houseId == "" then
        d("You need to specify a houseId")
        return
    end
    RequestJumpToHouse(houseId, true)
end

local function printHouseIdList()
    for houseId = 1, 150 do
        local houseCollectibleId = GetCollectibleIdForHouse(houseId)
        if houseCollectibleId ~= 0 then
            local houseName = GetCollectibleName(houseCollectibleId)
            d(houseId .. " - " .. houseName)
        end
    end
end

local function Init(event, name)
    if name ~= TeleportOutsideNamespace.name then return end
    EVENT_MANAGER:UnregisterForEvent(TeleportOutsideNamespace.name, EVENT_ADD_ON_LOADED)
    SLASH_COMMANDS["/tpo"] = teleportOutsideHouse
    SLASH_COMMANDS["/tpolist"] = printHouseIdList
end

EVENT_MANAGER:RegisterForEvent(TeleportOutsideNamespace.name, EVENT_ADD_ON_LOADED, Init)