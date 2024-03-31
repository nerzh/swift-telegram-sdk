// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**

 SeeAlso Telegram Bot API Reference:
 [BusinessLocation](https://core.telegram.org/bots/api#businesslocation)
 **/
public final class TGBusinessLocation: Codable {

    /// Custom keys for coding/decoding `BusinessLocation` struct
    public enum CodingKeys: String, CodingKey {
        case address = "address"
        case location = "location"
    }

    /// Address of the business
    public var address: String

    /// Optional. Location of the business
    public var location: TGLocation?

    public init (address: String, location: TGLocation? = nil) {
        self.address = address
        self.location = location
    }
}
