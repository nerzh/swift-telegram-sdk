// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a service message about a new forum topic created in the chat.

 SeeAlso Telegram Bot API Reference:
 [ForumTopicCreated](https://core.telegram.org/bots/api#forumtopiccreated)
 **/
public final class TGForumTopicCreated: Codable {

    /// Custom keys for coding/decoding `ForumTopicCreated` struct
    public enum CodingKeys: String, CodingKey {
        case name = "name"
        case iconColor = "icon_color"
        case iconCustomEmojiId = "icon_custom_emoji_id"
    }

    /// Name of the topic
    public var name: String

    /// Color of the topic icon in RGB format
    public var iconColor: Int

    /// Optional. Unique identifier of the custom emoji shown as the topic icon
    public var iconCustomEmojiId: String?

    public init (name: String, iconColor: Int, iconCustomEmojiId: String? = nil) {
        self.name = name
        self.iconColor = iconColor
        self.iconCustomEmojiId = iconCustomEmojiId
    }
}
