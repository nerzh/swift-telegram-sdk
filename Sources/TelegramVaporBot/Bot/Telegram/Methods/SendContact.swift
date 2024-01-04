// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to send phone contacts. On success, the sent Message is returned.


/// Parameters container struct for `sendContact` method
public struct TGSendContactParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public var messageThreadId: Int?

    /// Contact's phone number
    public var phoneNumber: String

    /// Contact's first name
    public var firstName: String

    /// Contact's last name
    public var lastName: String?

    /// Additional data about the contact in the form of a vCard, 0-2048 bytes
    public var vcard: String?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// Description of the message to reply to
    public var replyParameters: TGReplyParameters?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    public var replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `SendContactParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case phoneNumber = "phone_number"
            case firstName = "first_name"
            case lastName = "last_name"
            case vcard = "vcard"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, phoneNumber: String, firstName: String, lastName: String? = nil, vcard: String? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.phoneNumber = phoneNumber
            self.firstName = firstName
            self.lastName = lastName
            self.vcard = vcard
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.replyParameters = replyParameters
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to send phone contacts. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendContactParams](https://core.telegram.org/bots/api#sendcontact)
 
 - Parameters:
     - params: Parameters container, see `SendContactParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendContact(params: TGSendContactParams) async throws -> TGMessage {
        let methodURL: URI = .init(string: getMethodURL("sendContact"))
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
