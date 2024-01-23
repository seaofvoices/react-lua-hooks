local Disk = require('@pkg/luau-disk')
local React = require('@pkg/@jsdotlua/react')
local useService = require('@pkg/@seaofvoices/react-roblox-use-service').useService

local Array = Disk.Array

local function useTaggedInstances<T>(tagName: string, mapFn: ((Instance) -> T?)?): { T }
    local instances, setInstances = React.useState({} :: { Instance })
    local collectionService = useService('CollectionService')

    React.useEffect(function()
        local addedConnection = collectionService
            :GetInstanceAddedSignal(tagName)
            :Connect(function(newInstance: Instance)
                setInstances(function(previous)
                    return Array.push(previous, newInstance)
                end)
            end)

        local removedConnection = collectionService
            :GetInstanceRemovedSignal(tagName)
            :Connect(function(removedInstance)
                setInstances(function(previous)
                    local index = table.find(previous, removedInstance)
                    if index == nil then
                        return previous
                    else
                        local cloned = table.clone(previous)
                        table.remove(cloned, index)
                        return cloned
                    end
                end)
            end)

        setInstances(collectionService:GetTagged(tagName))

        return function()
            addedConnection:Disconnect()
            removedConnection:Disconnect()
        end
    end, { tagName :: any, collectionService })

    local values = React.useMemo(function()
        if mapFn == nil then
            return instances
        else
            return Array.map(instances, mapFn)
        end
    end, { instances :: any, mapFn or false })

    return (values :: any) :: { T }
end

return (useTaggedInstances :: any) :: (
    (<T>(tagName: string, mapFn: (Instance) -> T?) -> { T }) & ((tagName: string) -> { Instance })
)
