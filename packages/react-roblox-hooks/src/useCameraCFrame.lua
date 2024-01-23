local useCamera = require('./useCamera')
local usePropertyChange = require('./usePropertyChange')

local function useCameraCFrame(fn: (CFrame) -> (), deps: { any })
    local camera = useCamera()

    usePropertyChange(camera, 'CFrame', fn, deps)
end

return useCameraCFrame
