// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a story area pointing to a unique gift. Currently, a story can have at most 1 unique gift area.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaTypeUniqueGift](https://core.telegram.org/bots/api#storyareatypeuniquegift)
 **/
public final class TGStoryAreaTypeUniqueGift: Codable {

    /// Custom keys for coding/decoding `StoryAreaTypeUniqueGift` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case name = "name"
    }

    /// Type of the area, always “unique_gift”
    public var type: TGStoryAreaTypeUniqueGiftType

    /// Unique name of the gift
    public var name: String

    public init (type: TGStoryAreaTypeUniqueGiftType, name: String) {
        self.type = type
        self.name = name
    }
}
