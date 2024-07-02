// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to hide the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. The topic will be automatically closed if it was open. Returns True on success.


/// Parameters container struct for `hideGeneralForumTopic` method
public struct TGHideGeneralForumTopicParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Custom keys for coding/decoding `HideGeneralForumTopicParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to hide the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. The topic will be automatically closed if it was open. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [HideGeneralForumTopicParams](https://core.telegram.org/bots/api#hidegeneralforumtopic)
 
 - Parameters:
     - params: Parameters container, see `HideGeneralForumTopicParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func hideGeneralForumTopic(params: TGHideGeneralForumTopicParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("hideGeneralForumTopic")) else {
            throw BotError("Bad URL: \(getMethodURL("hideGeneralForumTopic"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
