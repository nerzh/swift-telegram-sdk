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

    /// If the message is a reply, ID of the original message
    public var replyToMessageId: Int?

    /// Pass True if the message should be sent even if the specified replied-to message is not found
    public var allowSendingWithoutReply: Bool?

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
            case replyToMessageId = "reply_to_message_id"
            case allowSendingWithoutReply = "allow_sending_without_reply"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, phoneNumber: String, firstName: String, lastName: String? = nil, vcard: String? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyToMessageId: Int? = nil, allowSendingWithoutReply: Bool? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.phoneNumber = phoneNumber
            self.firstName = firstName
            self.lastName = lastName
            self.vcard = vcard
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.replyToMessageId = replyToMessageId
            self.allowSendingWithoutReply = allowSendingWithoutReply
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
 - Returns: EventLoopFuture of `TGMessage` type
 */
    @discardableResult
    func sendContact(params: TGSendContactParams) throws -> EventLoopFuture<TGMessage> {
        let methodURL: URI = .init(string: getMethodURL("sendContact"))
        let future: EventLoopFuture<TGMessage> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
