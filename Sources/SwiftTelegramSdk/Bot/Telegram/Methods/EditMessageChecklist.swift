// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to edit a checklist on behalf of a connected business account. On success, the edited Message is returned.


/// Parameters container struct for `editMessageChecklist` method
public struct TGEditMessageChecklistParams: Encodable {

    /// Unique identifier of the business connection on behalf of which the message will be sent
    public var businessConnectionId: String

    /// Unique identifier for the target chat
    public var chatId: Int64

    /// Unique identifier for the target message
    public var messageId: Int

    /// A JSON-serialized object for the new checklist
    public var checklist: TGInputChecklist

    /// A JSON-serialized object for the new inline keyboard for the message
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditMessageChecklistParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageId = "message_id"
            case checklist = "checklist"
            case replyMarkup = "reply_markup"
    }

    public init(businessConnectionId: String, chatId: Int64, messageId: Int, checklist: TGInputChecklist, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageId = messageId
            self.checklist = checklist
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to edit a checklist on behalf of a connected business account. On success, the edited Message is returned.

 SeeAlso Telegram Bot API Reference:
 [EditMessageChecklistParams](https://core.telegram.org/bots/api#editmessagechecklist)
 
 - Parameters:
     - params: Parameters container, see `EditMessageChecklistParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func editMessageChecklist(params: TGEditMessageChecklistParams) async throws -> TGMessage {
        guard let methodURL: URL = .init(string: getMethodURL("editMessageChecklist")) else {
            throw BotError("Bad URL: \(getMethodURL("editMessageChecklist"))")
        }
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
