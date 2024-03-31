// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object defines the criteria used to request suitable users. Information about the selected users will be shared with the bot when the corresponding button is pressed. More about requesting users »

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
        case requestName = "request_name"
        case requestUsername = "request_username"
        case requestPhoto = "request_photo"
    }

    /// Signed 32-bit identifier of the request that will be received back in the UsersShared object. Must be unique within the message
    public var requestId: Int

    /// Optional. Pass True to request bots, pass False to request regular users. If not specified, no additional restrictions are applied.
    public var userIsBot: Bool?

    /// Optional. Pass True to request premium users, pass False to request non-premium users. If not specified, no additional restrictions are applied.
    public var userIsPremium: Bool?

    /// Optional. The maximum number of users to be selected; 1-10. Defaults to 1.
    public var maxQuantity: Int?

    /// Optional. Pass True to request the users' first and last name
    public var requestName: Bool?

    /// Optional. Pass True to request the users' username
    public var requestUsername: Bool?

    /// Optional. Pass True to request the users' photo
    public var requestPhoto: Bool?

    public init (requestId: Int, userIsBot: Bool? = nil, userIsPremium: Bool? = nil, maxQuantity: Int? = nil, requestName: Bool? = nil, requestUsername: Bool? = nil, requestPhoto: Bool? = nil) {
        self.requestId = requestId
        self.userIsBot = userIsBot
        self.userIsPremium = userIsPremium
        self.maxQuantity = maxQuantity
        self.requestName = requestName
        self.requestUsername = requestUsername
        self.requestPhoto = requestPhoto
    }
}
