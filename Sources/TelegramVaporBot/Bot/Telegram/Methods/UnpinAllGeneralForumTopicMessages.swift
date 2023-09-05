// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to clear the list of pinned messages in a General forum topic. The bot must be an administrator in the chat for this to work and must have the can_pin_messages administrator right in the supergroup. Returns True on success.


/// Parameters container struct for `unpinAllGeneralForumTopicMessages` method
public struct TGUnpinAllGeneralForumTopicMessagesParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Custom keys for coding/decoding `UnpinAllGeneralForumTopicMessagesParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to clear the list of pinned messages in a General forum topic. The bot must be an administrator in the chat for this to work and must have the can_pin_messages administrator right in the supergroup. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [UnpinAllGeneralForumTopicMessagesParams](https://core.telegram.org/bots/api#unpinallgeneralforumtopicmessages)
 
 - Parameters:
     - params: Parameters container, see `UnpinAllGeneralForumTopicMessagesParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func unpinAllGeneralForumTopicMessages(params: TGUnpinAllGeneralForumTopicMessagesParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("unpinAllGeneralForumTopicMessages"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
