// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object defines the criteria used to request a suitable user. The identifier of the selected user will be shared with the bot when the corresponding button is pressed. More about requesting users »

 SeeAlso Telegram Bot API Reference:
 [KeyboardButtonRequestUser](https://core.telegram.org/bots/api#keyboardbuttonrequestuser)
 */
public final class TGKeyboardButtonRequestUser: Codable {

    /// Custom keys for coding/decoding `KeyboardButtonRequestUser` struct
    public enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case userIsBot = "user_is_bot"
        case userIsPremium = "user_is_premium"
    }

    /// Signed 32-bit identifier of the request, which will be received back in the UserShared object. Must be unique within the message
    public var requestId: Int

    /// Optional. Pass True to request a bot, pass False to request a regular user. If not specified, no additional restrictions are applied.
    public var userIsBot: Bool?

    /// Optional. Pass True to request a premium user, pass False to request a non-premium user. If not specified, no additional restrictions are applied.
    public var userIsPremium: Bool?

    public init (requestId: Int, userIsBot: Bool? = nil, userIsPremium: Bool? = nil) {
        self.requestId = requestId
        self.userIsBot = userIsBot
        self.userIsPremium = userIsPremium
    }
}
