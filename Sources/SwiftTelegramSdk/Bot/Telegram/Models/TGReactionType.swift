// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the type of a reaction. Currently, it can be one of
 ReactionTypeEmoji
 ReactionTypeCustomEmoji
 ReactionTypePaid

 SeeAlso Telegram Bot API Reference:
 [ReactionType](https://core.telegram.org/bots/api#reactiontype)
 **/
public enum TGReactionType: Codable {
    case reactionTypeEmoji(TGReactionTypeEmoji)
    case reactionTypeCustomEmoji(TGReactionTypeCustomEmoji)
    case reactionTypePaid(TGReactionTypePaid)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGReactionTypeEmoji.self) {
            self = .reactionTypeEmoji(value)
        } else if let value = try? container.decode(TGReactionTypeCustomEmoji.self) {
            self = .reactionTypeCustomEmoji(value)
        } else if let value = try? container.decode(TGReactionTypePaid.self) {
            self = .reactionTypePaid(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE ReactionType.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .reactionTypeEmoji(value):
            try container.encode(value)
        case let .reactionTypeCustomEmoji(value):
            try container.encode(value)
        case let .reactionTypePaid(value):
            try container.encode(value)
        }
    }
}
