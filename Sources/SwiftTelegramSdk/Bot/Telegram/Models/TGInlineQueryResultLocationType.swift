// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a location on a map. By default, the location will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the location.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultLocation](https://core.telegram.org/bots/api#inlinequeryresultlocation)
 */

public enum TGInlineQueryResultLocationType: String, Codable {
    case location = "location"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultLocationType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}