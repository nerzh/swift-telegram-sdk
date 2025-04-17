// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about a unique gift that was sent or received.

 SeeAlso Telegram Bot API Reference:
 [UniqueGiftInfo](https://core.telegram.org/bots/api#uniquegiftinfo)
 **/
public final class TGUniqueGiftInfo: Codable {

    /// Custom keys for coding/decoding `UniqueGiftInfo` struct
    public enum CodingKeys: String, CodingKey {
        case gift = "gift"
        case origin = "origin"
        case ownedGiftId = "owned_gift_id"
        case transferStarCount = "transfer_star_count"
    }

    /// Information about the gift
    public var gift: TGUniqueGift

    /// Origin of the gift. Currently, either “upgrade” or “transfer”
    public var origin: String

    /// Optional. Unique identifier of the received gift for the bot; only present for gifts received on behalf of business accounts
    public var ownedGiftId: String?

    /// Optional. Number of Telegram Stars that must be paid to transfer the gift; omitted if the bot cannot transfer the gift
    public var transferStarCount: Int?

    public init (gift: TGUniqueGift, origin: String, ownedGiftId: String? = nil, transferStarCount: Int? = nil) {
        self.gift = gift
        self.origin = origin
        self.ownedGiftId = ownedGiftId
        self.transferStarCount = transferStarCount
    }
}
