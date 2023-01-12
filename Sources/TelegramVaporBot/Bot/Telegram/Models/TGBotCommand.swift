// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a bot command.

 SeeAlso Telegram Bot API Reference:
 [BotCommand](https://core.telegram.org/bots/api#botcommand)
 */
public final class TGBotCommand: Codable {

    /// Custom keys for coding/decoding `BotCommand` struct
    public enum CodingKeys: String, CodingKey {
        case command = "command"
        case description = "description"
    }

    /// Text of the command; 1-32 characters. Can contain only lowercase English letters, digits and underscores.
    public var command: String

    /// Description of the command; 1-256 characters.
    public var description: String

    public init (command: String, description: String) {
        self.command = command
        self.description = description
    }
}
