local webhookUrl = 'TON_WEBHOOK' -- Remplacez par l'URL de votre webhook Discord

AddEventHandler('playerDied', function(killer, reason, weapon)
    local playerName = GetPlayerName(source)
    local killerName = GetPlayerName(killer)

    -- Obtenir le nom de l'arme
    local weaponName = GetLabelText(GetDisplayNameFromVehicleModel(weapon))

    -- Créer le message à envoyer sur Discord
    local message = {
        {
            ["color"] = "15158332", -- Couleur du message (facultatif)
            ["title"] = "Joueur mort",
            ["description"] = string.format("Le joueur **%s** est mort. Tuer : **%s** (Arme : **%s**)", playerName, killerName, weaponName),
            ["footer"] = {
                ["text"] = "FiveM Death Logs"
            }
        }
    }

    -- Convertir le message en JSON
    local jsonData = json.encode(message)

    -- Envoyer le message sur Discord via le webhook
    PerformHttpRequest(webhookUrl, function(statusCode, response, headers) end, 'POST', jsonData, { ['Content-Type'] = 'application/json' })
end)