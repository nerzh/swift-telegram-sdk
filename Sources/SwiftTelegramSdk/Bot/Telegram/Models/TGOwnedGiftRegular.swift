// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a regular gift owned by a user or a chat.

 SeeAlso Telegram Bot API Reference:
 [OwnedGiftRegular](https://core.telegram.org/bots/api#ownedgiftregular)
 **/
public final class TGOwnedGiftRegular: Codable {

    /// Custom keys for coding/decoding `OwnedGiftRegular` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case gift = "gift"
        case ownedGiftId = "owned_gift_id"
        case senderUser = "sender_user"
        case sendDate = "send_date"
        case text = "text"
        case entities = "entities"
        case isPrivate = "is_private"
        case isSaved = "is_saved"
        case canBeUpgraded = "can_be_upgraded"
        case wasRefunded = "was_refunded"
        case convertStarCount = "convert_star_count"
        case prepaidUpgradeStarCount = "prepaid_upgrade_star_count"
    }

    /// Type of the gift, always “regular”
    public var type: TGOwnedGiftRegularType

    /// Information about the regular gift
    public var gift: TGGift

    /// Optional. Unique identifier of the gift for the bot; for gifts received on behalf of business accounts only
    public var ownedGiftId: String?

    /// Optional. Sender of the gift if it is a known user
    public var senderUser: TGUser?

    /// Date the gift was sent in Unix time
    public var sendDate: Int

    /// Optional. Text of the message that was added to the gift
    public var text: String?

    /// Optional. Special entities that appear in the text
    public var entities: [TGMessageEntity]?

    /// Optional. True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them
    public var isPrivate: Bool?

    /// Optional. True, if the gift is displayed on the account's profile page; for gifts received on behalf of business accounts only
    public var isSaved: Bool?

    /// Optional. True, if the gift can be upgraded to a unique gift; for gifts received on behalf of business accounts only
    public var canBeUpgraded: Bool?

    /// Optional. True, if the gift was refunded and isn't available anymore
    public var wasRefunded: Bool?

    /// Optional. Number of Telegram Stars that can be claimed by the receiver instead of the gift; omitted if the gift cannot be converted to Telegram Stars
    public var convertStarCount: Int?

    /// Optional. Number of Telegram Stars that were paid by the sender for the ability to upgrade the gift
    public var prepaidUpgradeStarCount: Int?

    public init (type: TGOwnedGiftRegularType, gift: TGGift, ownedGiftId: String? = nil, senderUser: TGUser? = nil, sendDate: Int, text: String? = nil, entities: [TGMessageEntity]? = nil, isPrivate: Bool? = nil, isSaved: Bool? = nil, canBeUpgraded: Bool? = nil, wasRefunded: Bool? = nil, convertStarCount: Int? = nil, prepaidUpgradeStarCount: Int? = nil) {
        self.type = type
        self.gift = gift
        self.ownedGiftId = ownedGiftId
        self.senderUser = senderUser
        self.sendDate = sendDate
        self.text = text
        self.entities = entities
        self.isPrivate = isPrivate
        self.isSaved = isSaved
        self.canBeUpgraded = canBeUpgraded
        self.wasRefunded = wasRefunded
        self.convertStarCount = convertStarCount
        self.prepaidUpgradeStarCount = prepaidUpgradeStarCount
    }
}
