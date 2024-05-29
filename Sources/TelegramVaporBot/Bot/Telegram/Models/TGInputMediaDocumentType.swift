// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a general file to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaDocument](https://core.telegram.org/bots/api#inputmediadocument)
 */

public enum TGInputMediaDocumentType: String, Codable {
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputMediaDocumentType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}