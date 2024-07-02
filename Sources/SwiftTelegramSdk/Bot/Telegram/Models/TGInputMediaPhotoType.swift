// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a photo to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaPhoto](https://core.telegram.org/bots/api#inputmediaphoto)
 */

public enum TGInputMediaPhotoType: String, Codable {
    case photo = "photo"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputMediaPhotoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}