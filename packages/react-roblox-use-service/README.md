<div align="center">

[![checks](https://github.com/seaofvoices/react-lua-hooks/actions/workflows/test.yml/badge.svg)](https://github.com/seaofvoices/react-lua-hooks/actions/workflows/test.yml)
![version](https://img.shields.io/npm/v/@seaofvoices/react-roblox-use-service?label=version)
[![GitHub top language](https://img.shields.io/github/languages/top/seaofvoices/react-lua-hooks)](https://github.com/luau-lang/luau)
![license](https://img.shields.io/npm/l/@seaofvoices/react-roblox-use-service)
![npm](https://img.shields.io/npm/dt/@seaofvoices/react-roblox-use-service)

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/seaofvoices)

</div>

# react-roblox-use-service

A Luau library for Roblox that provides a `useService` hook and a `ServiceProvider` component for [react-lua](https://github.com/jsdotlua/react-lua).

## Installation

Add `react-roblox-use-service` in your dependencies:

```bash
yarn add @seaofvoices/react-roblox-use-service
```

Or if you are using `npm`:

```bash
npm install @seaofvoices/react-roblox-use-service
```

## Content

### useService

```lua
function useService(className: string): Instance
```

A hook that returns the given service from its class name, as usually done with `game:GetService(className)`. Usefull when testing a component that requires a mock of a given service, which can be provided using the [ServiceProvider](#serviceprovider)

#### Example

```lua
local ReactRobloxUseService = require('@pkg/@seaofvoices/react-roblox-use-service')
local useService = ReactRobloxUseService.useService

local function MyButton(props)
    local ReplicatedStorage = useService("ReplicatedStorage")
    local Selection = useService("Selection")

    return React.createElement(CustomButton, {
        onClick = function()
            local new = Instance.new("Folder")
            new.Parent = ReplicatedStorage

            Selection:Set({ new })
        end,
    })
end
```

### ServiceProvider

A component that can override the default service provider (which simply calls `game:GetService(className)`) with a custom implementation. Useful for testing components with a mocked service.

#### Example

```lua
local ReactRobloxUseService = require('@pkg/@seaofvoices/react-roblox-use-service')
local ServiceProvider = ReactRobloxUseService.ServiceProvider

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

This project is available under the MIT license. See [LICENSE.txt](LICENSE.txt) for details.
