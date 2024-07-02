// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The message was originally sent on behalf of a chat to a group chat.

 SeeAlso Telegram Bot API Reference:
 [MessageOriginChat](https://core.telegram.org/bots/api#messageoriginchat)
 **/
public final class TGMessageOriginChat: Codable {

    /// Custom keys for coding/decoding `MessageOriginChat` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case date = "date"
        case senderChat = "sender_chat"
        case authorSignature = "author_signature"
    }

    /// Type of the message origin, always “chat”
    public var type: TGMessageOriginChatType

    /// Date the message was sent originally in Unix time
    public var date: Int

    /// Chat that sent the message originally
    public var senderChat: TGChat

    /// Optional. For messages originally sent by an anonymous chat administrator, original message author signature
    public var authorSignature: String?

    public init (type: TGMessageOriginChatType, date: Int, senderChat: TGChat, authorSignature: String? = nil) {
        self.type = type
        self.date = date
        self.senderChat = senderChat
        self.authorSignature = authorSignature
    }
}
