// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a change of a reaction on a message performed by a user.

 SeeAlso Telegram Bot API Reference:
 [MessageReactionUpdated](https://core.telegram.org/bots/api#messagereactionupdated)
 **/
public final class TGMessageReactionUpdated: Codable {

    /// Custom keys for coding/decoding `MessageReactionUpdated` struct
    public enum CodingKeys: String, CodingKey {
        case chat = "chat"
        case messageId = "message_id"
        case user = "user"
        case actorChat = "actor_chat"
        case date = "date"
        case oldReaction = "old_reaction"
        case newReaction = "new_reaction"
    }

    /// The chat containing the message the user reacted to
    public var chat: TGChat

    /// Unique identifier of the message inside the chat
    public var messageId: Int

    /// Optional. The user that changed the reaction, if the user isn't anonymous
    public var user: TGUser?

    /// Optional. The chat on behalf of which the reaction was changed, if the user is anonymous
    public var actorChat: TGChat?

    /// Date of the change in Unix time
    public var date: Int

    /// Previous list of reaction types that were set by the user
    public var oldReaction: [TGReactionType]

    /// New list of reaction types that have been set by the user
    public var newReaction: [TGReactionType]

    public init (chat: TGChat, messageId: Int, user: TGUser? = nil, actorChat: TGChat? = nil, date: Int, oldReaction: [TGReactionType], newReaction: [TGReactionType]) {
        self.chat = chat
        self.messageId = messageId
        self.user = user
        self.actorChat = actorChat
        self.date = date
        self.oldReaction = oldReaction
        self.newReaction = newReaction
    }
}
