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

local function Init(event, name)
    if name ~= TeleportOutsideNamespace.name then return end
    EVENT_MANAGER:UnregisterForEvent(TeleportOutsideNamespace.name, EVENT_ADD_ON_LOADED)
    SLASH_COMMANDS["/tpo"] = teleportOutsideHouse
end

EVENT_MANAGER:RegisterForEvent(TeleportOutsideNamespace.name, EVENT_ADD_ON_LOADED, Init)