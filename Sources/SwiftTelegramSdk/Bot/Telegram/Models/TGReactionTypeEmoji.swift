// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The reaction is based on an emoji.

 SeeAlso Telegram Bot API Reference:
 [ReactionTypeEmoji](https://core.telegram.org/bots/api#reactiontypeemoji)
 **/
public final class TGReactionTypeEmoji: Codable {

    /// Custom keys for coding/decoding `ReactionTypeEmoji` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case emoji = "emoji"
    }

    /// Type of the reaction, always “emoji”
    public var type: TGReactionTypeEmojiType

    /// Reaction emoji. Currently, it can be one of "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""
    public var emoji: String

    public init (type: TGReactionTypeEmojiType, emoji: String) {
        self.type = type
        self.emoji = emoji
    }
}
