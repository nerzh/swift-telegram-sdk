// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to an animated GIF file. By default, this animated GIF file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultGif](https://core.telegram.org/bots/api#inlinequeryresultgif)
 */

public enum TGInlineQueryResultGifType: String, Codable {
    case gif = "gif"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultGifType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}