// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes a profile photo to set. Currently, it can be one of
 InputProfilePhotoStatic
 InputProfilePhotoAnimated

 SeeAlso Telegram Bot API Reference:
 [InputProfilePhoto](https://core.telegram.org/bots/api#inputprofilephoto)
 **/
public enum TGInputProfilePhoto: Codable {
    case inputProfilePhotoStatic(TGInputProfilePhotoStatic)
    case inputProfilePhotoAnimated(TGInputProfilePhotoAnimated)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGInputProfilePhotoStatic.self) {
            self = .inputProfilePhotoStatic(value)
        } else if let value = try? container.decode(TGInputProfilePhotoAnimated.self) {
            self = .inputProfilePhotoAnimated(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE InputProfilePhoto.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .inputProfilePhotoStatic(value):
            try container.encode(value)
        case let .inputProfilePhotoAnimated(value):
            try container.encode(value)
        }
    }
}
