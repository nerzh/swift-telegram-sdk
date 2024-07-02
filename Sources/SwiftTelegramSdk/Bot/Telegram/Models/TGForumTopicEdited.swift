// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a service message about an edited forum topic.

 SeeAlso Telegram Bot API Reference:
 [ForumTopicEdited](https://core.telegram.org/bots/api#forumtopicedited)
 **/
public final class TGForumTopicEdited: Codable {

    /// Custom keys for coding/decoding `ForumTopicEdited` struct
    public enum CodingKeys: String, CodingKey {
        case name = "name"
        case iconCustomEmojiId = "icon_custom_emoji_id"
    }

    /// Optional. New name of the topic, if it was edited
    public var name: String?

    /// Optional. New identifier of the custom emoji shown as the topic icon, if it was edited; an empty string if the icon was removed
    public var iconCustomEmojiId: String?

    public init (name: String? = nil, iconCustomEmojiId: String? = nil) {
        self.name = name
        self.iconCustomEmojiId = iconCustomEmojiId
    }
}
