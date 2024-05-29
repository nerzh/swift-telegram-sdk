// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering a specific chat.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeChat](https://core.telegram.org/bots/api#botcommandscopechat)
 */

public enum TGBotCommandScopeChatType: String, Codable {
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBotCommandScopeChatType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}