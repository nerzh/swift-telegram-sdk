// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents reaction changes on a message with anonymous reactions.

 SeeAlso Telegram Bot API Reference:
 [MessageReactionCountUpdated](https://core.telegram.org/bots/api#messagereactioncountupdated)
 **/
public final class TGMessageReactionCountUpdated: Codable {

    /// Custom keys for coding/decoding `MessageReactionCountUpdated` struct
    public enum CodingKeys: String, CodingKey {
        case chat = "chat"
        case messageId = "message_id"
        case date = "date"
        case reactions = "reactions"
    }

    /// The chat containing the message
    public var chat: TGChat

    /// Unique message identifier inside the chat
    public var messageId: Int

    /// Date of the change in Unix time
    public var date: Int

    /// List of reactions that are present on the message
    public var reactions: [TGReactionCount]

    public init (chat: TGChat, messageId: Int, date: Int, reactions: [TGReactionCount]) {
        self.chat = chat
        self.messageId = messageId
        self.date = date
        self.reactions = reactions
    }
}
