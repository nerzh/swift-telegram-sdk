// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to clear the list of pinned messages in a forum topic. The bot must be an administrator in the chat for this to work and must have the can_pin_messages administrator right in the supergroup. Returns True on success.


/// Parameters container struct for `unpinAllForumTopicMessages` method
public struct TGUnpinAllForumTopicMessagesParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread of the forum topic
    public var messageThreadId: Int

    /// Custom keys for coding/decoding `UnpinAllForumTopicMessagesParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
    }

    public init(chatId: TGChatId, messageThreadId: Int) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
    }
}


public extension TGBot {

/**
 Use this method to clear the list of pinned messages in a forum topic. The bot must be an administrator in the chat for this to work and must have the can_pin_messages administrator right in the supergroup. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [UnpinAllForumTopicMessagesParams](https://core.telegram.org/bots/api#unpinallforumtopicmessages)
 
 - Parameters:
     - params: Parameters container, see `UnpinAllForumTopicMessagesParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func unpinAllForumTopicMessages(params: TGUnpinAllForumTopicMessagesParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("unpinAllForumTopicMessages"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
