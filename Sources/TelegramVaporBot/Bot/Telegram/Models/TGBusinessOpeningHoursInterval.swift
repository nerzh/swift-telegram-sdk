// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Describes an interval of time during which a business is open.

 SeeAlso Telegram Bot API Reference:
 [BusinessOpeningHoursInterval](https://core.telegram.org/bots/api#businessopeninghoursinterval)
 **/
public final class TGBusinessOpeningHoursInterval: Codable {

    /// Custom keys for coding/decoding `BusinessOpeningHoursInterval` struct
    public enum CodingKeys: String, CodingKey {
        case openingMinute = "opening_minute"
        case closingMinute = "closing_minute"
    }

    /// The minute's sequence number in a week, starting on Monday, marking the start of the time interval during which the business is open; 0 - 7 * 24 * 60
    public var openingMinute: Int

    /// The minute's sequence number in a week, starting on Monday, marking the end of the time interval during which the business is open; 0 - 8 * 24 * 60
    public var closingMinute: Int

    public init (openingMinute: Int, closingMinute: Int) {
        self.openingMinute = openingMinute
        self.closingMinute = closingMinute
    }
}
