// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The background is taken directly from a built-in chat theme.

 SeeAlso Telegram Bot API Reference:
 [BackgroundTypeChatTheme](https://core.telegram.org/bots/api#backgroundtypechattheme)
 */

public enum TGBackgroundTypeChatThemeType: String, Codable {
    case chatTheme = "chat_theme"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBackgroundTypeChatThemeType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}