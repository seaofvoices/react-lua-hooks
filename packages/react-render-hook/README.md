<div align="center">

[![checks](https://github.com/seaofvoices/react-lua-hooks/actions/workflows/test.yml/badge.svg)](https://github.com/seaofvoices/react-lua-hooks/actions/workflows/test.yml)
![version](https://img.shields.io/npm/v/@seaofvoices/react-render-hook?label=version)
[![GitHub top language](https://img.shields.io/github/languages/top/seaofvoices/react-lua-hooks)](https://github.com/luau-lang/luau)
![license](https://img.shields.io/npm/l/@seaofvoices/react-render-hook)
![npm](https://img.shields.io/npm/dt/@seaofvoices/react-render-hook)

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/seaofvoices)

</div>

# react-render-hook

A small utility function to quickly test React hooks.

## Installation

Add `react-render-hook` in your dependencies:

```bash
yarn add @seaofvoices/react-render-hook
```

Or if you are using `npm`:

```bash
npm install @seaofvoices/react-render-hook
```

## Content

- [renderHook](#renderhook)
- [createRenderHook](#createrenderhook)

## renderHook

```lua
function renderHook(hook, ...): {
    result: Ref,
    rerender: (...) -> (),
    unmount: () -> ()
}
```

A function that takes a hook and its initial arguments and returns a `result` ref, a function to re-render and a function to unmount.

In a [jest](https://github.com/jsdotlua/jest-lua) test, it looks like this:

```lua
local function useCustomHook(input: string): string
    return input .. " " .. input
end

it('returns the initial value after the first re-render', function()
    local renderResult = renderHook(useCustomHook, 'text')

    expect(renderResult.result.current).toBe("text text")

    renderResult.rerender('bye')

    expect(renderResult.result.current).toBe('bye bye')
end)
```

**Note about multiple returned values:** if the hook being rendered returns more than one value, those will be packed with `table.pack`. This means that the `renderResult.result.current` will contain an array.

### createRenderHook

If needed, you can pass custom [`renderOptions`](https://testing-library.com/docs/react-testing-library/api#render-options) to the `createRenderHook`.

Returns a new `renderHook` function.

## License

This project is available under the MIT license. See [LICENSE.txt](LICENSE.txt) for details.
