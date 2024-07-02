// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to edit the name of the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have can_manage_topics administrator rights. Returns True on success.


/// Parameters container struct for `editGeneralForumTopic` method
public struct TGEditGeneralForumTopicParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// New topic name, 1-128 characters
    public var name: String

    /// Custom keys for coding/decoding `EditGeneralForumTopicParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case name = "name"
    }

    public init(chatId: TGChatId, name: String) {
            self.chatId = chatId
            self.name = name
    }
}


public extension TGBot {

/**
 Use this method to edit the name of the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have can_manage_topics administrator rights. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [EditGeneralForumTopicParams](https://core.telegram.org/bots/api#editgeneralforumtopic)
 
 - Parameters:
     - params: Parameters container, see `EditGeneralForumTopicParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func editGeneralForumTopic(params: TGEditGeneralForumTopicParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("editGeneralForumTopic")) else {
            throw BotError("Bad URL: \(getMethodURL("editGeneralForumTopic"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
