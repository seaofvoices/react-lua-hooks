local ReactUseService = require('@pkg/@seaofvoices/react-roblox-use-service')

local useCamera = require('./useCamera')
local useCameraCFrame = require('./useCameraCFrame')
local useEvent = require('./useEvent')
local useGuiSizeBinding = require('./useGuiSizeBinding')
local useLocalPlayer = require('./useLocalPlayer')
local useObjectLocation = require('./useObjectLocation')
local usePropertyChange = require('./usePropertyChange')
local useTaggedInstances = require('./useTaggedInstances')
local useTextSize = require('./useTextSize')
local useViewportSize = require('./useViewportSize')

return {
    ServiceProvider = ReactUseService.ServiceProvider,
    useService = ReactUseService.useService,

    useCamera = useCamera,
    useCameraCFrame = useCameraCFrame,
    useEvent = useEvent,
    useGuiSizeBinding = useGuiSizeBinding,
    useLocalPlayer = useLocalPlayer,
    useObjectLocation = useObjectLocation,
    usePropertyChange = usePropertyChange,
    useTaggedInstances = useTaggedInstances,
    useTextSize = useTextSize,
    useViewportSize = useViewportSize,
}
