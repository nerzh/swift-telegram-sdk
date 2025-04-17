// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a story area pointing to an HTTP or tg:// link. Currently, a story can have up to 3 link areas.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaTypeLink](https://core.telegram.org/bots/api#storyareatypelink)
 */

public enum TGStoryAreaTypeLinkType: String, Codable {
    case link = "link"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGStoryAreaTypeLinkType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}