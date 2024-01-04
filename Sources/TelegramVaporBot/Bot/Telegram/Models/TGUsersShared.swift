// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object contains information about the users whose identifiers were shared with the bot using a KeyboardButtonRequestUsers button.

 SeeAlso Telegram Bot API Reference:
 [UsersShared](https://core.telegram.org/bots/api#usersshared)
 **/
public final class TGUsersShared: Codable {

    /// Custom keys for coding/decoding `UsersShared` struct
    public enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case userIds = "user_ids"
    }

    /// Identifier of the request
    public var requestId: Int

    /// Identifiers of the shared users. These numbers may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting them. But they have at most 52 significant bits, so 64-bit integers or double-precision float types are safe for storing these identifiers. The bot may not have access to the users and could be unable to use these identifiers, unless the users are already known to the bot by some other means.
    public var userIds: [Int]

    public init (requestId: Int, userIds: [Int]) {
        self.requestId = requestId
        self.userIds = userIds
    }
}
