local React = require('@pkg/@jsdotlua/react')

local useState = React.useState
local useMemo = React.useMemo

export type Toggle = {
    toggle: () -> (),
    on: () -> (),
    off: () -> (),
}

local function flipBoolean(previous: boolean): boolean
    return not previous
end

local function useToggle(defaultValue: boolean?): (boolean, Toggle)
    local value, setValue = useState(defaultValue == true)

    local toggle = useMemo(function()
        return {
            toggle = function()
                setValue(flipBoolean)
            end,
            on = function()
                setValue(true)
            end,
            off = function()
                setValue(false)
            end,
        }
    end, { setValue })

    return value, toggle
end

return useToggle
