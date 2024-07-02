// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes reply parameters for the message that is being sent.

 SeeAlso Telegram Bot API Reference:
 [ReplyParameters](https://core.telegram.org/bots/api#replyparameters)
 **/
public final class TGReplyParameters: Codable {

    /// Custom keys for coding/decoding `ReplyParameters` struct
    public enum CodingKeys: String, CodingKey {
        case messageId = "message_id"
        case chatId = "chat_id"
        case allowSendingWithoutReply = "allow_sending_without_reply"
        case quote = "quote"
        case quoteParseMode = "quote_parse_mode"
        case quoteEntities = "quote_entities"
        case quotePosition = "quote_position"
    }

    /// Identifier of the message that will be replied to in the current chat, or in the chat chat_id if it is specified
    public var messageId: Int

    /// Optional. If the message to be replied to is from a different chat, unique identifier for the chat or username of the channel (in the format @channelusername). Not supported for messages sent on behalf of a business account.
    public var chatId: TGChatId?

    /// Optional. Pass True if the message should be sent even if the specified message to be replied to is not found. Always False for replies in another chat or forum topic. Always True for messages sent on behalf of a business account.
    public var allowSendingWithoutReply: Bool?

    /// Optional. Quoted part of the message to be replied to; 0-1024 characters after entities parsing. The quote must be an exact substring of the message to be replied to, including bold, italic, underline, strikethrough, spoiler, and custom_emoji entities. The message will fail to send if the quote isn't found in the original message.
    public var quote: String?

    /// Optional. Mode for parsing entities in the quote. See formatting options for more details.
    public var quoteParseMode: String?

    /// Optional. A JSON-serialized list of special entities that appear in the quote. It can be specified instead of quote_parse_mode.
    public var quoteEntities: [TGMessageEntity]?

    /// Optional. Position of the quote in the original message in UTF-16 code units
    public var quotePosition: Int?

    public init (messageId: Int, chatId: TGChatId? = nil, allowSendingWithoutReply: Bool? = nil, quote: String? = nil, quoteParseMode: String? = nil, quoteEntities: [TGMessageEntity]? = nil, quotePosition: Int? = nil) {
        self.messageId = messageId
        self.chatId = chatId
        self.allowSendingWithoutReply = allowSendingWithoutReply
        self.quote = quote
        self.quoteParseMode = quoteParseMode
        self.quoteEntities = quoteEntities
        self.quotePosition = quotePosition
    }
}
