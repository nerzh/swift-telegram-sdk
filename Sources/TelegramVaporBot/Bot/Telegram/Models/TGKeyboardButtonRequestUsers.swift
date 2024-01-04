// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object defines the criteria used to request suitable users. The identifiers of the selected users will be shared with the bot when the corresponding button is pressed. More about requesting users »

 SeeAlso Telegram Bot API Reference:
 [KeyboardButtonRequestUsers](https://core.telegram.org/bots/api#keyboardbuttonrequestusers)
 **/
public final class TGKeyboardButtonRequestUsers: Codable {

    /// Custom keys for coding/decoding `KeyboardButtonRequestUsers` struct
    public enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case userIsBot = "user_is_bot"
        case userIsPremium = "user_is_premium"
        case maxQuantity = "max_quantity"
    }

    /// Signed 32-bit identifier of the request that will be received back in the UsersShared object. Must be unique within the message
    public var requestId: Int

    /// Optional. Pass True to request bots, pass False to request regular users. If not specified, no additional restrictions are applied.
    public var userIsBot: Bool?

    /// Optional. Pass True to request premium users, pass False to request non-premium users. If not specified, no additional restrictions are applied.
    public var userIsPremium: Bool?

    /// Optional. The maximum number of users to be selected; 1-10. Defaults to 1.
    public var maxQuantity: Int?

    public init (requestId: Int, userIsBot: Bool? = nil, userIsPremium: Bool? = nil, maxQuantity: Int? = nil) {
        self.requestId = requestId
        self.userIsBot = userIsBot
        self.userIsPremium = userIsPremium
        self.maxQuantity = maxQuantity
    }
}
