// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The background is automatically filled based on the selected colors.

 SeeAlso Telegram Bot API Reference:
 [BackgroundTypeFill](https://core.telegram.org/bots/api#backgroundtypefill)
 */

public enum TGBackgroundTypeFillType: String, Codable {
    case fill = "fill"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBackgroundTypeFillType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}