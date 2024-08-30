<div align="center">

[![checks](https://github.com/seaofvoices/react-lua-hooks/actions/workflows/test.yml/badge.svg)](https://github.com/seaofvoices/react-lua-hooks/actions/workflows/test.yml)
![version](https://img.shields.io/npm/v/@seaofvoices/react-lua-hooks?label=version)
[![GitHub top language](https://img.shields.io/github/languages/top/seaofvoices/react-lua-hooks)](https://github.com/luau-lang/luau)
![license](https://img.shields.io/npm/l/@seaofvoices/react-lua-hooks)
![npm](https://img.shields.io/npm/dt/@seaofvoices/react-lua-hooks)

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/seaofvoices)

</div>

# react-lua-hooks

This package is a collection of hooks for [react-lua](https://github.com/jsdotlua/react-lua).

## Installation

Add `react-lua-hooks` in your dependencies:

```bash
yarn add @seaofvoices/react-lua-hooks
```

Or if you are using `npm`:

```bash
npm install @seaofvoices/react-lua-hooks
```

## Content

**Hooks:**

- [useDefaultState](#usedefaultstate)
- [useTeardownEffect](#useteardowneffect)
- [usePrevious](#useprevious)
- [usePreviousDistinct](#usepreviousdistinct)
- [useToggle](#usetoggle)
- [useUnmount](#useunmount)
- [useDebouncedState](#usedebouncedstate)
- [useThrottledState](#usethrottledstate)

### `useDefaultState`

A hook that wraps `useState` to provides a default value whenever the actual state value is `nil`.

```lua
function useDefaultState<T>(initialValue: T?, defaultValue: T): (T, (T) -> ())
```

#### Example

```lua
local function Component(props)
    local value, setValue = useDefaultState(nil, 10)
end
```

### `useTeardownEffect`

A hook that wraps `useEffect` to handle multiple types of values that can be cleaned up with [luau-teardown](https://github.com/seaofvoices/luau-teardown).

The `useEffect` callback must absolutely return a single function for the clean up. The `useTeardownEffect` is much more flexible, as you can return any number of values supported by `luau-teardown` (`thread`, functions, `Instance`, `RBXScriptConnection`, etc.)

```lua
function useTeardownEffect(effect: () -> ...Teardown, deps: { any }?)
```

#### Example

```lua
local function Component(props)
    local target = props.target

    useTeardownEffect(function()
        local container = Instance.new("Folder")
        container.Parent = workspace

        return
            container,
            target.ChildAdded:Connect(function()
                -- ...
            end),
            task.delay(1, function()
                -- ...
            end)
    end, { target })

    -- the example above is equivalent to this useEffect
    useEffect(function()
        local container = Instance.new("Folder")
        container.Parent = workspace

        local connection = target.ChildAdded:Connect(function()
            -- ...
        end)

        local thread = task.delay(1, function()
            -- ...
        end)

        return function()
            container:Destroy()
            connection:Disconnect()
            task.cancel( thread)
        end
    end, { target })
end
```

### `usePrevious`

A hook that returns the previous value of a variable. Use this hook to track changes over renders and perform actions based on the previous state.

```lua
function usePrevious<T>(value: T): T?
```

#### Example

```lua
local function Component(props)
    local currentValue = ...
    local previousValue = usePrevious(currentValue)
end
```

### `usePreviousDistinct`

Similar to [`usePrevious`](#useprevious), this hook returns the previous distinct (non-equal) value of a state or variable. It is useful when you want to ignore consecutive identical values.

Value comparison is done using `==`, but a function can be passed to customize the equality check.

```lua
function usePreviousDistinct<T>(value: T): T?
function usePreviousDistinct<T>(value: T, isEqual: ((T, T) -> boolean)): T?
```

#### Example

```lua
local function Component(props)
    local value = useSomeState()
    local previousDistinctValue = usePreviousDistinct(value)
end
```

### `useToggle`

A hook to manage a boolean value.

```lua
function useToggle(defaultValue: boolean?): (boolean, Toggle)
-- where
type Toggle = {
    toggle: () -> (),
    on: () -> (),
    off: () -> (),
}
```

#### Example

```lua
local function Component(props)
    local value, toggle = useToggle(false)

    -- Somewhere in your component
    toggle.toggle() -- toggles the value
    toggle.on() -- set the value to true
    toggle.off() -- set the value to false
end
```

### `useUnmount`

A hook that executes a callback when a component is unmounted.

```lua
function useUnmount(fn: () -> ())
```

#### Example

```lua
local function Component(props)
    useUnmount(function()
        -- cleanup logic when the component is unmounted
    end)
end
```

### `useDebouncedState`

A hook that returns a debounced version of the state, ensuring that a state update is delayed until a specified time has passed without further updates.

```lua
function useDebouncedState<T>(initialValue: T, intervalSeconds: number): (T, (T) -> ())
```

#### Example

```lua
local function Component(props)
    -- debounce for 0.5 seconds
    local value, setValue = useDebouncedState(1, 0.5)
end
```

### `useThrottledState`

Similar to `useDebouncedState`, this hook throttles state updates, but instead of delaying updates, it limits the rate at which updates occur.

```lua
function useThrottledState<T>(initialValue: T, intervalSeconds: number): (T, (T) -> ())
```

#### Example

```lua
local function Component(props)
    -- throttle updates to once every second
    local value, setValue = useThrottledState(someValue, 1)
    -- `setValue`
end
```

## Other Lua Environments Support

If you would like to use this library on a Lua environment, where it is currently incompatible, open an issue (or comment on an existing one) to request the appropriate modifications.

The library uses [darklua](https://github.com/seaofvoices/darklua) to process its code.

## License

This project is available under the MIT license. See [LICENSE.txt](../../LICENSE.txt) for details.
