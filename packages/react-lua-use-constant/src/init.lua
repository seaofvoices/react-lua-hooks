local React = require('@pkg/@jsdotlua/react')

local function useConstant<T>(create: () -> T): T
    local ref = React.useRef(nil :: any)

    if not ref.current then
        ref.current = { value = create() }
    end

    return ref.current.value
end

return useConstant
