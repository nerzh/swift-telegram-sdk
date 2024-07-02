// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering all group and supergroup chats.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeAllGroupChats](https://core.telegram.org/bots/api#botcommandscopeallgroupchats)
 */

public enum TGBotCommandScopeAllGroupChatsType: String, Codable {
    case allGroupChats = "all_group_chats"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBotCommandScopeAllGroupChatsType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}