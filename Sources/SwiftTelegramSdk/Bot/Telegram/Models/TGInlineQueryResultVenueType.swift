// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a venue. By default, the venue will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the venue.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultVenue](https://core.telegram.org/bots/api#inlinequeryresultvenue)
 */

public enum TGInlineQueryResultVenueType: String, Codable {
    case venue = "venue"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultVenueType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}