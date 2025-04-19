// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a chat member that owns the chat and has all administrator privileges.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberOwner](https://core.telegram.org/bots/api#chatmemberowner)
 **/
public final class TGChatMemberOwner: Codable {

    /// Custom keys for coding/decoding `ChatMemberOwner` struct
    public enum CodingKeys: String, CodingKey {
        case status = "status"
        case user = "user"
        case isAnonymous = "is_anonymous"
        case customTitle = "custom_title"
    }

    /// The member's status in the chat, always “creator”
    public var status: String

    /// Information about the user
    public var user: TGUser

    /// True, if the user's presence in the chat is hidden
    public var isAnonymous: Bool

    /// Optional. Custom title for this user
    public var customTitle: String?

    public init (status: String, user: TGUser, isAnonymous: Bool, customTitle: String? = nil) {
        self.status = status
        self.user = user
        self.isAnonymous = isAnonymous
        self.customTitle = customTitle
    }


    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let status = try container.decode(String.self, forKey: .status)
        guard status == "creator" else {
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
        self.isAnonymous = try container.decode(Bool.self, forKey: .isAnonymous)
        self.customTitle = try container.decodeIfPresent(String.self, forKey: .customTitle)
    }

}
