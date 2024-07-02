// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object describes the way a background is filled based on the selected colors. Currently, it can be one of
 BackgroundFillSolid
 BackgroundFillGradient
 BackgroundFillFreeformGradient

 SeeAlso Telegram Bot API Reference:
 [BackgroundFill](https://core.telegram.org/bots/api#backgroundfill)
 **/
public enum TGBackgroundFill: Codable {
    case backgroundFillSolid(TGBackgroundFillSolid)
    case backgroundFillGradient(TGBackgroundFillGradient)
    case backgroundFillFreeformGradient(TGBackgroundFillFreeformGradient)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGBackgroundFillSolid.self) {
            self = .backgroundFillSolid(value)
        } else if let value = try? container.decode(TGBackgroundFillGradient.self) {
            self = .backgroundFillGradient(value)
        } else if let value = try? container.decode(TGBackgroundFillFreeformGradient.self) {
            self = .backgroundFillFreeformGradient(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE BackgroundFill.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .backgroundFillSolid(value):
            try container.encode(value)
        case let .backgroundFillGradient(value):
            try container.encode(value)
        case let .backgroundFillFreeformGradient(value):
            try container.encode(value)
        }
    }
}
