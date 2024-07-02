// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to a sticker stored on the Telegram servers. By default, this sticker will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the sticker.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedSticker](https://core.telegram.org/bots/api#inlinequeryresultcachedsticker)
 */

public enum TGInlineQueryResultCachedStickerType: String, Codable {
    case sticker = "sticker"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultCachedStickerType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}