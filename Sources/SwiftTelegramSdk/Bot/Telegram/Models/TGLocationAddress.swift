// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes the physical address of a location.

 SeeAlso Telegram Bot API Reference:
 [LocationAddress](https://core.telegram.org/bots/api#locationaddress)
 **/
public final class TGLocationAddress: Codable {

    /// Custom keys for coding/decoding `LocationAddress` struct
    public enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case state = "state"
        case city = "city"
        case street = "street"
    }

    /// The two-letter ISO 3166-1 alpha-2 country code of the country where the location is located
    public var countryCode: String

    /// Optional. State of the location
    public var state: String?

    /// Optional. City of the location
    public var city: String?

    /// Optional. Street address of the location
    public var street: String?

    public init (countryCode: String, state: String? = nil, city: String? = nil, street: String? = nil) {
        self.countryCode = countryCode
        self.state = state
        self.city = city
        self.street = street
    }
}
