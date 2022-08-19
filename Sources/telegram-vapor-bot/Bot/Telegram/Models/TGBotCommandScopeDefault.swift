// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents the default scope of bot commands. Default commands are used if no commands with a narrower scope are specified for the user.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeDefault](https://core.telegram.org/bots/api#botcommandscopedefault)
 */
public final class TGBotCommandScopeDefault: Codable {

    /// Custom keys for coding/decoding `BotCommandScopeDefault` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Scope type, must be default
    public var type: String

    public init (type: String) {
        self.type = type
    }
}
