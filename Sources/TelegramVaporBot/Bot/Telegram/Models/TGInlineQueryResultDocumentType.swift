// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to a file. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file. Currently, only .PDF and .ZIP files can be sent using this method.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultDocument](https://core.telegram.org/bots/api#inlinequeryresultdocument)
 */

public enum TGInlineQueryResultDocumentType: String, Codable {
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultDocumentType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}