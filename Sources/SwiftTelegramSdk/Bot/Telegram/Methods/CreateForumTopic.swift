// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to create a topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns information about the created topic as a ForumTopic object.


/// Parameters container struct for `createForumTopic` method
public struct TGCreateForumTopicParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Topic name, 1-128 characters
    public var name: String

    /// Color of the topic icon in RGB format. Currently, must be one of 7322096 (0x6FB9F0), 16766590 (0xFFD67E), 13338331 (0xCB86DB), 9367192 (0x8EEE98), 16749490 (0xFF93B2), or 16478047 (0xFB6F5F)
    public var iconColor: Int?

    /// Unique identifier of the custom emoji shown as the topic icon. Use getForumTopicIconStickers to get all allowed custom emoji identifiers.
    public var iconCustomEmojiId: String?

    /// Custom keys for coding/decoding `CreateForumTopicParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case name = "name"
            case iconColor = "icon_color"
            case iconCustomEmojiId = "icon_custom_emoji_id"
    }

    public init(chatId: TGChatId, name: String, iconColor: Int? = nil, iconCustomEmojiId: String? = nil) {
            self.chatId = chatId
            self.name = name
            self.iconColor = iconColor
            self.iconCustomEmojiId = iconCustomEmojiId
    }
}


public extension TGBot {

/**
 Use this method to create a topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns information about the created topic as a ForumTopic object.

 SeeAlso Telegram Bot API Reference:
 [CreateForumTopicParams](https://core.telegram.org/bots/api#createforumtopic)
 
 - Parameters:
     - params: Parameters container, see `CreateForumTopicParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func createForumTopic(params: TGCreateForumTopicParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("createForumTopic")) else {
            throw BotError("Bad URL: \(getMethodURL("createForumTopic"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
