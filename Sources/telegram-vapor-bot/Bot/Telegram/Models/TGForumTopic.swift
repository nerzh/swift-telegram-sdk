// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a forum topic.

 SeeAlso Telegram Bot API Reference:
 [ForumTopic](https://core.telegram.org/bots/api#forumtopic)
 */
public final class TGForumTopic: Codable {

    /// Custom keys for coding/decoding `ForumTopic` struct
    public enum CodingKeys: String, CodingKey {
        case messageThreadId = "message_thread_id"
        case name = "name"
        case iconColor = "icon_color"
        case iconCustomEmojiId = "icon_custom_emoji_id"
    }

    /// Unique identifier of the forum topic
    public var messageThreadId: Int

    /// Name of the topic
    public var name: String

    /// Color of the topic icon in RGB format
    public var iconColor: Int

    /// Optional. Unique identifier of the custom emoji shown as the topic icon
    public var iconCustomEmojiId: String?

    public init (messageThreadId: Int, name: String, iconColor: Int, iconCustomEmojiId: String? = nil) {
        self.messageThreadId = messageThreadId
        self.name = name
        self.iconColor = iconColor
        self.iconCustomEmojiId = iconCustomEmojiId
    }
}
