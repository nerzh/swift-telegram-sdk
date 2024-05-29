// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the contact.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultContact](https://core.telegram.org/bots/api#inlinequeryresultcontact)
 */

public enum TGInlineQueryResultContactType: String, Codable {
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultContactType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}