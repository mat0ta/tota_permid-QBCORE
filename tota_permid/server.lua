QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('tota:server:displayid')
AddEventHandler('tota:server:displayid', function(permId, cb)
	for k,v in pairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
		  identifier = v
		end
	end
	local steamId = identifier
	local number = math.random(1,20000)
    QBCore.Functions.ExecuteSql(false, "SELECT permid FROM players WHERE `steam` = '"..steamId.."'  AND LENGTH(permid) > 1", function(result)
    if result[1] == nil then
	QBCore.Functions.ExecuteSql(false, "UPDATE players SET permid = '"..number.."' WHERE `steam` = '"..steamId.."'", function(result)
	end)
	else
	end
    end)
end)

RegisterServerEvent('tota:server:displaydiscord')
AddEventHandler('tota:server:displaydiscord', function(discord, cb)
	for k,v in pairs(GetPlayerIdentifiers(source))do
	if string.sub(v, 1, string.len("steam:")) == "steam:" then
		identifier = v
	elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
		playerdiscord = v
		str = string.sub(v, 9)
	end
    end
	local steamId = identifier
	local discordId = str
    QBCore.Functions.ExecuteSql(false, "SELECT discord FROM players WHERE `steam` = '"..steamId.."' AND LENGTH(discord) > 1", function(result)
    if result[1] == nil then
	QBCore.Functions.ExecuteSql(false, "UPDATE players SET discord = '"..discordId.."' WHERE `steam` = '"..steamId.."'", function(result)
	end)
	else
	end
    end)
end)

RegisterCommand(Config.Command, function(source, args)
	TriggerClientEvent("tota:client:notId", source)
	for k,v in pairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			identifier = v
	end
end
	steamId = identifier
	QBCore.Functions.ExecuteSql(false, "SELECT permid FROM players WHERE `steam` = '"..steamId.."'", function(result)
		permanentId = result[1].permid
		TriggerClientEvent("tota:client:getId",source, permanentId, isShown)
	end)
end)