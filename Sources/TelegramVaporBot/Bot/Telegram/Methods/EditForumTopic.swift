// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to edit name and icon of a topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success.


/// Parameters container struct for `editForumTopic` method
public struct TGEditForumTopicParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread of the forum topic
    public var messageThreadId: Int

    /// New topic name, 0-128 characters. If not specified or empty, the current name of the topic will be kept
    public var name: String?

    /// New unique identifier of the custom emoji shown as the topic icon. Use getForumTopicIconStickers to get all allowed custom emoji identifiers. Pass an empty string to remove the icon. If not specified, the current icon will be kept
    public var iconCustomEmojiId: String?

    /// Custom keys for coding/decoding `EditForumTopicParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case name = "name"
            case iconCustomEmojiId = "icon_custom_emoji_id"
    }

    public init(chatId: TGChatId, messageThreadId: Int, name: String? = nil, iconCustomEmojiId: String? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.name = name
            self.iconCustomEmojiId = iconCustomEmojiId
    }
}


public extension TGBot {

/**
 Use this method to edit name and icon of a topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [EditForumTopicParams](https://core.telegram.org/bots/api#editforumtopic)
 
 - Parameters:
     - params: Parameters container, see `EditForumTopicParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func editForumTopic(params: TGEditForumTopicParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("editForumTopic"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }

    @discardableResult
    func editForumTopic(params: TGEditForumTopicParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("editForumTopic"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
