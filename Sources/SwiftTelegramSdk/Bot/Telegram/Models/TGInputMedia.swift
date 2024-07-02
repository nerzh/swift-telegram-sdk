// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents the content of a media message to be sent. It should be one of
 InputMediaAnimation
 InputMediaDocument
 InputMediaAudio
 InputMediaPhoto
 InputMediaVideo

 SeeAlso Telegram Bot API Reference:
 [InputMedia](https://core.telegram.org/bots/api#inputmedia)
 **/
public enum TGInputMedia: Codable {
    case inputMediaAnimation(TGInputMediaAnimation)
    case inputMediaDocument(TGInputMediaDocument)
    case inputMediaAudio(TGInputMediaAudio)
    case inputMediaPhoto(TGInputMediaPhoto)
    case inputMediaVideo(TGInputMediaVideo)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGInputMediaAnimation.self) {
            self = .inputMediaAnimation(value)
        } else if let value = try? container.decode(TGInputMediaDocument.self) {
            self = .inputMediaDocument(value)
        } else if let value = try? container.decode(TGInputMediaAudio.self) {
            self = .inputMediaAudio(value)
        } else if let value = try? container.decode(TGInputMediaPhoto.self) {
            self = .inputMediaPhoto(value)
        } else if let value = try? container.decode(TGInputMediaVideo.self) {
            self = .inputMediaVideo(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE InputMedia.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .inputMediaAnimation(value):
            try container.encode(value)
        case let .inputMediaDocument(value):
            try container.encode(value)
        case let .inputMediaAudio(value):
            try container.encode(value)
        case let .inputMediaPhoto(value):
            try container.encode(value)
        case let .inputMediaVideo(value):
            try container.encode(value)
        }
    }
}
