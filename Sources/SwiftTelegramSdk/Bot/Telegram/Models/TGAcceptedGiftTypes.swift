// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the types of gifts that can be gifted to a user or a chat.

 SeeAlso Telegram Bot API Reference:
 [AcceptedGiftTypes](https://core.telegram.org/bots/api#acceptedgifttypes)
 **/
public final class TGAcceptedGiftTypes: Codable {

    /// Custom keys for coding/decoding `AcceptedGiftTypes` struct
    public enum CodingKeys: String, CodingKey {
        case unlimitedGifts = "unlimited_gifts"
        case limitedGifts = "limited_gifts"
        case uniqueGifts = "unique_gifts"
        case premiumSubscription = "premium_subscription"
    }

    /// True, if unlimited regular gifts are accepted
    public var unlimitedGifts: Bool

    /// True, if limited regular gifts are accepted
    public var limitedGifts: Bool

    /// True, if unique gifts or gifts that can be upgraded to unique for free are accepted
    public var uniqueGifts: Bool

    /// True, if a Telegram Premium subscription is accepted
    public var premiumSubscription: Bool

    public init (unlimitedGifts: Bool, limitedGifts: Bool, uniqueGifts: Bool, premiumSubscription: Bool) {
        self.unlimitedGifts = unlimitedGifts
        self.limitedGifts = limitedGifts
        self.uniqueGifts = uniqueGifts
        self.premiumSubscription = premiumSubscription
    }
}
