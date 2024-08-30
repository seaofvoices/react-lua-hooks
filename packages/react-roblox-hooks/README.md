<div align="center">

[![checks](https://github.com/seaofvoices/react-lua-hooks/actions/workflows/test.yml/badge.svg)](https://github.com/seaofvoices/react-lua-hooks/actions/workflows/test.yml)
![version](https://img.shields.io/npm/v/@seaofvoices/react-roblox-hooks?label=version)
[![GitHub top language](https://img.shields.io/github/languages/top/seaofvoices/react-lua-hooks)](https://github.com/luau-lang/luau)
![license](https://img.shields.io/npm/l/@seaofvoices/react-roblox-hooks)
![npm](https://img.shields.io/npm/dt/@seaofvoices/react-roblox-hooks)

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/seaofvoices)

</div>

# react-roblox-hooks

This package is a collection of hooks for [react-lua](https://github.com/jsdotlua/react-lua), specifically target for development on Roblox.

## Installation

Add `react-roblox-hooks` in your dependencies:

```bash
yarn add @seaofvoices/react-roblox-hooks
```

Or if you are using `npm`:

```bash
npm install @seaofvoices/react-roblox-hooks
```

## Content

**Hooks:**

- [useService](#useservice)
- [useCamera](#usecamera)
- [useCameraCFrame](#usecameracframe)
- [useEvent](#useevent)
- [useGuiObjectSizeBinding](#useguiobjectsizebinding)
- [useLocalPlayer](#uselocalplayer)
- [useObjectLocation](#useobjectlocation)
- [usePropertyChange](#usepropertychange)
- [useTaggedInstances](#usetaggedinstances)
- [useTextSize](#usetextsize)
- [useViewportSize](#useviewportsize)

**Components:**

- [ServiceProvider](#serviceprovider)

### useService

```lua
function useService(className: string): Instance
```

A hook that returns the given service from its class name, as usually done with `game:GetService(className)`. Usefull when testing a component that requires a mock of a given service, which can be provided using the [ServiceProvider](#serviceprovider)

#### Example

```lua
local function Component(props)
    local camera = useCamera() -- get the Camera object

    -- ...
end
```

### useCamera

```lua
function useCamera(): Camera
```

A hook that returns the [CurrentCamera](https://create.roblox.com/docs/reference/engine/classes/Workspace#CurrentCamera) value from the Workspace.

#### Example

```lua
local function Component(props)
    local camera = useCamera() -- get the Camera object

    -- ...
end
```

### useCameraCFrame

```lua
function useCameraCFrame(fn: (CFrame) -> (), deps: { any })
```

A hook to subscribe to each camera CFrame changes.

Changes in the dependency array will disconnect and reconnect with the updated function.

#### Example

```lua
local function Component(props)
    local visible, setVisible = useState(false)

    useCameraCFrame(function(cframe: CFrame)
        local distance = ... -- compute distance from player

        -- trigger a state update to make something visible
        -- when the camera is close enough
        setVisible(distance < 30)
    end, {})

    -- ...
end
```

### useEvent

A hook to subscribe to Roblox events. Runs a function when the specified event is triggered.

Changes in the dependency array will disconnect and reconnect with the updated function.

```lua
function useEvent<T...>(
    event: RBXScriptSignal<T...>,
    fn: (T...) -> (),
    deps: { any }
)
```

#### Example

```lua
local function Component(props)

    -- ...
end
```

### useGuiSizeBinding

A hook that returns a binding for a GuiObject's [AbsoluteSize](https://create.roblox.com/docs/reference/engine/classes/GuiBase2d#AbsoluteSize) (a `Vector2`). Returns a ref that has to be assigned to a GuiBase2d instance.

```lua
function useGuiSizeBinding(): (React.Ref<GuiBase2d>, React.Binding<Vector2>)
```

#### Example

```lua
local function Component(props)
    local ref, binding = useGuiSizeBinding()

    return React.createElement("Frame", {
        -- assign the ref to the frame and the binding will
        -- automatically update with the frame AbsoluteSize property
        ref = ref,
    })
end
```

### useLocalPlayer

A hook that returns the LocalPlayer object. Use this hook to access information and perform actions related to the local player. Note that this hook will only work when used on client-side context scripts.

```lua
function useLocalPlayer(): Player
```

#### Example

```lua
local function Component(props)
    local player = useLocalPlayer(): Player
    -- ...
end
```

### useObjectLocation

A hook to track the location (CFrame) changes of a given PVInstance (typically a [model](https://create.roblox.com/docs/reference/engine/classes/Model) or [BasePart](https://create.roblox.com/docs/reference/engine/classes/BasePart)). It enables a component to respond to object movements in a game.

```lua
function useObjectLocation(
    object: PVInstance?,
    fn: (CFrame) -> (),
    deps: { any }
)
```

#### Example

```lua
local function Component(props)

    -- ...
end
```

### usePropertyChange

A hook to subscribe to property changes of a given Instance. Errors if the property does not exist on the Instance. If the given instance if `nil` is simply disconnects the previous connection.

```lua
function usePropertyChange<T>(
    instance: Instance?,
    property: string,
    fn: (T) -> (),
    deps: { any }
)
```

#### Example

```lua
local function Component(props)

    -- ...
end
```

### useTaggedInstances

A hook to retrieve instances in the game with a specified [CollectionService](https://create.roblox.com/docs/reference/engine/classes/CollectionService) tag. It returns an array of instances (or a mapped array based on a mapping function).

```lua
function useTaggedInstances(tagName: string): { Instance }
function useTaggedInstances(tagName: string, mapFn: (Instance) -> T?): { T }
```

#### Example

```lua
local function Component(props)

    -- ...
end
```

### useTextSize

A hook to calculate the size of a given text string based on provided options such as font size and style. It is useful for dynamically adjusting UI elements based on the size of the displayed text.

```lua
function useTextSize(text: string, options: Options): Vector2
-- where
type Options = { size: number, font: Font, width: number? }
```

#### Example

```lua
local function Component(props)

    -- ...
end
```

### useViewportSize

A hook to subscribe to changes in the viewport size. It enables components to respond to screen size changes, allowing for responsive adjustments.

```lua
function useViewportSize(fn: (Vector2) -> (), deps: { any })
```

#### Example

```lua
local function Component(props)

    -- ...
end
```

### ServiceProvider

A component that can override the default service provider (which simply calls `game:GetService(className)`) with a custom implementation

#### Example

```lua
local function MockServiceProvider(props)
    local mocks = props.mocks
    local function provideMocks(className: string): Instance
        -- return the mocked service or default to the real one
        return mocks[className] or game:GetService(className)
    end

    return React.createElement(ServiceProvider, {
        value = provideMocks
    })
end
```

## License

This project is available under the MIT license. See [LICENSE.txt](../../LICENSE.txt) for details.
