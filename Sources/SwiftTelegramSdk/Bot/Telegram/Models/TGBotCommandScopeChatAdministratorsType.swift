// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering all administrators of a specific group or supergroup chat.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeChatAdministrators](https://core.telegram.org/bots/api#botcommandscopechatadministrators)
 */

public enum TGBotCommandScopeChatAdministratorsType: String, Codable {
    case chatAdministrators = "chat_administrators"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBotCommandScopeChatAdministratorsType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}