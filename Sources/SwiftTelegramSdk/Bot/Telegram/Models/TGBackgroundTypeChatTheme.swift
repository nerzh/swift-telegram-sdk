// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The background is taken directly from a built-in chat theme.

 SeeAlso Telegram Bot API Reference:
 [BackgroundTypeChatTheme](https://core.telegram.org/bots/api#backgroundtypechattheme)
 **/
public final class TGBackgroundTypeChatTheme: Codable {

    /// Custom keys for coding/decoding `BackgroundTypeChatTheme` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case themeName = "theme_name"
    }

    /// Type of the background, always “chat_theme”
    public var type: TGBackgroundTypeChatThemeType

    /// Name of the chat theme, which is usually an emoji
    public var themeName: String

    public init (type: TGBackgroundTypeChatThemeType, themeName: String) {
        self.type = type
        self.themeName = themeName
    }
}
