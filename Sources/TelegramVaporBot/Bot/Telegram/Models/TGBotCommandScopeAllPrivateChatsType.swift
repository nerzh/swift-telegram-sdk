// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering all private chats.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeAllPrivateChats](https://core.telegram.org/bots/api#botcommandscopeallprivatechats)
 */

public enum TGBotCommandScopeAllPrivateChatsType: String, Codable {
    case allPrivateChats = "all_private_chats"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBotCommandScopeAllPrivateChatsType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}