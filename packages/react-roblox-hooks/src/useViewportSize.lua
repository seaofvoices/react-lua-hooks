local useCamera = require('./useCamera')
local usePropertyChange = require('./usePropertyChange')

local function useViewportSize(fn: (Vector2) -> (), deps: { any })
    local camera = useCamera()

    usePropertyChange(camera, 'ViewportSize', fn, deps)
end

return useViewportSize
