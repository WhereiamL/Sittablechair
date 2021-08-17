ESX = nil


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

RegisterCommand(
    "chair",
    function()
        chair()
        print("5$ Chair is spawned and ready to use!")
    end
)

function chair()
    local object_model = "prop_off_chair_05"
    Citizen.CreateThread(
        function()
            RequestModel(object_model)
            local iter_for_request = 1
            while not HasModelLoaded(object_model) and iter_for_request < 5 do
                Citizen.Wait(500)
                iter_for_request = iter_for_request + 1
            end
            if not HasModelLoaded(object_model) then
                SetModelAsNoLongerNeeded(object_model)
            else
                local ped = PlayerPedId()
                local x, y, z = table.unpack(GetEntityCoords(ped))
                local created_object = CreateObjectNoOffset(object_model, x, y, z, 1, 0, 1)
                PlaceObjectOnGroundProperly(created_object)
                FreezeEntityPosition(created_object, true)
                SetModelAsNoLongerNeeded(object_model)
            end
        end
    )
end

local ListaObjekata = {
	`prop_off_chair_05`
}


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
        print("You took your 5$ chair!")
    end
)
