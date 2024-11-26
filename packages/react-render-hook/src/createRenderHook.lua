local React = require('@pkg/@jsdotlua/react')
local ReactTesting = require('@pkg/@jsdotlua/react-testing-library')

local function createRenderHook(renderOptions: { [string]: any }?)
    local function renderHook(renderCallback, ...)
        local args = table.pack(...)

        local result = React.createRef()

        local function TestComponent(props: { renderCallbackProps: { [number]: any, n: number } })
            local renderCallbackProps = props.renderCallbackProps
            local pendingResult = table.pack(
                renderCallback(table.unpack(renderCallbackProps, 1, renderCallbackProps.n))
            )

            React.useEffect(function()
                result.current = if pendingResult.n > 1
                    then pendingResult
                    else table.unpack(pendingResult, 1, 1)
            end)

            return nil
        end

        local renderResult = ReactTesting.render(
            React.createElement(TestComponent, { renderCallbackProps = args }),
            renderOptions or {}
        )
        local baseRerender = renderResult.rerender
        local unmount = renderResult.unmount

        local function rerender(...)
            local args = table.pack(...)
            return baseRerender(React.createElement(TestComponent, { renderCallbackProps = args }))
        end

        return { result = result, rerender = rerender, unmount = unmount }
    end

    return renderHook
end

return createRenderHook
