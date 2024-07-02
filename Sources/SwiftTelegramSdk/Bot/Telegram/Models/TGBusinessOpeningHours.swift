// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes the opening hours of a business.

 SeeAlso Telegram Bot API Reference:
 [BusinessOpeningHours](https://core.telegram.org/bots/api#businessopeninghours)
 **/
public final class TGBusinessOpeningHours: Codable {

    /// Custom keys for coding/decoding `BusinessOpeningHours` struct
    public enum CodingKeys: String, CodingKey {
        case timeZoneName = "time_zone_name"
        case openingHours = "opening_hours"
    }

    /// Unique name of the time zone for which the opening hours are defined
    public var timeZoneName: String

    /// List of time intervals describing business opening hours
    public var openingHours: [TGBusinessOpeningHoursInterval]

    public init (timeZoneName: String, openingHours: [TGBusinessOpeningHoursInterval]) {
        self.timeZoneName = timeZoneName
        self.openingHours = openingHours
    }
}
