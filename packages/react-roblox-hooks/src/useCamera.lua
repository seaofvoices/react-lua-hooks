local React = require('@pkg/@jsdotlua/react')
local useService = require('@pkg/@seaofvoices/react-roblox-use-service').useService

local useMemo = React.useMemo

local function useCamera(): Camera
    local workspace = useService('Workspace')

    local camera = useMemo(function()
        return workspace.CurrentCamera
    end, { workspace })

    return camera
end

return useCamera
