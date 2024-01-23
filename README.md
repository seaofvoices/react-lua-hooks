# React Lua Hooks

This project consists of two main packages that contains [react-lua](https://github.com/jsdotlua/react-lua) hooks.

- [Lua hooks](packages/react-lua-hooks/README.md#content): general-purpose collection of hooks for [react-lua](https://github.com/jsdotlua/react-lua)
- [Roblox hooks](packages/react-roblox-hooks/README.md#content): hooks specifically made for Roblox development

# Installation

Add these packages to your dependencies:

```bash
yarn add @seaofvoices/react-lua-hooks
yarn add @seaofvoices/react-roblox-hooks
```

Or if you are using `npm`:

```bash
npm install @seaofvoices/react-lua-hooks
npm install @seaofvoices/react-roblox-hooks
```

# Content

- [Lua hooks](packages/react-lua-hooks/README.md#content)
    - [useDefaultState](packages/react-lua-hooks/README.md#usedefaultstate)
    - [usePrevious](packages/react-lua-hooks/README.md#useprevious)
    - [usePreviousDistinct](packages/react-lua-hooks/README.md#usepreviousdistinct)
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

# Other Lua Environments Support

If you would like to use this library on a Lua environment where it is currently incompatible, open an issue (or comment on an existing one) to request the appropriate modifications.

The library uses [darklua](https://github.com/seaofvoices/darklua) to process its code.
