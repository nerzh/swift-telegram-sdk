// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a menu button, which opens the bot's list of commands.

 SeeAlso Telegram Bot API Reference:
 [MenuButtonCommands](https://core.telegram.org/bots/api#menubuttoncommands)
 */

public enum TGMenuButtonCommandsType: String, Codable {
    case commands = "commands"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGMenuButtonCommandsType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}