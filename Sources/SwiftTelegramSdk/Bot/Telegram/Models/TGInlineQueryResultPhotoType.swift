// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to a photo. By default, this photo will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultPhoto](https://core.telegram.org/bots/api#inlinequeryresultphoto)
 */

public enum TGInlineQueryResultPhotoType: String, Codable {
    case photo = "photo"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultPhotoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}