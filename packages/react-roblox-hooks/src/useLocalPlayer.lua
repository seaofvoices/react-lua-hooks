local useService = require('@pkg/@seaofvoices/react-roblox-use-service').useService

local function useLocalPlayer(): Player
    local player = useService('Players').LocalPlayer

    return player
end

return useLocalPlayer
