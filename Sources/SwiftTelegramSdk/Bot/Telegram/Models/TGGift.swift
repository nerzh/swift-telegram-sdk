// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a gift that can be sent by the bot.

 SeeAlso Telegram Bot API Reference:
 [Gift](https://core.telegram.org/bots/api#gift)
 **/
public final class TGGift: Codable {

    /// Custom keys for coding/decoding `Gift` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case sticker = "sticker"
        case starCount = "star_count"
        case upgradeStarCount = "upgrade_star_count"
        case totalCount = "total_count"
        case remainingCount = "remaining_count"
    }

    /// Unique identifier of the gift
    public var id: String

    /// The sticker that represents the gift
    public var sticker: TGSticker

    /// The number of Telegram Stars that must be paid to send the sticker
    public var starCount: Int

    /// Optional. The number of Telegram Stars that must be paid to upgrade the gift to a unique one
    public var upgradeStarCount: Int?

    /// Optional. The total number of the gifts of this type that can be sent; for limited gifts only
    public var totalCount: Int?

    /// Optional. The number of remaining gifts of this type that can be sent; for limited gifts only
    public var remainingCount: Int?

    public init (id: String, sticker: TGSticker, starCount: Int, upgradeStarCount: Int? = nil, totalCount: Int? = nil, remainingCount: Int? = nil) {
        self.id = id
        self.sticker = sticker
        self.starCount = starCount
        self.upgradeStarCount = upgradeStarCount
        self.totalCount = totalCount
        self.remainingCount = remainingCount
    }
}
