local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local renderHook = require('@pkg/@seaofvoices/react-render-hook').renderHook

local usePreviousDistinct = require('../usePreviousDistinct')

local expect = jestGlobals.expect
local it = jestGlobals.it

local function compareStringBeginning(a: string, b: string): boolean
    return string.sub(a, 1, 3) == string.sub(b, 1, 3)
end

it('initially returns nil', function()
    local renderResult = renderHook(usePreviousDistinct, 'text')

    expect(renderResult.result.current).toBe(nil)
end)

it('returns the previous value after a re-render when no compare function is provided', function()
    local renderResult = renderHook(usePreviousDistinct, 'text')

    expect(renderResult.result.current).toBe(nil)

    renderResult.rerender('text 2')
    expect(renderResult.result.current).toBe('text')

    renderResult.rerender('text 3')
    expect(renderResult.result.current).toBe('text 2')
end)

it.only(
    'returns the same previous value after a re-render if the new value is equal to the last (with a compare function)',
    function()
        local renderResult = renderHook(usePreviousDistinct, 'abc', compareStringBeginning)

        renderResult.rerender('oof', compareStringBeginning)
        expect(renderResult.result.current).toBe('abc')

        renderResult.rerender('oof^2', compareStringBeginning)
        expect(renderResult.result.current).toBe('abc')

        renderResult.rerender('hello', compareStringBeginning)
        expect(renderResult.result.current).toBe('oof')

        renderResult.rerender('', compareStringBeginning)
        expect(renderResult.result.current).toBe('hello')
    end
)

it(
    'returns the same previous value after a re-render if the new value is equal to the last',
    function()
        local renderResult = renderHook(usePreviousDistinct, 0)

        renderResult.rerender(1)
        expect(renderResult.result.current).toBe(0)

        renderResult.rerender(1)
        expect(renderResult.result.current).toBe(0)

        renderResult.rerender(2)
        expect(renderResult.result.current).toBe(1)
    end
)
