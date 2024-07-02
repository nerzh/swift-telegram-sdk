// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the content of a text message to be sent as the result of an inline query.

 SeeAlso Telegram Bot API Reference:
 [InputTextMessageContent](https://core.telegram.org/bots/api#inputtextmessagecontent)
 **/
public final class TGInputTextMessageContent: Codable {

    /// Custom keys for coding/decoding `InputTextMessageContent` struct
    public enum CodingKeys: String, CodingKey {
        case messageText = "message_text"
        case parseMode = "parse_mode"
        case entities = "entities"
        case linkPreviewOptions = "link_preview_options"
    }

    /// Text of the message to be sent, 1-4096 characters
    public var messageText: String

    /// Optional. Mode for parsing entities in the message text. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in message text, which can be specified instead of parse_mode
    public var entities: [TGMessageEntity]?

    /// Optional. Link preview generation options for the message
    public var linkPreviewOptions: TGLinkPreviewOptions?

    public init (messageText: String, parseMode: String? = nil, entities: [TGMessageEntity]? = nil, linkPreviewOptions: TGLinkPreviewOptions? = nil) {
        self.messageText = messageText
        self.parseMode = parseMode
        self.entities = entities
        self.linkPreviewOptions = linkPreviewOptions
    }
}
