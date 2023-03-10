// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents one button of the reply keyboard. For simple text buttons, String can be used instead of this object to specify the button text. The optional fields web_app, request_user, request_chat, request_contact, request_location, and request_poll are mutually exclusive.

 SeeAlso Telegram Bot API Reference:
 [KeyboardButton](https://core.telegram.org/bots/api#keyboardbutton)
 */
public final class TGKeyboardButton: Codable {

    /// Custom keys for coding/decoding `KeyboardButton` struct
    public enum CodingKeys: String, CodingKey {
        case text = "text"
        case requestUser = "request_user"
        case requestChat = "request_chat"
        case requestContact = "request_contact"
        case requestLocation = "request_location"
        case requestPoll = "request_poll"
        case webApp = "web_app"
    }

    /// Text of the button. If none of the optional fields are used, it will be sent as a message when the button is pressed
    public var text: String

    /// Optional. If specified, pressing the button will open a list of suitable users. Tapping on any user will send their identifier to the bot in a “user_shared” service message. Available in private chats only.
    public var requestUser: TGKeyboardButtonRequestUser?

    /// Optional. If specified, pressing the button will open a list of suitable chats. Tapping on a chat will send its identifier to the bot in a “chat_shared” service message. Available in private chats only.
    public var requestChat: TGKeyboardButtonRequestChat?

    /// Optional. If True, the user's phone number will be sent as a contact when the button is pressed. Available in private chats only.
    public var requestContact: Bool?

    /// Optional. If True, the user's current location will be sent when the button is pressed. Available in private chats only.
    public var requestLocation: Bool?

    /// Optional. If specified, the user will be asked to create a poll and send it to the bot when the button is pressed. Available in private chats only.
    public var requestPoll: TGKeyboardButtonPollType?

    /// Optional. If specified, the described Web App will be launched when the button is pressed. The Web App will be able to send a “web_app_data” service message. Available in private chats only.
    public var webApp: TGWebAppInfo?

    public init (text: String, requestUser: TGKeyboardButtonRequestUser? = nil, requestChat: TGKeyboardButtonRequestChat? = nil, requestContact: Bool? = nil, requestLocation: Bool? = nil, requestPoll: TGKeyboardButtonPollType? = nil, webApp: TGWebAppInfo? = nil) {
        self.text = text
        self.requestUser = requestUser
        self.requestChat = requestChat
        self.requestContact = requestContact
        self.requestLocation = requestLocation
        self.requestPoll = requestPoll
        self.webApp = webApp
    }
}
