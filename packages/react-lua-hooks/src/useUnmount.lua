local React = require('@pkg/@jsdotlua/react')

local useEffect = React.useEffect
local useRef = React.useRef

local function useUnmount(fn: () -> ())
    local onUnmount = useRef((nil :: any) :: () -> ())

    onUnmount.current = fn

    useEffect(function()
        return (onUnmount.current :: () -> ())()
    end, {})
end

return useUnmount
