// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The paid media to send is a photo.

 SeeAlso Telegram Bot API Reference:
 [InputPaidMediaPhoto](https://core.telegram.org/bots/api#inputpaidmediaphoto)
 */

public enum TGInputPaidMediaPhotoType: String, Codable {
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputPaidMediaPhotoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}