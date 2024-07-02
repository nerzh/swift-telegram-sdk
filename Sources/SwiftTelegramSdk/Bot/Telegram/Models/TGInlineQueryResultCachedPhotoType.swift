// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to a photo stored on the Telegram servers. By default, this photo will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedPhoto](https://core.telegram.org/bots/api#inlinequeryresultcachedphoto)
 */

public enum TGInlineQueryResultCachedPhotoType: String, Codable {
    case photo = "photo"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultCachedPhotoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}