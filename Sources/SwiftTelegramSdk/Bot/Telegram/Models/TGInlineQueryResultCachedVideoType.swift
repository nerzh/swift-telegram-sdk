// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to a video file stored on the Telegram servers. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedVideo](https://core.telegram.org/bots/api#inlinequeryresultcachedvideo)
 */

public enum TGInlineQueryResultCachedVideoType: String, Codable {
    case video = "video"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultCachedVideoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}