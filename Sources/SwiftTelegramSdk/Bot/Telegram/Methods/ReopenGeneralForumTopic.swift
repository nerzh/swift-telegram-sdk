// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to reopen a closed 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. The topic will be automatically unhidden if it was hidden. Returns True on success.


/// Parameters container struct for `reopenGeneralForumTopic` method
public struct TGReopenGeneralForumTopicParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Custom keys for coding/decoding `ReopenGeneralForumTopicParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to reopen a closed 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. The topic will be automatically unhidden if it was hidden. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [ReopenGeneralForumTopicParams](https://core.telegram.org/bots/api#reopengeneralforumtopic)
 
 - Parameters:
     - params: Parameters container, see `ReopenGeneralForumTopicParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func reopenGeneralForumTopic(params: TGReopenGeneralForumTopicParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("reopenGeneralForumTopic")) else {
            throw BotError("Bad URL: \(getMethodURL("reopenGeneralForumTopic"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
