// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to a page containing an embedded video player or a video file. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.
 If an InlineQueryResultVideo message contains an embedded video (e.g., YouTube), you must replace its content using input_message_content.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultVideo](https://core.telegram.org/bots/api#inlinequeryresultvideo)
 */

public enum TGInlineQueryResultVideoType: String, Codable {
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultVideoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}