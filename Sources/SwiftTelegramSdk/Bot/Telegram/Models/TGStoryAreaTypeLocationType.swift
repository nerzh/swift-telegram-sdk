// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a story area pointing to a location. Currently, a story can have up to 10 location areas.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaTypeLocation](https://core.telegram.org/bots/api#storyareatypelocation)
 */

public enum TGStoryAreaTypeLocationType: String, Codable {
    case location = "location"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGStoryAreaTypeLocationType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}