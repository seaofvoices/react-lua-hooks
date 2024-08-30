local React = require('@pkg/@jsdotlua/react')
local Teardown = require('@pkg/luau-teardown')

type Teardown = Teardown.Teardown

local useEffect = React.useEffect

local function useTeardownEffect(effect: () -> ...Teardown, deps: { any }?): ()
    useEffect(function()
        return Teardown.fn(effect())
    end, deps)
end

return useTeardownEffect
