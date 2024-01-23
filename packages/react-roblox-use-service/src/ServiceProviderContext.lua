local React = require('@pkg/@jsdotlua/react')

local function defaultServiceProvider(className: string): Instance
    return game:GetService(className)
end

local ServiceProviderContext: React.Context<(className: string) -> Instance> =
    React.createContext(defaultServiceProvider)
ServiceProviderContext.displayName = 'ServiceProviderContext'

return ServiceProviderContext
