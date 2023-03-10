// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a service message about a video chat scheduled in the chat.

 SeeAlso Telegram Bot API Reference:
 [VideoChatScheduled](https://core.telegram.org/bots/api#videochatscheduled)
 */
public final class TGVideoChatScheduled: Codable {

    /// Custom keys for coding/decoding `VideoChatScheduled` struct
    public enum CodingKeys: String, CodingKey {
        case startDate = "start_date"
    }

    /// Point in time (Unix timestamp) when the video chat is supposed to be started by a chat administrator
    public var startDate: Int

    public init (startDate: Int) {
        self.startDate = startDate
    }
}
