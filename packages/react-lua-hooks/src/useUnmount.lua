local React = require('@pkg/@jsdotlua/react')

local useEffect = React.useEffect
local useRef = React.useRef

local function useUnmount(fn: () -> ()?)
    local onUnmount = useRef(nil :: () -> ()?)

    onUnmount.current = fn

    useEffect(function()
        return function()
            if onUnmount.current then
                onUnmount.current()
            end
        end
    end, {})
end

return useUnmount
