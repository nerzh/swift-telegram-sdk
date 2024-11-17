// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents an inline keyboard button that copies specified text to the clipboard.

 SeeAlso Telegram Bot API Reference:
 [CopyTextButton](https://core.telegram.org/bots/api#copytextbutton)
 **/
public final class TGCopyTextButton: Codable {

    /// Custom keys for coding/decoding `CopyTextButton` struct
    public enum CodingKeys: String, CodingKey {
        case text = "text"
    }

    /// The text to be copied to the clipboard; 1-256 characters
    public var text: String

    public init (text: String) {
        self.text = text
    }
}
