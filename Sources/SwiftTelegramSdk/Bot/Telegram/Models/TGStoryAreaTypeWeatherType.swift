// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a story area containing weather information. Currently, a story can have up to 3 weather areas.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaTypeWeather](https://core.telegram.org/bots/api#storyareatypeweather)
 */

public enum TGStoryAreaTypeWeatherType: String, Codable {
    case weather = "weather"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGStoryAreaTypeWeatherType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}