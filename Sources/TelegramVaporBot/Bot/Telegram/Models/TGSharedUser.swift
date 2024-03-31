// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object contains information about a user that was shared with the bot using a KeyboardButtonRequestUser button.

 SeeAlso Telegram Bot API Reference:
 [SharedUser](https://core.telegram.org/bots/api#shareduser)
 **/
public final class TGSharedUser: Codable {

    /// Custom keys for coding/decoding `SharedUser` struct
    public enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case username = "username"
        case photo = "photo"
    }

    /// Identifier of the shared user. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so 64-bit integers or double-precision float types are safe for storing these identifiers. The bot may not have access to the user and could be unable to use this identifier, unless the user is already known to the bot by some other means.
    public var userId: Int64

    /// Optional. First name of the user, if the name was requested by the bot
    public var firstName: String?

    /// Optional. Last name of the user, if the name was requested by the bot
    public var lastName: String?

    /// Optional. Username of the user, if the username was requested by the bot
    public var username: String?

    /// Optional. Available sizes of the chat photo, if the photo was requested by the bot
    public var photo: [TGPhotoSize]?

    public init (userId: Int64, firstName: String? = nil, lastName: String? = nil, username: String? = nil, photo: [TGPhotoSize]? = nil) {
        self.userId = userId
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.photo = photo
    }
}
