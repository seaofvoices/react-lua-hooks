local React = require('@pkg/@jsdotlua/react')

local SetStateType = require('./SetStateType')
local useUnmount = require('./useUnmount')

local useCallback = React.useCallback
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState

type SetState<T> = SetStateType.SetState<T>

local function useDebouncedState<T>(initialValue: T, intervalSeconds: number): (T, SetState<T>)
    local value, setValue = useState(initialValue)

    local scheduledValue = useRef(nil :: { value: T | (T) -> T }?)
    local lastCallTime = useRef(nil :: number?)
    local scheduledUpdate = useRef(nil :: thread?)

    local setDebouncedValue = useCallback(function(newValue: T | (T) -> T)
        local update = scheduledUpdate.current
        if update then
            task.cancel(update)
        end

        lastCallTime.current = os.clock()
        scheduledValue.current = { value = newValue }
        scheduledUpdate.current = task.delay(intervalSeconds, function()
            lastCallTime.current = nil
            scheduledUpdate.current = nil
            setValue(newValue)
        end)
    end, { setValue :: any, intervalSeconds })

    useEffect(function()
        local lastCall = lastCallTime.current
        local update = scheduledUpdate.current
        local nextValue = scheduledValue.current

        if update and lastCall and nextValue then
            scheduledUpdate.current = nil
            task.cancel(update)

            if os.clock() >= lastCall + intervalSeconds then
                setValue(nextValue.value)
            else
                scheduledUpdate.current = task.delay(intervalSeconds, function()
                    lastCallTime.current = nil
                    scheduledUpdate.current = nil

                    setValue(nextValue.value)
                end)
            end
        end
    end, { intervalSeconds })

    useUnmount(function()
        local update = scheduledUpdate.current
        if update then
            task.cancel(update)
        end
        scheduledValue.current = nil
        lastCallTime.current = nil
    end)

    return value, setDebouncedValue
end

return useDebouncedState
