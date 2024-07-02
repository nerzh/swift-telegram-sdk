// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The reaction is based on an emoji.

 SeeAlso Telegram Bot API Reference:
 [ReactionTypeEmoji](https://core.telegram.org/bots/api#reactiontypeemoji)
 */

public enum TGReactionTypeEmojiType: String, Codable {
    case emoji = "emoji"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGReactionTypeEmojiType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}