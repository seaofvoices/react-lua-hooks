local createRenderHook = require('./createRenderHook')

return {
    renderHook = createRenderHook(),
    createRenderHook = createRenderHook,
}
