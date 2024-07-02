// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering all group and supergroup chat administrators.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeAllChatAdministrators](https://core.telegram.org/bots/api#botcommandscopeallchatadministrators)
 **/
public final class TGBotCommandScopeAllChatAdministrators: Codable {

    /// Custom keys for coding/decoding `BotCommandScopeAllChatAdministrators` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Scope type, must be all_chat_administrators
    public var type: TGBotCommandScopeAllChatAdministratorsType

    public init (type: TGBotCommandScopeAllChatAdministratorsType) {
        self.type = type
    }
}
