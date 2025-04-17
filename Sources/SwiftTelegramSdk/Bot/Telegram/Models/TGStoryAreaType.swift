// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes the type of a clickable area on a story. Currently, it can be one of
 StoryAreaTypeLocation
 StoryAreaTypeSuggestedReaction
 StoryAreaTypeLink
 StoryAreaTypeWeather
 StoryAreaTypeUniqueGift

 SeeAlso Telegram Bot API Reference:
 [StoryAreaType](https://core.telegram.org/bots/api#storyareatype)
 **/
public enum TGStoryAreaType: Codable {
    case storyAreaTypeLocation(TGStoryAreaTypeLocation)
    case storyAreaTypeSuggestedReaction(TGStoryAreaTypeSuggestedReaction)
    case storyAreaTypeLink(TGStoryAreaTypeLink)
    case storyAreaTypeWeather(TGStoryAreaTypeWeather)
    case storyAreaTypeUniqueGift(TGStoryAreaTypeUniqueGift)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGStoryAreaTypeLocation.self) {
            self = .storyAreaTypeLocation(value)
        } else if let value = try? container.decode(TGStoryAreaTypeSuggestedReaction.self) {
            self = .storyAreaTypeSuggestedReaction(value)
        } else if let value = try? container.decode(TGStoryAreaTypeLink.self) {
            self = .storyAreaTypeLink(value)
        } else if let value = try? container.decode(TGStoryAreaTypeWeather.self) {
            self = .storyAreaTypeWeather(value)
        } else if let value = try? container.decode(TGStoryAreaTypeUniqueGift.self) {
            self = .storyAreaTypeUniqueGift(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE StoryAreaType.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .storyAreaTypeLocation(value):
            try container.encode(value)
        case let .storyAreaTypeSuggestedReaction(value):
            try container.encode(value)
        case let .storyAreaTypeLink(value):
            try container.encode(value)
        case let .storyAreaTypeWeather(value):
            try container.encode(value)
        case let .storyAreaTypeUniqueGift(value):
            try container.encode(value)
        }
    }
}
