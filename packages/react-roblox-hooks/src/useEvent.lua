local React = require('@pkg/@jsdotlua/react')

local useEffect = React.useEffect
local useCallback = React.useCallback

local function useEvent<T...>(event: RBXScriptSignal<T...>, fn: (T...) -> (), deps: { any })
    local memoizedFn = useCallback(fn, deps)

    useEffect(function()
        local connection = event:Connect(memoizedFn)
        return function()
            connection:Disconnect()
        end
    end, { event :: any, memoizedFn })
end

return useEvent
