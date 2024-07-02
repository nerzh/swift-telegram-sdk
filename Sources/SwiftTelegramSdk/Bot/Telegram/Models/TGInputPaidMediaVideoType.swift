// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The paid media to send is a video.

 SeeAlso Telegram Bot API Reference:
 [InputPaidMediaVideo](https://core.telegram.org/bots/api#inputpaidmediavideo)
 */

public enum TGInputPaidMediaVideoType: String, Codable {
    case video = "video"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputPaidMediaVideoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}