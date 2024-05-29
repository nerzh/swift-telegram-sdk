// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a video to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaVideo](https://core.telegram.org/bots/api#inputmediavideo)
 */

public enum TGInputMediaVideoType: String, Codable {
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputMediaVideoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}