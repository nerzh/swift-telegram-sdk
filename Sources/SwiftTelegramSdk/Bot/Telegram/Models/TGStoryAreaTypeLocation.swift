// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a story area pointing to a location. Currently, a story can have up to 10 location areas.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaTypeLocation](https://core.telegram.org/bots/api#storyareatypelocation)
 **/
public final class TGStoryAreaTypeLocation: Codable {

    /// Custom keys for coding/decoding `StoryAreaTypeLocation` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case latitude = "latitude"
        case longitude = "longitude"
        case address = "address"
    }

    /// Type of the area, always “location”
    public var type: TGStoryAreaTypeLocationType

    /// Location latitude in degrees
    public var latitude: Float

    /// Location longitude in degrees
    public var longitude: Float

    /// Optional. Address of the location
    public var address: TGLocationAddress?

    public init (type: TGStoryAreaTypeLocationType, latitude: Float, longitude: Float, address: TGLocationAddress? = nil) {
        self.type = type
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
    }
}
