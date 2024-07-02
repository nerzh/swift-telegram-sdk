// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents the bot's name.

 SeeAlso Telegram Bot API Reference:
 [BotName](https://core.telegram.org/bots/api#botname)
 **/
public final class TGBotName: Codable {

    /// Custom keys for coding/decoding `BotName` struct
    public enum CodingKeys: String, CodingKey {
        case name = "name"
    }

    /// The bot's name
    public var name: String

    public init (name: String) {
        self.name = name
    }
}
