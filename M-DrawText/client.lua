Citizen.Trace("\n===========\nLoading " ..GetCurrentResourceName().. "\nScript Enabled: " ..tostring(Config.ScriptEnabled).. "\n===========")

if Config.ScriptEnabled then
if GetCurrentResourceName() == "M-DrawText" then

TextActive = false

TriggerEvent('chat:addSuggestion', '/drawtext', 'Draw Text on the ground', {
        { name="Distance", help="The distance the user can see the text from." }, --args 1
        { name="Text", help="The Text you want to be displayed."}}) --other args   

TriggerEvent('chat:addSuggestion', '/'..Config.DrawText.RemoveCmd, 'Remove currently drawn text.')    

        
RegisterNetEvent("M:DrawText:PlaceText")
AddEventHandler("M:DrawText:PlaceText", function(x, y, z, distance, text)
    TextActive = true
    TriggerEvent("M:DrawText:DebugLog", "\n===========\nDrawing Text: " ..text.. "\nX = " ..x.. " Y = " ..y.. " Z = "..z.."\n===========")
   Citizen.CreateThread(function()
     while TextActive do
       Citizen.Wait(0)
        if GetDistanceBetweenCoords(x, y, z, GetEntityCoords(GetPlayerPed(-1))) < distance then
            Draw3DText(x, y, z, text)
            end
        end
    end)
end)

RegisterNetEvent("M:DrawText:RemoveText")
AddEventHandler("M:DrawText:RemoveText", function()
   TextActive = false
end)

RegisterNetEvent("M:DrawText:DebugLog")
AddEventHandler("M:DrawText:DebugLog", function(msg)
   if Config.Debug then 
    Citizen.Trace("\n" .. msg)
    --[[EVENT COPY AND PASTE, TEHE
    TriggerClientEvent("M:DrawText:DebugLog", -1, ARGS_HERE_BUDDY)
    TriggerEvent("M:DrawText:DebugLog", ARGS_HERE_BUDDY)
]]
    end
end)

  function Draw3DText(x, y, z, text, scale)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 250
    DrawRect(0.0,0.0+0.0125, 0.010+ factor, 0.0390, 0, 0, 0, 200)
  end

else 
    Citizen.Trace("\nERROR: " ..GetCurrentResourceName().. " Needs to be Named M-DrawText\n===========")
    end
else 
    Citizen.Trace("\n"..GetCurrentResourceName().. " is currently disabled as Config.ScriptEnabled = " ..tostring(Config.ScriptEnabled).. "\n===========")
end