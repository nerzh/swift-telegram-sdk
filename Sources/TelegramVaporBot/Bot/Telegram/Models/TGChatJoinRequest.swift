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
        case userChatId = "user_chat_id"
        case date = "date"
        case bio = "bio"
        case inviteLink = "invite_link"
    }

    /// Chat to which the request was sent
    public var chat: TGChat

    /// User that sent the join request
    public var from: TGUser

    /// Identifier of a private chat with the user who sent the join request. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. The bot can use this identifier for 24 hours to send messages until the join request is processed, assuming no other administrator contacted the user.
    public var userChatId: Int64

    /// Date the request was sent in Unix time
    public var date: Int

    /// Optional. Bio of the user.
    public var bio: String?

    /// Optional. Chat invite link that was used by the user to send the join request
    public var inviteLink: TGChatInviteLink?

    public init (chat: TGChat, from: TGUser, userChatId: Int64, date: Int, bio: String? = nil, inviteLink: TGChatInviteLink? = nil) {
        self.chat = chat
        self.from = from
        self.userChatId = userChatId
        self.date = date
        self.bio = bio
        self.inviteLink = inviteLink
    }
}
