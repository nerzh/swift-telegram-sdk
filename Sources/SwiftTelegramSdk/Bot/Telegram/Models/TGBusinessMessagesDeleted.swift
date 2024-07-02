// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object is received when messages are deleted from a connected business account.

 SeeAlso Telegram Bot API Reference:
 [BusinessMessagesDeleted](https://core.telegram.org/bots/api#businessmessagesdeleted)
 **/
public final class TGBusinessMessagesDeleted: Codable {

    /// Custom keys for coding/decoding `BusinessMessagesDeleted` struct
    public enum CodingKeys: String, CodingKey {
        case businessConnectionId = "business_connection_id"
        case chat = "chat"
        case messageIds = "message_ids"
    }

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// Information about a chat in the business account. The bot may not have access to the chat or the corresponding user.
    public var chat: TGChat

    /// The list of identifiers of deleted messages in the chat of the business account
    public var messageIds: [Int]

    public init (businessConnectionId: String, chat: TGChat, messageIds: [Int]) {
        self.businessConnectionId = businessConnectionId
        self.chat = chat
        self.messageIds = messageIds
    }
}
