// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The reaction is based on a custom emoji.

 SeeAlso Telegram Bot API Reference:
 [ReactionTypeCustomEmoji](https://core.telegram.org/bots/api#reactiontypecustomemoji)
 */

public enum TGReactionTypeCustomEmojiType: String, Codable {
    case customEmoji = "custom_emoji"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGReactionTypeCustomEmojiType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}