local React = require('@pkg/@jsdotlua/react')
local useService = require('@pkg/@seaofvoices/react-roblox-use-service').useService

local function useTextSize(
    text: string,
    options: { size: number, font: Font, width: number? }
): Vector2
    local textService = useService('TextService')

    local textSize = options.size
    local textFont = options.font
    local width = options.width or 0

    local textBoundsParams = React.useMemo(function()
        local params = Instance.new('GetTextBoundsParams')
        params.Font = textFont
        params.Size = textSize
        params.Width = width
        return params
    end, { textFont :: any, textSize, width })

    local frameSize = React.useMemo(function()
        local params = textBoundsParams:Clone()
        params.Text = text
        return textService:GetTextBoundsAsync(params)
    end, { text :: any, textBoundsParams, textService })

    return frameSize
end

return useTextSize
