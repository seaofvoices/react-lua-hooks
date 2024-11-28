local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local renderHook = require('@pkg/@seaofvoices/react-render-hook').renderHook
local ReactTesting = require('@pkg/@jsdotlua/react-testing-library')

local useDefaultState = require('../useDefaultState')

local expect = jestGlobals.expect
local it = jestGlobals.it
local act = ReactTesting.act

it('returns the default value when the value is nil', function()
    local renderResult = renderHook(function()
        return useDefaultState(nil, 'default')
    end)

    expect(renderResult.result.current[1]).toBe('default')
end)

it('returns the value when it is not nil', function()
    local renderResult = renderHook(function()
        return useDefaultState('initial', 'default')
    end)

    expect(renderResult.result.current[1]).toBe('initial')
end)

it('updates the value correctly with setState', function()
    local renderResult = renderHook(function()
        return useDefaultState(nil, 'default')
    end)

    local setValue = renderResult.result.current[2]

    act(function()
        setValue('updated')
    end)

    expect(renderResult.result.current[1]).toBe('updated')
end)

it('returns the default value when setState is called with nil', function()
    local renderResult = renderHook(function()
        return useDefaultState(nil, 'default')
    end)

    local setValue = renderResult.result.current[2]

    act(function()
        setValue(nil)
    end)

    expect(renderResult.result.current[1]).toBe('default')
end)
