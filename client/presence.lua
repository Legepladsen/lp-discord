local function initialSetup () 
    SetDiscordAppId(Config.applicationId)
    SetRichPresence(Config.richPresence)
    SetDiscordRichPresenceAsset(Config.discordRichPresenceAsset)
    SetDiscordRichPresenceAssetText(Config.discordRichPresenceAssetText)
    SetDiscordRichPresenceAssetSmall(Config.discordRichPresenceAssetSmall)
    SetDiscordRichPresenceAssetSmallText(Config.discordRichPresenceAssetSmallText)
end

---@class Presence The objects that must be passed as an object when wanting to update the users presence
---@field Activity string
---@field AssetText string
---@field AssetSmallText string

---@param presence Presence
function UpdatePresence(presence)
    SetRichPresence(presence.Activity)
    SetDiscordRichPresenceAssetText(presence.AssetText)
    SetDiscordRichPresenceAssetSmallText(presence.AssetSmallText)
end

RegisterNUICallback('updateUserPresence', function(data, cb)
    local presence = {
        Activity = data.Activity,
        AssetText = data.AssetText,
        AssetSmallText = data.AssetSmallText
    }
    UpdatePresence(presence)
end)

AddEventHandler('onResourceStart', function (resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    if Config.applicationId == nil or Config.applicationId == '' then
        print('[lp-discord] Error: No applicationId set, did you forget to restart the resource after editing?')
        return
    else
        initialSetup()
        print('[lp-discord] Rich Presence successfully started')
    end
end)