local React = require('@pkg/@jsdotlua/react')

local useEffect = React.useEffect
local useCallback = React.useCallback

local function usePropertyChange<T>(
    instance: Instance?,
    property: string,
    fn: (T) -> (),
    deps: { any }
)
    local memoizedFn = useCallback(fn, deps)

    useEffect(function()
        if instance == nil then
            return
        end
        local instance = instance :: Instance

        local connection = instance:GetPropertyChangedSignal(property):Connect(function()
            memoizedFn((instance :: any)[property])
        end)

        memoizedFn((instance :: any)[property])

        return function()
            connection:Disconnect()
        end
    end, { instance or false :: any, property, memoizedFn })
end

return usePropertyChange
