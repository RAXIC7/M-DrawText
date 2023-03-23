if Config.ScriptEnabled then
if GetCurrentResourceName() == "M-DrawText" then

RegisterCommand(Config.DrawText.Command, function(source, args, raw)
    if IsPlayerAceAllowed(source, "furiousfoxgg.drawtext") then
    if args[1] then
        local coords = GetEntityCoords(GetPlayerPed(source))
        local text = table.concat(args, " ", 2)
        TriggerClientEvent("M:DrawText:PlaceText", -1, coords.x, coords.y, coords.z, tonumber(args[1]), text)
        TriggerClientEvent('t-notify:client:Alert', source, {style  =  'success', message  =  'Drawing Text at current Coords.'})
    else
        TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'No Arguments Required.'})
        end
    else 
        TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'You do not have permission to use this command.'})
    end
end)

RegisterCommand(Config.DrawText.RemoveCmd, function(source, args, raw)
    if IsPlayerAceAllowed(source, "furiousfoxgg.drawtext") then
    TriggerClientEvent("M:DrawText:RemoveText", -1)
    end
end)

end 
end