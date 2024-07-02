// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a chat background.

 SeeAlso Telegram Bot API Reference:
 [ChatBackground](https://core.telegram.org/bots/api#chatbackground)
 **/
public final class TGChatBackground: Codable {

    /// Custom keys for coding/decoding `ChatBackground` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Type of the background
    public var type: TGBackgroundType

    public init (type: TGBackgroundType) {
        self.type = type
    }
}
