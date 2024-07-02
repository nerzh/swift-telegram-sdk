// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a menu button, which launches a Web App.

 SeeAlso Telegram Bot API Reference:
 [MenuButtonWebApp](https://core.telegram.org/bots/api#menubuttonwebapp)
 */

public enum TGMenuButtonWebAppType: String, Codable {
    case webApp = "web_app"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGMenuButtonWebAppType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}