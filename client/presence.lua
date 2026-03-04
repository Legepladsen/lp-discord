local Presence = {
    Activity: string,
    AssetText: string,
    SmallAssetText: string,
}

AddEventHandler('onResourceStart', function (resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    if Config.applicationId == nil or Config.applicationId == '' then
        print('[lp-discord] Error: No applicationId set, did you forget to restart the resource after editing?')
        CancelEvent()
        return
    else
        initialSetup()
        print('[lp-discord] Rich Presence successfully started')
    end
end)

local function initialSetup () {
    SetDiscordAppId(Config.applicationId)
    SetRichPresence(Config.richPresence)
    SetDiscordRichPresenceAsset(Config.discordRichPresenceAsset)
    SetDiscordRichPresenceAssetText(Config.discordRichPresenceAssetText)
    SetDiscordRichPresenceAssetSmall(Config.discordRichPresenceAssetSmall)
    SetDiscordRichPresenceAssetSmallText(Config.discordRichPresenceAssetSmallText)
}

function UpdatePresence(presence:Presence) {
    SetRichPresence(presence.Activity)
    SetDiscordRichPresenceAssetText(presence.AssetText)
    SetDiscordRichPresenceAssetSmalltext(presence.SmallAssetText)
}