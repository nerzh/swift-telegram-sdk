// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the content of a story to post. Currently, it can be one of
 InputStoryContentPhoto
 InputStoryContentVideo

 SeeAlso Telegram Bot API Reference:
 [InputStoryContent](https://core.telegram.org/bots/api#inputstorycontent)
 **/
public enum TGInputStoryContent: Codable {
    case inputStoryContentPhoto(TGInputStoryContentPhoto)
    case inputStoryContentVideo(TGInputStoryContentVideo)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGInputStoryContentPhoto.self) {
            self = .inputStoryContentPhoto(value)
        } else if let value = try? container.decode(TGInputStoryContentVideo.self) {
            self = .inputStoryContentVideo(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE InputStoryContent.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .inputStoryContentPhoto(value):
            try container.encode(value)
        case let .inputStoryContentVideo(value):
            try container.encode(value)
        }
    }
}
