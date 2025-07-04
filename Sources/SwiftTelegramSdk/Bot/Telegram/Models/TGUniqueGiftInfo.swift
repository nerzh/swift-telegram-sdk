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
        case lastResaleStarCount = "last_resale_star_count"
        case ownedGiftId = "owned_gift_id"
        case transferStarCount = "transfer_star_count"
        case nextTransferDate = "next_transfer_date"
    }

    /// Information about the gift
    public var gift: TGUniqueGift

    /// Origin of the gift. Currently, either “upgrade” for gifts upgraded from regular gifts, “transfer” for gifts transferred from other users or channels, or “resale” for gifts bought from other users
    public var origin: String

    /// Optional. For gifts bought from other users, the price paid for the gift
    public var lastResaleStarCount: Int?

    /// Optional. Unique identifier of the received gift for the bot; only present for gifts received on behalf of business accounts
    public var ownedGiftId: String?

    /// Optional. Number of Telegram Stars that must be paid to transfer the gift; omitted if the bot cannot transfer the gift
    public var transferStarCount: Int?

    /// Optional. Point in time (Unix timestamp) when the gift can be transferred. If it is in the past, then the gift can be transferred now
    public var nextTransferDate: Int?

    public init (gift: TGUniqueGift, origin: String, lastResaleStarCount: Int? = nil, ownedGiftId: String? = nil, transferStarCount: Int? = nil, nextTransferDate: Int? = nil) {
        self.gift = gift
        self.origin = origin
        self.lastResaleStarCount = lastResaleStarCount
        self.ownedGiftId = ownedGiftId
        self.transferStarCount = transferStarCount
        self.nextTransferDate = nextTransferDate
    }
}
