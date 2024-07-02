// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents the content of a service message, sent whenever a user in the chat triggers a proximity alert set by another user.

 SeeAlso Telegram Bot API Reference:
 [ProximityAlertTriggered](https://core.telegram.org/bots/api#proximityalerttriggered)
 **/
public final class TGProximityAlertTriggered: Codable {

    /// Custom keys for coding/decoding `ProximityAlertTriggered` struct
    public enum CodingKeys: String, CodingKey {
        case traveler = "traveler"
        case watcher = "watcher"
        case distance = "distance"
    }

    /// User that triggered the alert
    public var traveler: TGUser

    /// User that set the alert
    public var watcher: TGUser

    /// The distance between the users
    public var distance: Int

    public init (traveler: TGUser, watcher: TGUser, distance: Int) {
        self.traveler = traveler
        self.watcher = watcher
        self.distance = distance
    }
}
