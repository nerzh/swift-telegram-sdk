// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a photo to post as a story.

 SeeAlso Telegram Bot API Reference:
 [InputStoryContentPhoto](https://core.telegram.org/bots/api#inputstorycontentphoto)
 */

public enum TGInputStoryContentPhotoType: String, Codable {
    case photo = "photo"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputStoryContentPhotoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}