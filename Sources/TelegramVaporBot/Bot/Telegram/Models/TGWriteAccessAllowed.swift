// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a service message about a user allowing a bot to write messages after adding the bot to the attachment menu or launching a Web App from a link.

 SeeAlso Telegram Bot API Reference:
 [WriteAccessAllowed](https://core.telegram.org/bots/api#writeaccessallowed)
 */
public final class TGWriteAccessAllowed: Codable {

    /// Custom keys for coding/decoding `WriteAccessAllowed` struct
    public enum CodingKeys: String, CodingKey {
        case webAppName = "web_app_name"
    }

    /// Optional. Name of the Web App which was launched from a link
    public var webAppName: String?

    public init (webAppName: String? = nil) {
        self.webAppName = webAppName
    }
}
