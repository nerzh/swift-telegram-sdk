// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to copy messages of any kind. If some of the specified messages can't be found or copied, they are skipped. Service messages, giveaway messages, giveaway winners messages, and invoice messages can't be copied. A quiz poll can be copied only if the value of the field correct_option_id is known to the bot. The method is analogous to the method forwardMessages, but the copied messages don't have a link to the original message. Album grouping is kept for copied messages. On success, an array of MessageId of the sent messages is returned.


/// Parameters container struct for `copyMessages` method
public struct TGCopyMessagesParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public var messageThreadId: Int?

    /// Unique identifier for the chat where the original messages were sent (or channel username in the format @channelusername)
    public var fromChatId: TGChatId

    /// A JSON-serialized list of 1-100 identifiers of messages in the chat from_chat_id to copy. The identifiers must be specified in a strictly increasing order.
    public var messageIds: [Int]

    /// Sends the messages silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent messages from forwarding and saving
    public var protectContent: Bool?

    /// Pass True to copy the messages without their captions
    public var removeCaption: Bool?

    /// Custom keys for coding/decoding `CopyMessagesParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case fromChatId = "from_chat_id"
            case messageIds = "message_ids"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case removeCaption = "remove_caption"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, fromChatId: TGChatId, messageIds: [Int], disableNotification: Bool? = nil, protectContent: Bool? = nil, removeCaption: Bool? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.fromChatId = fromChatId
            self.messageIds = messageIds
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.removeCaption = removeCaption
    }
}


public extension TGBot {

/**
 Use this method to copy messages of any kind. If some of the specified messages can't be found or copied, they are skipped. Service messages, giveaway messages, giveaway winners messages, and invoice messages can't be copied. A quiz poll can be copied only if the value of the field correct_option_id is known to the bot. The method is analogous to the method forwardMessages, but the copied messages don't have a link to the original message. Album grouping is kept for copied messages. On success, an array of MessageId of the sent messages is returned.

 SeeAlso Telegram Bot API Reference:
 [CopyMessagesParams](https://core.telegram.org/bots/api#copymessages)
 
 - Parameters:
     - params: Parameters container, see `CopyMessagesParams` struct
 - Throws: Throws on errors
 - Returns: `[TGMessageId]`
 */

    @discardableResult
    func copyMessages(params: TGCopyMessagesParams) async throws -> [TGMessageId] {
        let methodURL: URI = .init(string: getMethodURL("copyMessages"))
        let result: [TGMessageId] = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
