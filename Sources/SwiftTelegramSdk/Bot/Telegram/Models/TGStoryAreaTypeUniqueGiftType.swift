// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a story area pointing to a unique gift. Currently, a story can have at most 1 unique gift area.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaTypeUniqueGift](https://core.telegram.org/bots/api#storyareatypeuniquegift)
 */

public enum TGStoryAreaTypeUniqueGiftType: String, Codable {
    case uniqueGift = "unique_gift"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGStoryAreaTypeUniqueGiftType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}