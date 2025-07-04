// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to send a checklist on behalf of a connected business account. On success, the sent Message is returned.


/// Parameters container struct for `sendChecklist` method
public struct TGSendChecklistParams: Encodable {

    /// Unique identifier of the business connection on behalf of which the message will be sent
    public var businessConnectionId: String

    /// Unique identifier for the target chat
    public var chatId: Int64

    /// A JSON-serialized object for the checklist to send
    public var checklist: TGInputChecklist

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// Unique identifier of the message effect to be added to the message
    public var messageEffectId: String?

    /// A JSON-serialized object for description of the message to reply to
    public var replyParameters: TGReplyParameters?

    /// A JSON-serialized object for an inline keyboard
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `SendChecklistParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case checklist = "checklist"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case messageEffectId = "message_effect_id"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(businessConnectionId: String, chatId: Int64, checklist: TGInputChecklist, disableNotification: Bool? = nil, protectContent: Bool? = nil, messageEffectId: String? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.checklist = checklist
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.messageEffectId = messageEffectId
            self.replyParameters = replyParameters
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to send a checklist on behalf of a connected business account. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendChecklistParams](https://core.telegram.org/bots/api#sendchecklist)
 
 - Parameters:
     - params: Parameters container, see `SendChecklistParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendChecklist(params: TGSendChecklistParams) async throws -> TGMessage {
        guard let methodURL: URL = .init(string: getMethodURL("sendChecklist")) else {
            throw BotError("Bad URL: \(getMethodURL("sendChecklist"))")
        }
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
