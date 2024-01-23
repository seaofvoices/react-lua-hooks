# react-lua-use-constant

A [react-lua](https://github.com/jsdotlua/react-lua) hook to create a value once. It is different from [useMemo](https://react.dev/reference/react/useMemo), which can potentially re-calculate its value.

## Installation

Add `react-lua-use-constant` in your dependencies:

```bash
yarn add @seaofvoices/react-lua-use-constant
```

Or if you are using `npm`:

```bash
npm install @seaofvoices/react-lua-use-constant
```

## Usage

This hook takes an initializer function that gets called once to obtain the constant value.

```lua
local function Component(props)
    local mountTime = useConstant(function()
        return os.time()
    end)

    return ...
end
```

## Other Lua Environments Support

If you would like to use this library on a Lua environment, where it is currently incompatible, open an issue (or comment on an existing one) to request the appropriate modifications.

The library uses [darklua](https://github.com/seaofvoices/darklua) to process its code.

## License

This project is available under the MIT license. See [LICENSE.txt](../../LICENSE.txt) for details.
