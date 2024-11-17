// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a unique message identifier.

 SeeAlso Telegram Bot API Reference:
 [MessageId](https://core.telegram.org/bots/api#messageid)
 **/
public final class TGMessageId: Codable {

    /// Custom keys for coding/decoding `MessageId` struct
    public enum CodingKeys: String, CodingKey {
        case messageId = "message_id"
    }

    /// Unique message identifier. In specific instances (e.g., message containing a video sent to a big chat), the server might automatically schedule a message instead of sending it immediately. In such cases, this field will be 0 and the relevant message will be unusable until it is actually sent
    public var messageId: Int

    public init (messageId: Int) {
        self.messageId = messageId
    }
}
