local React = require('@pkg/@jsdotlua/react')

local useCallback = React.useCallback
local useEffect = React.useEffect

local function useObjectLocation(object: PVInstance?, fn: (CFrame) -> (), deps: { any })
    local memoizedFn = useCallback(fn, deps)

    useEffect(function()
        if not object or not object:IsA('PVInstance') then
            return
        end
        local object = object :: PVInstance

        local function onChange()
            local pivot = object:GetPivot()
            memoizedFn(pivot)
        end

        local connection = object.Changed:Connect(onChange)

        onChange()

        return function()
            connection:Disconnect()
        end
    end, { object :: any, memoizedFn })
end

return useObjectLocation
