// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers. By default, this animated MPEG-4 file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedMpeg4Gif](https://core.telegram.org/bots/api#inlinequeryresultcachedmpeg4gif)
 */

public enum TGInlineQueryResultCachedMpeg4GifType: String, Codable {
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultCachedMpeg4GifType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}