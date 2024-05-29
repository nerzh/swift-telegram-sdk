// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents the default scope of bot commands. Default commands are used if no commands with a narrower scope are specified for the user.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeDefault](https://core.telegram.org/bots/api#botcommandscopedefault)
 */

public enum TGBotCommandScopeDefaultType: String, Codable {
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBotCommandScopeDefaultType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}