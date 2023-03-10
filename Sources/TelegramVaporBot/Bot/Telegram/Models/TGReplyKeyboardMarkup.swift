// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a custom keyboard with reply options (see Introduction to bots for details and examples).

 SeeAlso Telegram Bot API Reference:
 [ReplyKeyboardMarkup](https://core.telegram.org/bots/api#replykeyboardmarkup)
 */
public final class TGReplyKeyboardMarkup: Codable {

    /// Custom keys for coding/decoding `ReplyKeyboardMarkup` struct
    public enum CodingKeys: String, CodingKey {
        case keyboard = "keyboard"
        case isPersistent = "is_persistent"
        case resizeKeyboard = "resize_keyboard"
        case oneTimeKeyboard = "one_time_keyboard"
        case inputFieldPlaceholder = "input_field_placeholder"
        case selective = "selective"
    }

    /// Array of button rows, each represented by an Array of KeyboardButton objects
    public var keyboard: [[TGKeyboardButton]]

    /// Optional. Requests clients to always show the keyboard when the regular keyboard is hidden. Defaults to false, in which case the custom keyboard can be hidden and opened with a keyboard icon.
    public var isPersistent: Bool?

    /// Optional. Requests clients to resize the keyboard vertically for optimal fit (e.g., make the keyboard smaller if there are just two rows of buttons). Defaults to false, in which case the custom keyboard is always of the same height as the app's standard keyboard.
    public var resizeKeyboard: Bool?

    /// Optional. Requests clients to hide the keyboard as soon as it's been used. The keyboard will still be available, but clients will automatically display the usual letter-keyboard in the chat - the user can press a special button in the input field to see the custom keyboard again. Defaults to false.
    public var oneTimeKeyboard: Bool?

    /// Optional. The placeholder to be shown in the input field when the keyboard is active; 1-64 characters
    public var inputFieldPlaceholder: String?

    /// Optional. Use this parameter if you want to show the keyboard to specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.
    /// 
    /// Example: A user requests to change the bot's language, bot replies to the request with a keyboard to select the new language. Other users in the group don't see the keyboard.
    public var selective: Bool?

    public init (keyboard: [[TGKeyboardButton]], isPersistent: Bool? = nil, resizeKeyboard: Bool? = nil, oneTimeKeyboard: Bool? = nil, inputFieldPlaceholder: String? = nil, selective: Bool? = nil) {
        self.keyboard = keyboard
        self.isPersistent = isPersistent
        self.resizeKeyboard = resizeKeyboard
        self.oneTimeKeyboard = oneTimeKeyboard
        self.inputFieldPlaceholder = inputFieldPlaceholder
        self.selective = selective
    }
}
