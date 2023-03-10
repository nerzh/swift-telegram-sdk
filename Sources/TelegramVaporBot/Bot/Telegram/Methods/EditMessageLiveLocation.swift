// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to edit live location messages. A location can be edited until its live_period expires or editing is explicitly disabled by a call to stopMessageLiveLocation. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.


/// Parameters container struct for `editMessageLiveLocation` method
public struct TGEditMessageLiveLocationParams: Encodable {

    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId?

    /// Required if inline_message_id is not specified. Identifier of the message to edit
    public var messageId: Int?

    /// Required if chat_id and message_id are not specified. Identifier of the inline message
    public var inlineMessageId: String?

    /// Latitude of new location
    public var latitude: Float

    /// Longitude of new location
    public var longitude: Float

    /// The radius of uncertainty for the location, measured in meters; 0-1500
    public var horizontalAccuracy: Float?

    /// Direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    public var heading: Int?

    /// The maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    public var proximityAlertRadius: Int?

    /// A JSON-serialized object for a new inline keyboard.
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditMessageLiveLocationParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case inlineMessageId = "inline_message_id"
            case latitude = "latitude"
            case longitude = "longitude"
            case horizontalAccuracy = "horizontal_accuracy"
            case heading = "heading"
            case proximityAlertRadius = "proximity_alert_radius"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId? = nil, messageId: Int? = nil, inlineMessageId: String? = nil, latitude: Float, longitude: Float, horizontalAccuracy: Float? = nil, heading: Int? = nil, proximityAlertRadius: Int? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.inlineMessageId = inlineMessageId
            self.latitude = latitude
            self.longitude = longitude
            self.horizontalAccuracy = horizontalAccuracy
            self.heading = heading
            self.proximityAlertRadius = proximityAlertRadius
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to edit live location messages. A location can be edited until its live_period expires or editing is explicitly disabled by a call to stopMessageLiveLocation. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.

 SeeAlso Telegram Bot API Reference:
 [EditMessageLiveLocationParams](https://core.telegram.org/bots/api#editmessagelivelocation)
 
 - Parameters:
     - params: Parameters container, see `EditMessageLiveLocationParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessageOrBool`
 */

    @discardableResult
    func editMessageLiveLocation(params: TGEditMessageLiveLocationParams) async throws -> TGMessageOrBool {
        let methodURL: URI = .init(string: getMethodURL("editMessageLiveLocation"))
        let result: TGMessageOrBool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
