// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a reaction added to a message along with the number of times it was added.

 SeeAlso Telegram Bot API Reference:
 [ReactionCount](https://core.telegram.org/bots/api#reactioncount)
 **/
public final class TGReactionCount: Codable {

    /// Custom keys for coding/decoding `ReactionCount` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case totalCount = "total_count"
    }

    /// Type of the reaction
    public var type: TGReactionType

    /// Number of times the reaction was added
    public var totalCount: Int

    public init (type: TGReactionType, totalCount: Int) {
        self.type = type
        self.totalCount = totalCount
    }
}
