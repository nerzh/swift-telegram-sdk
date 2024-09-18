// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a service message about the creation of a scheduled giveaway.

 SeeAlso Telegram Bot API Reference:
 [GiveawayCreated](https://core.telegram.org/bots/api#giveawaycreated)
 **/
public final class TGGiveawayCreated: Codable {

    /// Custom keys for coding/decoding `GiveawayCreated` struct
    public enum CodingKeys: String, CodingKey {
        case prizeStarCount = "prize_star_count"
    }

    /// Optional. The number of Telegram Stars to be split between giveaway winners; for Telegram Star giveaways only
    public var prizeStarCount: Int?

    public init (prizeStarCount: Int? = nil) {
        self.prizeStarCount = prizeStarCount
    }
}
