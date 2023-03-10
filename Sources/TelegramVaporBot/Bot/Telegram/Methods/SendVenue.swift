// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to send information about a venue. On success, the sent Message is returned.


/// Parameters container struct for `sendVenue` method
public struct TGSendVenueParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public var messageThreadId: Int?

    /// Latitude of the venue
    public var latitude: Float

    /// Longitude of the venue
    public var longitude: Float

    /// Name of the venue
    public var title: String

    /// Address of the venue
    public var address: String

    /// Foursquare identifier of the venue
    public var foursquareId: String?

    /// Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    public var foursquareType: String?

    /// Google Places identifier of the venue
    public var googlePlaceId: String?

    /// Google Places type of the venue. (See supported types.)
    public var googlePlaceType: String?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// If the message is a reply, ID of the original message
    public var replyToMessageId: Int?

    /// Pass True if the message should be sent even if the specified replied-to message is not found
    public var allowSendingWithoutReply: Bool?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    public var replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `SendVenueParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case latitude = "latitude"
            case longitude = "longitude"
            case title = "title"
            case address = "address"
            case foursquareId = "foursquare_id"
            case foursquareType = "foursquare_type"
            case googlePlaceId = "google_place_id"
            case googlePlaceType = "google_place_type"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case replyToMessageId = "reply_to_message_id"
            case allowSendingWithoutReply = "allow_sending_without_reply"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, latitude: Float, longitude: Float, title: String, address: String, foursquareId: String? = nil, foursquareType: String? = nil, googlePlaceId: String? = nil, googlePlaceType: String? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyToMessageId: Int? = nil, allowSendingWithoutReply: Bool? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.latitude = latitude
            self.longitude = longitude
            self.title = title
            self.address = address
            self.foursquareId = foursquareId
            self.foursquareType = foursquareType
            self.googlePlaceId = googlePlaceId
            self.googlePlaceType = googlePlaceType
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.replyToMessageId = replyToMessageId
            self.allowSendingWithoutReply = allowSendingWithoutReply
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to send information about a venue. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendVenueParams](https://core.telegram.org/bots/api#sendvenue)
 
 - Parameters:
     - params: Parameters container, see `SendVenueParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `TGMessage` type
 */
    @discardableResult
    func sendVenue(params: TGSendVenueParams) throws -> EventLoopFuture<TGMessage> {
        let methodURL: URI = .init(string: getMethodURL("sendVenue"))
        let future: EventLoopFuture<TGMessage> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }

    @discardableResult
    func sendVenue(params: TGSendVenueParams) async throws -> TGMessage {
        let methodURL: URI = .init(string: getMethodURL("sendVenue"))
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
