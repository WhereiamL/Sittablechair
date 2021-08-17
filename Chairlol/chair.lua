ESX = nil

--[[
Add this to your databse under items 

greenchair

classicchair

bluechair

officechair
]]
Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(0)
        end
    end
)

local ListaObjekata = {
	`prop_off_chair_05`, --Classic one 
    `prop_skid_chair_01`, --green one 
    `prop_skid_chair_02`, -- blue one I guess lol
    `ex_prop_offchair_exec_03` --Office chair
}



AddEventHandler("chair:spawn")
RegisterNetEvent("chair:spawn", function()
    x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    local heading = GetEntityHeading(PlayerPedId())

    chair = `prop_skid_chair_01`

    RequestModel(chair)
    while not HasModelLoaded(chair) do
      Citizen.Wait(1)
    end

    local object = CreateObject(chair, x+1, y, z-2, true, true, false) -- x+1
    PlaceObjectOnGroundProperly(object)
    SetEntityHeading(object, heading + 180)
    FreezeEntityPosition(object, true)
    SetModelAsNoLongerNeeded(object)
end)

AddEventHandler("chair:spawn2")
RegisterNetEvent("chair:spawn2", function()
    x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    local heading = GetEntityHeading(PlayerPedId())

    chair2 = `prop_off_chair_05`

    RequestModel(chair2)
    while not HasModelLoaded(chair2) do
      Citizen.Wait(1)
    end

    local object = CreateObject(chair2, x+1, y, z-2, true, true, false) -- x+1
    PlaceObjectOnGroundProperly(object)
    SetEntityHeading(object, heading + 180)
    FreezeEntityPosition(object, true)
    SetModelAsNoLongerNeeded(object)
end)

AddEventHandler("chair:spawn3")
RegisterNetEvent("chair:spawn3", function()
    x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    local heading = GetEntityHeading(PlayerPedId())

    chair3 = `prop_skid_chair_02`

    RequestModel(chair3)
    while not HasModelLoaded(chair3) do
      Citizen.Wait(1)
    end

    local object = CreateObject(chair3, x+1, y, z-2, true, true, false) -- x+1
    PlaceObjectOnGroundProperly(object)
    SetEntityHeading(object, heading + 180)
    FreezeEntityPosition(object, true)
    SetModelAsNoLongerNeeded(object)
end)

AddEventHandler("chair:spawn3")
RegisterNetEvent("chair:spawn3", function()
    x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    local heading = GetEntityHeading(PlayerPedId())

    chair3 = `prop_skid_chair_02`

    RequestModel(chair3)
    while not HasModelLoaded(chair3) do
      Citizen.Wait(1)
    end

    local object = CreateObject(chair3, x+1, y, z-2, true, true, false) -- x+1
    PlaceObjectOnGroundProperly(object)
    SetEntityHeading(object, heading + 180)
    FreezeEntityPosition(object, true)
    SetModelAsNoLongerNeeded(object)
end)

AddEventHandler("chair:spawn4")
RegisterNetEvent("chair:spawn4", function()
    x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    local heading = GetEntityHeading(PlayerPedId())

    chair4 = `ex_prop_offchair_exec_03`

    RequestModel(chair4)
    while not HasModelLoaded(chair4) do
      Citizen.Wait(1)
    end

    local object = CreateObject(chair4, x+1, y, z-2, true, true, false) -- x+1
    PlaceObjectOnGroundProperly(object)
    SetEntityHeading(object, heading + 180)
    FreezeEntityPosition(object, true)
    SetModelAsNoLongerNeeded(object)
end)


RegisterCommand(
    "takechair",
    function()
        for i = 1, #ListaObjekata do
            local obb = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 5.0, ListaObjekata[i], false, true, true)
            if DoesEntityExist(obb) then
                NetworkRequestControlOfEntity(obb)
                while not NetworkHasControlOfEntity(obb) do
                    Wait(100)
                end
                DeleteEntity(obb)
                DeleteObject(obb)
                break
            end
        end
        ESX.ShowNotification('You took your ~b~5$~w~ chair!')
    end
)
