local React = require('@pkg/@jsdotlua/react')

local useRef = React.useRef
local useEffect = React.useEffect

local function usePrevious<T>(value: T): T?
    local ref = useRef(nil :: T?)

    ref.current = value

    useEffect(function()
        ref.current = value
    end)

    return ref.current
end

return usePrevious
