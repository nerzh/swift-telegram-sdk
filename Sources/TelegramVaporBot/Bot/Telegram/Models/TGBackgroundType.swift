// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object describes the type of a background. Currently, it can be one of
 BackgroundTypeFill
 BackgroundTypeWallpaper
 BackgroundTypePattern
 BackgroundTypeChatTheme

 SeeAlso Telegram Bot API Reference:
 [BackgroundType](https://core.telegram.org/bots/api#backgroundtype)
 **/
public enum TGBackgroundType: Codable {
    case backgroundTypeFill(TGBackgroundTypeFill)
    case backgroundTypeWallpaper(TGBackgroundTypeWallpaper)
    case backgroundTypePattern(TGBackgroundTypePattern)
    case backgroundTypeChatTheme(TGBackgroundTypeChatTheme)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGBackgroundTypeFill.self) {
            self = .backgroundTypeFill(value)
        } else if let value = try? container.decode(TGBackgroundTypeWallpaper.self) {
            self = .backgroundTypeWallpaper(value)
        } else if let value = try? container.decode(TGBackgroundTypePattern.self) {
            self = .backgroundTypePattern(value)
        } else if let value = try? container.decode(TGBackgroundTypeChatTheme.self) {
            self = .backgroundTypeChatTheme(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE BackgroundType.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .backgroundTypeFill(value):
            try container.encode(value)
        case let .backgroundTypeWallpaper(value):
            try container.encode(value)
        case let .backgroundTypePattern(value):
            try container.encode(value)
        case let .backgroundTypeChatTheme(value):
            try container.encode(value)
        }
    }
}
