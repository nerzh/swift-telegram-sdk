// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents the bot's description.

 SeeAlso Telegram Bot API Reference:
 [BotDescription](https://core.telegram.org/bots/api#botdescription)
 **/
public final class TGBotDescription: Codable {

    /// Custom keys for coding/decoding `BotDescription` struct
    public enum CodingKeys: String, CodingKey {
        case description = "description"
    }

    /// The bot's description
    public var description: String

    public init (description: String) {
        self.description = description
    }
}
