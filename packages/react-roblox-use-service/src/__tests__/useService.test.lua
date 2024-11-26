local React = require('@pkg/@jsdotlua/react')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local renderHook = require('@pkg/@seaofvoices/react-render-hook')

local ServiceProviderContext = require('../ServiceProviderContext')
local useService = require('../useService')

local expect = jestGlobals.expect
local it = jestGlobals.it
local beforeEach = jestGlobals.beforeEach

local services
local renderWithServices

beforeEach(function()
    services = {}
    renderWithServices = renderHook.createRenderHook({
        wrapper = function(props)
            return React.createElement(ServiceProviderContext.Provider, {
                value = function(name)
                    return services[name]
                end,
            }, props.children)
        end,
    })
end)

it('returns the RunService', function()
    local runServiceMock = {}

    services.RunService = runServiceMock
    local renderResult = renderWithServices(useService :: any, 'RunService')

    expect(renderResult.result.current).toBe(runServiceMock)
end)

it('returns a different service after re-rendering', function()
    local runServiceMock = {}
    local workspaceMock = {}

    services.RunService = runServiceMock
    services.Workspace = workspaceMock
    local renderResult = renderWithServices(useService :: any, 'RunService')

    expect(renderResult.result.current).toBe(runServiceMock)

    renderResult.rerender('Workspace')

    expect(renderResult.result.current).toBe(workspaceMock)
end)

return nil
