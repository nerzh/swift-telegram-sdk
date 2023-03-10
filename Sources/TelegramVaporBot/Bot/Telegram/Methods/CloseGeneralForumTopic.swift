// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to close an open 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns True on success.


/// Parameters container struct for `closeGeneralForumTopic` method
public struct TGCloseGeneralForumTopicParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Custom keys for coding/decoding `CloseGeneralForumTopicParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to close an open 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [CloseGeneralForumTopicParams](https://core.telegram.org/bots/api#closegeneralforumtopic)
 
 - Parameters:
     - params: Parameters container, see `CloseGeneralForumTopicParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */

    @discardableResult
    func closeGeneralForumTopic(params: TGCloseGeneralForumTopicParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("closeGeneralForumTopic"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
