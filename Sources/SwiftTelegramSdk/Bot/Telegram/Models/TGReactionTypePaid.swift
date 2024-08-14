// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The reaction is paid.

 SeeAlso Telegram Bot API Reference:
 [ReactionTypePaid](https://core.telegram.org/bots/api#reactiontypepaid)
 **/
public final class TGReactionTypePaid: Codable {

    /// Custom keys for coding/decoding `ReactionTypePaid` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Type of the reaction, always “paid”
    public var type: TGReactionTypePaidType

    public init (type: TGReactionTypePaidType) {
        self.type = type
    }
}
