// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to a file stored on the Telegram servers. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedDocument](https://core.telegram.org/bots/api#inlinequeryresultcacheddocument)
 */

public enum TGInlineQueryResultCachedDocumentType: String, Codable {
    case document = "document"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultCachedDocumentType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}