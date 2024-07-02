// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents type of a poll, which is allowed to be created and sent when the corresponding button is pressed.

 SeeAlso Telegram Bot API Reference:
 [KeyboardButtonPollType](https://core.telegram.org/bots/api#keyboardbuttonpolltype)
 **/
public final class TGKeyboardButtonPollType: Codable {

    /// Custom keys for coding/decoding `KeyboardButtonPollType` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Optional. If quiz is passed, the user will be allowed to create only polls in the quiz mode. If regular is passed, only regular polls will be allowed. Otherwise, the user will be allowed to create a poll of any type.
    public var type: String?

    public init (type: String? = nil) {
        self.type = type
    }
}
