// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The paid media is a video.

 SeeAlso Telegram Bot API Reference:
 [PaidMediaVideo](https://core.telegram.org/bots/api#paidmediavideo)
 **/
public final class TGPaidMediaVideo: Codable {

    /// Custom keys for coding/decoding `PaidMediaVideo` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case video = "video"
    }

    /// Type of the paid media, always “video”
    public var type: TGPaidMediaVideoType

    /// The video
    public var video: TGVideo

    public init (type: TGPaidMediaVideoType, video: TGVideo) {
        self.type = type
        self.video = video
    }
}
