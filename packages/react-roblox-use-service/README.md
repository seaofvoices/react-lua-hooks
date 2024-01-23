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

## API

### useService

```lua
function useService(className: string): Instance
```

A hook that returns the given service from its class name, as usually done with `game:GetService(className)`. Usefull when testing a component that requires a mock of a given service, which can be provided using the [ServiceProvider](#serviceprovider)

### ServiceProvider

A component that can override the default service provider (which simply calls `game:GetService(className)`) with a custom implementation. Useful for testing components with a mocked service.

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

This project is available under the MIT license. See [LICENSE.txt](LICENSE.txt) for details.
