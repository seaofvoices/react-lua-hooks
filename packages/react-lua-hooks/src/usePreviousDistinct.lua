local React = require('@pkg/@jsdotlua/react')

local useRef = React.useRef

local function usePreviousDistinct<T>(value: T, isEqual: ((T, T) -> boolean)?): T?
    local ref = useRef(value)
    local previousValue = useRef(nil :: T?)

    local current = ref.current :: T

    local currentIsEqual = if isEqual then isEqual(current, value) else current == value

    if not currentIsEqual then
        previousValue.current = current
        ref.current = value
    end

    return previousValue.current
end

return usePreviousDistinct
