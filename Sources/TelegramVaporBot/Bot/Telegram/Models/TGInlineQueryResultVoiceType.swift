// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to a voice recording in an .OGG container encoded with OPUS. By default, this voice recording will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the the voice message.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultVoice](https://core.telegram.org/bots/api#inlinequeryresultvoice)
 */

public enum TGInlineQueryResultVoiceType: String, Codable {
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultVoiceType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}