local React = require('@pkg/@jsdotlua/react')

local SetStateType = require('./SetStateType')
local useUnmount = require('./useUnmount')

local useCallback = React.useCallback
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState

type SetState<T> = SetStateType.SetState<T>

local function useThrottledState<T>(initialValue: T, intervalSeconds: number): (T, SetState<T>)
    local value, setValue = useState(initialValue)
    local lastThrottleTime = useRef(os.clock())

    local scheduledValue = useRef(nil :: { value: T | (T) -> T }?)
    local scheduledUpdate = useRef(nil :: thread?)

    local setThrottledValue = useCallback(function(newValue: T | (T) -> T)
        local remainingTime = intervalSeconds - (os.clock() - lastThrottleTime.current :: number)

        if remainingTime <= 0 then
            lastThrottleTime.current = os.clock()
            setValue(newValue)
            return
        else
            scheduledValue.current = { value = newValue }
            if scheduledUpdate.current == nil then
                scheduledUpdate.current = task.delay(remainingTime, function()
                    scheduledUpdate.current = nil
                    local current = scheduledValue.current

                    if current then
                        scheduledValue.current = nil

                        lastThrottleTime.current = os.clock()
                        setValue(current.value)
                    end
                end)
            end
        end
    end, { setValue :: any, intervalSeconds })

    useEffect(function()
        local update = scheduledUpdate.current
        local nextValue = scheduledValue.current
        if update and nextValue then
            scheduledUpdate.current = nil
            task.cancel(update)
            setThrottledValue(nextValue.value)
        end
    end, { setThrottledValue })

    useUnmount(function()
        local update = scheduledUpdate.current
        if update then
            task.cancel(update)
        end
        scheduledValue.current = nil
    end)

    return value, setThrottledValue
end

return useThrottledState
