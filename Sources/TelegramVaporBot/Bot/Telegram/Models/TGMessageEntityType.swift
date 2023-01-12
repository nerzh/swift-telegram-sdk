// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.

 SeeAlso Telegram Bot API Reference:
 [MessageEntity](https://core.telegram.org/bots/api#messageentity)
 */

public enum TGMessageEntityType: String, Codable {
    case mention = "mention"
    case hashtag = "hashtag"
    case cashtag = "cashtag"
    case botCommand = "bot_command"
    case url = "url"
    case email = "email"
    case phoneNumber = "phone_number"
    case bold = "bold"
    case italic = "italic"
    case underline = "underline"
    case strikethrough = "strikethrough"
    case spoiler = "spoiler"
    case code = "code"
    case pre = "pre"
    case textLink = "text_link"
    case textMention = "text_mention"
    case customEmoji = "custom_emoji"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGMessageEntityType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}