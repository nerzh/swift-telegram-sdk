// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object contains information about the user whose identifier was shared with the bot using a KeyboardButtonRequestUser button.

 SeeAlso Telegram Bot API Reference:
 [UserShared](https://core.telegram.org/bots/api#usershared)
 */
public final class TGUserShared: Codable {

    /// Custom keys for coding/decoding `UserShared` struct
    public enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case userId = "user_id"
    }

    /// Identifier of the request
    public var requestId: Int

    /// Identifier of the shared user. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. The bot may not have access to the user and could be unable to use this identifier, unless the user is already known to the bot by some other means.
    public var userId: Int64

    public init (requestId: Int, userId: Int64) {
        self.requestId = requestId
        self.userId = userId
    }
}
