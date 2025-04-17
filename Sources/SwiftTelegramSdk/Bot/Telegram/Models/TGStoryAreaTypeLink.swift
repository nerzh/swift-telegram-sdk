// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a story area pointing to an HTTP or tg:// link. Currently, a story can have up to 3 link areas.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaTypeLink](https://core.telegram.org/bots/api#storyareatypelink)
 **/
public final class TGStoryAreaTypeLink: Codable {

    /// Custom keys for coding/decoding `StoryAreaTypeLink` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case url = "url"
    }

    /// Type of the area, always “link”
    public var type: TGStoryAreaTypeLinkType

    /// HTTP or tg:// URL to be opened when the area is clicked
    public var url: String

    public init (type: TGStoryAreaTypeLinkType, url: String) {
        self.type = type
        self.url = url
    }
}
