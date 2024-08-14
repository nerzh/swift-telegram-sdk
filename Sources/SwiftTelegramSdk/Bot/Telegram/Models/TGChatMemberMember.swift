// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a chat member that has no additional privileges or restrictions.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberMember](https://core.telegram.org/bots/api#chatmembermember)
 **/
public final class TGChatMemberMember: Codable {

    /// Custom keys for coding/decoding `ChatMemberMember` struct
    public enum CodingKeys: String, CodingKey {
        case status = "status"
        case user = "user"
        case untilDate = "until_date"
    }

    /// The member's status in the chat, always “member”
    public var status: String

    /// Information about the user
    public var user: TGUser

    /// Optional. Date when the user's subscription will expire; Unix time
    public var untilDate: Int?

    public init (status: String, user: TGUser, untilDate: Int? = nil) {
        self.status = status
        self.user = user
        self.untilDate = untilDate
    }
}
