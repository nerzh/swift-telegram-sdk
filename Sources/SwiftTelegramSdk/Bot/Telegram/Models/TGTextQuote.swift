// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object contains information about the quoted part of a message that is replied to by the given message.

 SeeAlso Telegram Bot API Reference:
 [TextQuote](https://core.telegram.org/bots/api#textquote)
 **/
public final class TGTextQuote: Codable {

    /// Custom keys for coding/decoding `TextQuote` struct
    public enum CodingKeys: String, CodingKey {
        case text = "text"
        case entities = "entities"
        case position = "position"
        case isManual = "is_manual"
    }

    /// Text of the quoted part of a message that is replied to by the given message
    public var text: String

    /// Optional. Special entities that appear in the quote. Currently, only bold, italic, underline, strikethrough, spoiler, and custom_emoji entities are kept in quotes.
    public var entities: [TGMessageEntity]?

    /// Approximate quote position in the original message in UTF-16 code units as specified by the sender
    public var position: Int

    /// Optional. True, if the quote was chosen manually by the message sender. Otherwise, the quote was added automatically by the server.
    public var isManual: Bool?

    public init (text: String, entities: [TGMessageEntity]? = nil, position: Int, isManual: Bool? = nil) {
        self.text = text
        self.entities = entities
        self.position = position
        self.isManual = isManual
    }
}
