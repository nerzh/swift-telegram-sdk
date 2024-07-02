// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to a video animation (H.264/MPEG-4 AVC video without sound). By default, this animated MPEG-4 file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultMpeg4Gif](https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif)
 */

public enum TGInlineQueryResultMpeg4GifType: String, Codable {
    case mpeg4Gif = "mpeg4_gif"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultMpeg4GifType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}