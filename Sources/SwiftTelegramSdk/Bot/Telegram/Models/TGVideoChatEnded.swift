// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a service message about a video chat ended in the chat.

 SeeAlso Telegram Bot API Reference:
 [VideoChatEnded](https://core.telegram.org/bots/api#videochatended)
 **/
public final class TGVideoChatEnded: Codable {

    /// Custom keys for coding/decoding `VideoChatEnded` struct
    public enum CodingKeys: String, CodingKey {
        case duration = "duration"
    }

    /// Video chat duration in seconds
    public var duration: Int

    public init (duration: Int) {
        self.duration = duration
    }
}
