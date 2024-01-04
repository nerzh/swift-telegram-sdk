// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to send point on the map. On success, the sent Message is returned.


/// Parameters container struct for `sendLocation` method
public struct TGSendLocationParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public var messageThreadId: Int?

    /// Latitude of the location
    public var latitude: Float

    /// Longitude of the location
    public var longitude: Float

    /// The radius of uncertainty for the location, measured in meters; 0-1500
    public var horizontalAccuracy: Float?

    /// Period in seconds for which the location will be updated (see Live Locations, should be between 60 and 86400.
    public var livePeriod: Int?

    /// For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    public var heading: Int?

    /// For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    public var proximityAlertRadius: Int?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// Description of the message to reply to
    public var replyParameters: TGReplyParameters?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    public var replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `SendLocationParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case latitude = "latitude"
            case longitude = "longitude"
            case horizontalAccuracy = "horizontal_accuracy"
            case livePeriod = "live_period"
            case heading = "heading"
            case proximityAlertRadius = "proximity_alert_radius"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, latitude: Float, longitude: Float, horizontalAccuracy: Float? = nil, livePeriod: Int? = nil, heading: Int? = nil, proximityAlertRadius: Int? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.latitude = latitude
            self.longitude = longitude
            self.horizontalAccuracy = horizontalAccuracy
            self.livePeriod = livePeriod
            self.heading = heading
            self.proximityAlertRadius = proximityAlertRadius
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.replyParameters = replyParameters
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to send point on the map. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendLocationParams](https://core.telegram.org/bots/api#sendlocation)
 
 - Parameters:
     - params: Parameters container, see `SendLocationParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendLocation(params: TGSendLocationParams) async throws -> TGMessage {
        let methodURL: URI = .init(string: getMethodURL("sendLocation"))
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
