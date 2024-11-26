local React = require('@pkg/@jsdotlua/react')

local useRef = React.useRef

local function usePreviousDistinct<T>(value: T, isEqual: ((T, T) -> boolean)?): T?
    local previousRef = useRef(nil :: { value: T }?)
    local currentRef = useRef(nil :: { value: T }?)

    if currentRef.current == nil then
        currentRef.current = { value = value }
    else
        local currentIsEqual = if isEqual ~= nil and previousRef.current ~= nil
            then isEqual(value, currentRef.current.value)
            elseif previousRef.current == nil then false
            else value == currentRef.current.value

        if not currentIsEqual then
            previousRef.current = { value = currentRef.current.value }
            currentRef.current = { value = value }
        end
    end

    return previousRef.current and previousRef.current.value
end

return usePreviousDistinct
