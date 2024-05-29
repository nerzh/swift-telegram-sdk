// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Describes that no specific value for the menu button was set.

 SeeAlso Telegram Bot API Reference:
 [MenuButtonDefault](https://core.telegram.org/bots/api#menubuttondefault)
 */

public enum TGMenuButtonDefaultType: String, Codable {
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGMenuButtonDefaultType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}