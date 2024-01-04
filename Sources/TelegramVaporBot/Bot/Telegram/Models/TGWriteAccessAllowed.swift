// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a service message about a user allowing a bot to write messages after adding it to the attachment menu, launching a Web App from a link, or accepting an explicit request from a Web App sent by the method requestWriteAccess.

 SeeAlso Telegram Bot API Reference:
 [WriteAccessAllowed](https://core.telegram.org/bots/api#writeaccessallowed)
 **/
public final class TGWriteAccessAllowed: Codable {

    /// Custom keys for coding/decoding `WriteAccessAllowed` struct
    public enum CodingKeys: String, CodingKey {
        case fromRequest = "from_request"
        case webAppName = "web_app_name"
        case fromAttachmentMenu = "from_attachment_menu"
    }

    /// Optional. True, if the access was granted after the user accepted an explicit request from a Web App sent by the method requestWriteAccess
    public var fromRequest: Bool?

    /// Optional. Name of the Web App, if the access was granted when the Web App was launched from a link
    public var webAppName: String?

    /// Optional. True, if the access was granted when the bot was added to the attachment or side menu
    public var fromAttachmentMenu: Bool?

    public init (fromRequest: Bool? = nil, webAppName: String? = nil, fromAttachmentMenu: Bool? = nil) {
        self.fromRequest = fromRequest
        self.webAppName = webAppName
        self.fromAttachmentMenu = fromAttachmentMenu
    }
}
