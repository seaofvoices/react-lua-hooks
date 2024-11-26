local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local renderHook = require('@pkg/@seaofvoices/react-render-hook').renderHook

local useUnmount = require('../useUnmount')

local expect = jestGlobals.expect
local it = jestGlobals.it
local jest = jestGlobals.jest

it('calls the provided cleanup function on unmount', function()
    local cleanupMock = jest.fn()

    local renderResult = renderHook(useUnmount, cleanupMock)

    renderResult.unmount()

    expect(cleanupMock).toHaveBeenCalledTimes(1)
end)

it('does not call the cleanup function on rerender', function()
    local cleanupMock = jest.fn()

    local renderResult = renderHook(useUnmount, cleanupMock)

    renderResult.rerender(cleanupMock)

    expect(cleanupMock).toHaveBeenCalledTimes(0)
end)

it('calls the last cleanup function on unmount', function()
    local cleanupMock = jest.fn()
    local lastCleanupMock = jest.fn()

    local renderResult = renderHook(useUnmount, cleanupMock)

    renderResult.rerender(lastCleanupMock)

    renderResult.unmount()

    expect(cleanupMock).toHaveBeenCalledTimes(0)
    expect(lastCleanupMock).toHaveBeenCalledTimes(1)
end)

it('does not throw if no function is provided', function()
    local renderResult = renderHook(useUnmount)

    expect(function()
        renderResult.unmount()
    end).never.toThrow()
end)
