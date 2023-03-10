// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to unhide the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns True on success.


/// Parameters container struct for `unhideGeneralForumTopic` method
public struct TGUnhideGeneralForumTopicParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Custom keys for coding/decoding `UnhideGeneralForumTopicParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to unhide the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [UnhideGeneralForumTopicParams](https://core.telegram.org/bots/api#unhidegeneralforumtopic)
 
 - Parameters:
     - params: Parameters container, see `UnhideGeneralForumTopicParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func unhideGeneralForumTopic(params: TGUnhideGeneralForumTopicParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("unhideGeneralForumTopic"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
