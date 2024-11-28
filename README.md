<div align="center">

[![checks](https://github.com/seaofvoices/react-lua-hooks/actions/workflows/test.yml/badge.svg)](https://github.com/seaofvoices/react-lua-hooks/actions/workflows/test.yml)
[![GitHub top language](https://img.shields.io/github/languages/top/seaofvoices/react-lua-hooks)](https://github.com/luau-lang/luau)
![version](https://img.shields.io/npm/v/@seaofvoices/react-lua-hooks?label=react-lua-hooks)
![version](https://img.shields.io/npm/v/@seaofvoices/react-lua-hooks?label=react-roblox-hooks)
![license](https://img.shields.io/npm/l/@seaofvoices/react-lua-hooks)
![npm](https://img.shields.io/npm/dt/@seaofvoices/react-lua-hooks?label=react-lua-hooks%20downloads)
![npm](https://img.shields.io/npm/dt/@seaofvoices/react-roblox-hooks?label=react-roblox-hooks%20downloads)

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/seaofvoices)

</div>

# React Lua Hooks

This project consists of three main packages that revolves around [react-lua](https://github.com/jsdotlua/react-lua) hooks:

- [Lua hooks](packages/react-lua-hooks/README.md#content): general-purpose collection of hooks for [react-lua](https://github.com/jsdotlua/react-lua)
- [Roblox hooks](packages/react-roblox-hooks/README.md#content): hooks specifically made for Roblox development
- [react-render-hook](packages/react-render-hook/README.md#content): a utility function to quickly test React hooks

# Installation

Add these packages to your dependencies:

```bash
yarn add @seaofvoices/react-lua-hooks
yarn add @seaofvoices/react-roblox-hooks

yarn add -D @seaofvoices/react-render-hook
```

Or if you are using `npm`:

```bash
npm install @seaofvoices/react-lua-hooks
npm install @seaofvoices/react-roblox-hooks

npm install @seaofvoices/react-render-hook --save-dev
```

# Content

- [Lua hooks](packages/react-lua-hooks/README.md#content)
    - [useConstant](packages/react-lua-use-constant/README.md#usage)
    - [useDefaultState](packages/react-lua-hooks/README.md#usedefaultstate)
    - [usePrevious](packages/react-lua-hooks/README.md#useprevious)
    - [usePreviousDistinct](packages/react-lua-hooks/README.md#usepreviousdistinct)
    - [useTeardownEffect](packages/react-lua-hooks/README.md#useteardowneffect)
    - [useToggle](packages/react-lua-hooks/README.md#usetoggle)
    - [useUnmount](packages/react-lua-hooks/README.md#useunmount)
    - [useDebouncedState](packages/react-lua-hooks/README.md#usedebouncedstate)
    - [useThrottledState](packages/react-lua-hooks/README.md#usethrottledstate)
- [Roblox hooks](packages/react-roblox-hooks/README.md#content)
    - [useService](packages/react-roblox-hooks/README.md#useservice)
    - [useCamera](packages/react-roblox-hooks/README.md#usecamera)
    - [useCameraCFrame](packages/react-roblox-hooks/README.md#usecameracframe)
    - [useEvent](packages/react-roblox-hooks/README.md#useevent)
    - [useGuiObjectSizeBinding](packages/react-roblox-hooks/README.md#useguiobjectsizebinding)
    - [useLocalPlayer](packages/react-roblox-hooks/README.md#uselocalplayer)
    - [useObjectLocation](packages/react-roblox-hooks/README.md#useobjectlocation)
    - [usePropertyChange](packages/react-roblox-hooks/README.md#usepropertychange)
    - [useTaggedInstances](packages/react-roblox-hooks/README.md#usetaggedinstances)
    - [useTextSize](packages/react-roblox-hooks/README.md#usetextsize)
    - [useViewportSize](packages/react-roblox-hooks/README.md#useviewportsize)
- [react-render-hook](packages/react-render-hook/README.md#content)
    - [renderHook](packages/react-render-hook/README.md#renderhook)
    - [createRenderHook](packages/react-render-hook/README.md#createrenderhook)

# Other Lua Environments Support

If you would like to use this library on a Lua environment where it is currently incompatible, open an issue (or comment on an existing one) to request the appropriate modifications.

The library uses [darklua](https://github.com/seaofvoices/darklua) to process its code.
