// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a chat member that was banned in the chat and can't return to the chat or view chat messages.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberBanned](https://core.telegram.org/bots/api#chatmemberbanned)
 **/
public final class TGChatMemberBanned: Codable {

    /// Custom keys for coding/decoding `ChatMemberBanned` struct
    public enum CodingKeys: String, CodingKey {
        case status = "status"
        case user = "user"
        case untilDate = "until_date"
    }

    /// The member's status in the chat, always “kicked”
    public var status: String

    /// Information about the user
    public var user: TGUser

    /// Date when restrictions will be lifted for this user; Unix time. If 0, then the user is banned forever
    public var untilDate: Int

    public init (status: String, user: TGUser, untilDate: Int) {
        self.status = status
        self.user = user
        self.untilDate = untilDate
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let status = try container.decode(String.self, forKey: .status)
        guard status == "kicked" else {
            throw DecodingError
                .dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Wrong status value"
                    )
                )
        }
        self.status = status
        self.user = try container.decode(TGUser.self, forKey: .user)
        self.untilDate = try container.decode(Int.self, forKey: .untilDate)
    }

}
