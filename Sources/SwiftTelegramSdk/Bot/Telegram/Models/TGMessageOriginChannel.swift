// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The message was originally sent to a channel chat.

 SeeAlso Telegram Bot API Reference:
 [MessageOriginChannel](https://core.telegram.org/bots/api#messageoriginchannel)
 **/
public final class TGMessageOriginChannel: Codable {

    /// Custom keys for coding/decoding `MessageOriginChannel` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case date = "date"
        case chat = "chat"
        case messageId = "message_id"
        case authorSignature = "author_signature"
    }

    /// Type of the message origin, always “channel”
    public var type: TGMessageOriginChannelType

    /// Date the message was sent originally in Unix time
    public var date: Int

    /// Channel chat to which the message was originally sent
    public var chat: TGChat

    /// Unique message identifier inside the chat
    public var messageId: Int

    /// Optional. Signature of the original post author
    public var authorSignature: String?

    public init (type: TGMessageOriginChannelType, date: Int, chat: TGChat, messageId: Int, authorSignature: String? = nil) {
        self.type = type
        self.date = date
        self.chat = chat
        self.messageId = messageId
        self.authorSignature = authorSignature
    }
}
