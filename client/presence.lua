AddEventHandler('onResourceStart', function (resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    if Config.applicationId == nil or Config.applicationId == '' then
        print('[lp-discord] Error: No applicationId set, did you forget to restart the resource after editing?')
        CancelEvent()
        return
    else
        print('[lp-discord] Rich Presence successfully started')
    end
end)

SetDiscordAppId(Config.applicationId)
SetRichPresence(Config.richPresence)
SetDiscordRichPresenceAsset(Config.discordRichPresenceAsset)
SetDiscordRichPresenceAssetText(Config.discordRichPresenceAssetText)
SetDiscordRichPresenceAssetSmall(Config.discordRichPresenceAssetSmall)
SetDiscordRichPresenceAssetSmallText(Config.discordRichPresenceAssetSmallText)

print(GetConvar('sv_projectName', '[lp-discord] No hostname configured'))