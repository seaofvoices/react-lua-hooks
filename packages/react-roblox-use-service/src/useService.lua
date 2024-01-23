local React = require('@pkg/@jsdotlua/react')

local ServiceProviderContext = require('./ServiceProviderContext')

local function useService(className: string): Instance
    local serviceProvider = React.useContext(ServiceProviderContext)

    return serviceProvider(className)
end

type useServiceFn =
    (('RunService') -> RunService)
    & (('ReplicatedFirst') -> ReplicatedFirst)
    & (('ReplicatedStorage') -> ReplicatedStorage)
    & (('CollectionService') -> CollectionService)
    & (('Players') -> Players)
    & (('TweenService') -> TweenService)
    & (('ContextActionService') -> ContextActionService)
    & (('MarketplaceService') -> MarketplaceService)
    & (('Lighting') -> Lighting)
    & (('TextService') -> TextService)
    & (('TextChatService') -> TextChatService)
    & (('HttpService') -> HttpService)
    & (('PhysicsService') -> PhysicsService)
    & (('Workspace') -> Workspace)
    & (('UserInputService') -> UserInputService)
    & ((className: string) -> Instance)

return (useService :: any) :: useServiceFn
