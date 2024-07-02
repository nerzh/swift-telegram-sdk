// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The background is a gradient fill.

 SeeAlso Telegram Bot API Reference:
 [BackgroundFillGradient](https://core.telegram.org/bots/api#backgroundfillgradient)
 */

public enum TGBackgroundFillGradientType: String, Codable {
    case gradient = "gradient"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBackgroundFillGradientType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}