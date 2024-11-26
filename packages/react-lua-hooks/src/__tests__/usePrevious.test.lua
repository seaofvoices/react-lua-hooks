local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local renderHook = require('@pkg/@seaofvoices/react-render-hook').renderHook

local usePrevious = require('../usePrevious')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('it initially returns nil', function()
    local renderResult = renderHook(usePrevious :: any, 'text')

    expect(renderResult.result.current).toBe(nil)
end)

it('returns the initial value after the first re-render', function()
    local renderResult = renderHook(usePrevious :: any, 'text')

    expect(renderResult.result.current).toBe(nil)

    renderResult.rerender('text 2')

    expect(renderResult.result.current).toBe('text')
end)

it('returns the previous value after multiple re-render', function()
    local renderResult = renderHook(usePrevious :: any, 'text')
    expect(renderResult.result.current).toBe(nil)

    renderResult.rerender('text 2')
    expect(renderResult.result.current).toBe('text')

    renderResult.rerender('text 3')
    expect(renderResult.result.current).toBe('text 2')

    renderResult.rerender('text 3')
    expect(renderResult.result.current).toBe('text 3')
end)
