// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a join request sent to a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatJoinRequest](https://core.telegram.org/bots/api#chatjoinrequest)
 */
public final class TGChatJoinRequest: Codable {

    /// Custom keys for coding/decoding `ChatJoinRequest` struct
    public enum CodingKeys: String, CodingKey {
        case chat = "chat"
        case from = "from"
        case date = "date"
        case bio = "bio"
        case inviteLink = "invite_link"
    }

    /// Chat to which the request was sent
    public var chat: TGChat

    /// User that sent the join request
    public var from: TGUser

    /// Date the request was sent in Unix time
    public var date: Int

    /// Optional. Bio of the user.
    public var bio: String?

    /// Optional. Chat invite link that was used by the user to send the join request
    public var inviteLink: TGChatInviteLink?

    public init (chat: TGChat, from: TGUser, date: Int, bio: String? = nil, inviteLink: TGChatInviteLink? = nil) {
        self.chat = chat
        self.from = from
        self.date = date
        self.bio = bio
        self.inviteLink = inviteLink
    }
}
