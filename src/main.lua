commands:Register("pm", function(playerid, args, argsCount, silent)
    local sender = GetPlayer(playerid)
    if not sender then return end
    local sendername = sender:GetName()
    
    local reciver = GetPlayerId(args[1])
    if reciver == -1 then
        sender:SendMsg(MessageType.Chat, FetchTranslation("privatemessages.PlayerNotFound"))
        return
    end

    table.remove(args, 1)
    local message = table.concat(args, " ")

    if reciver == playerid then
        sender:SendMsg(MessageType.Chat, FetchTranslation("privatemessages.PlayerSendYourself"))
        return
    end

    local reciver = GetPlayer(reciver)
    if not reciver then return end
    local recivername = reciver:GetName()

    if argsCount < 2 then 
        sender:SendMsg(MessageType.Chat, FetchTranslation("privatemessages.NotEnoughArgsChat")) 
        sender:SendMsg(MessageType.Console, FetchTranslation("privatemessages.NotEnoughArgsConsole")) 
        return
    end

    reciver:SendMsg(MessageType.Chat, string.format(FetchTranslation("privatemessages.RevicedPM"), sendername, message))
    sender:SendMsg(MessageType.Chat, string.format(FetchTranslation("privatemessages.SentPM"), recivername, message))
end)

function GetPluginAuthor()
    return "Swiftly Solution"
end
function GetPluginVersion()
    return "v1.0.0"
end
function GetPluginName()
    return "Swiftly Private Messages (LUA)"
end
function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_pm"
end