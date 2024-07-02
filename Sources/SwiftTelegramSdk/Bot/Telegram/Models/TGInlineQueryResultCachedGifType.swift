// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to an animated GIF file stored on the Telegram servers. By default, this animated GIF file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with specified content instead of the animation.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedGif](https://core.telegram.org/bots/api#inlinequeryresultcachedgif)
 */

public enum TGInlineQueryResultCachedGifType: String, Codable {
    case gif = "gif"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultCachedGifType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}