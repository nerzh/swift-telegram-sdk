// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The background is a freeform gradient that rotates after every message in the chat.

 SeeAlso Telegram Bot API Reference:
 [BackgroundFillFreeformGradient](https://core.telegram.org/bots/api#backgroundfillfreeformgradient)
 */

public enum TGBackgroundFillFreeformGradientType: String, Codable {
    case freeformGradient = "freeform_gradient"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBackgroundFillFreeformGradientType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}