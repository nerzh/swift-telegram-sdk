// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a sticker.

 SeeAlso Telegram Bot API Reference:
 [Sticker](https://core.telegram.org/bots/api#sticker)
 */

public enum TGStickerType: String, Codable {
    case regular = "regular"
    case mask = "mask"
    case customEmoji = "custom_emoji"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGStickerType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}