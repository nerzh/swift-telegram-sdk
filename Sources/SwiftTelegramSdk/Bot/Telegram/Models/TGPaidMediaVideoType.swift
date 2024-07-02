// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The paid media is a video.

 SeeAlso Telegram Bot API Reference:
 [PaidMediaVideo](https://core.telegram.org/bots/api#paidmediavideo)
 */

public enum TGPaidMediaVideoType: String, Codable {
    case video = "video"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGPaidMediaVideoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}