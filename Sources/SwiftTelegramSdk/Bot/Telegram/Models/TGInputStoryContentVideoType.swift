// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a video to post as a story.

 SeeAlso Telegram Bot API Reference:
 [InputStoryContentVideo](https://core.telegram.org/bots/api#inputstorycontentvideo)
 */

public enum TGInputStoryContentVideoType: String, Codable {
    case video = "video"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputStoryContentVideoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}