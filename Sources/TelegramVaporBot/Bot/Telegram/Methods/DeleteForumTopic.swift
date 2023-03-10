// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to delete a forum topic along with all its messages in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_delete_messages administrator rights. Returns True on success.


/// Parameters container struct for `deleteForumTopic` method
public struct TGDeleteForumTopicParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread of the forum topic
    public var messageThreadId: Int

    /// Custom keys for coding/decoding `DeleteForumTopicParams` struct
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
 Use this method to delete a forum topic along with all its messages in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_delete_messages administrator rights. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteForumTopicParams](https://core.telegram.org/bots/api#deleteforumtopic)
 
 - Parameters:
     - params: Parameters container, see `DeleteForumTopicParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */

    @discardableResult
    func deleteForumTopic(params: TGDeleteForumTopicParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("deleteForumTopic"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
