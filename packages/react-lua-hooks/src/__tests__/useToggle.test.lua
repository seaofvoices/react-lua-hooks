local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local renderHook = require('@pkg/@seaofvoices/react-render-hook').renderHook
local ReactTesting = require('@pkg/@jsdotlua/react-testing-library')

local useToggle = require('../useToggle')

local expect = jestGlobals.expect
local it = jestGlobals.it
local describe = jestGlobals.describe
local beforeEach = jestGlobals.beforeEach
local act = ReactTesting.act

it('initializes to true', function()
    local renderResult = renderHook(useToggle :: any, true)

    expect(renderResult.result.current[1]).toBe(true)
end)

it('initializes to false', function()
    local renderResult = renderHook(useToggle :: any, false)

    expect(renderResult.result.current[1]).toBe(false)
end)

describe('default toggle', function()
    local state
    local toggle
    local renderResult

    beforeEach(function()
        renderResult = renderHook(useToggle :: any)
        local current = renderResult.result.current
        state = current[1]
        toggle = current[2]
    end)

    it('initializes to false if no default value', function()
        expect(state).toBe(false)
    end)

    it('toggles the value when toggle is called', function()
        act(function()
            toggle.toggle()
        end)
        expect(renderResult.result.current[1]).toBe(true)

        act(function()
            toggle.toggle()
        end)
        expect(renderResult.result.current[1]).toBe(false)
    end)

    it('sets the value to true when on is called', function()
        act(function()
            toggle.on()
        end)
        expect(renderResult.result.current[1]).toBe(true)

        act(function()
            toggle.on()
        end)
        expect(renderResult.result.current[1]).toBe(true)
    end)

    it('sets the value to false when off is called', function()
        act(function()
            toggle.off()
        end)
        expect(renderResult.result.current[1]).toBe(false)

        act(function()
            toggle.off()
        end)
        expect(renderResult.result.current[1]).toBe(false)
    end)
end)
