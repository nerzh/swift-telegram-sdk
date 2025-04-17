// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the model of a unique gift.

 SeeAlso Telegram Bot API Reference:
 [UniqueGiftModel](https://core.telegram.org/bots/api#uniquegiftmodel)
 **/
public final class TGUniqueGiftModel: Codable {

    /// Custom keys for coding/decoding `UniqueGiftModel` struct
    public enum CodingKeys: String, CodingKey {
        case name = "name"
        case sticker = "sticker"
        case rarityPerMille = "rarity_per_mille"
    }

    /// Name of the model
    public var name: String

    /// The sticker that represents the unique gift
    public var sticker: TGSticker

    /// The number of unique gifts that receive this model for every 1000 gifts upgraded
    public var rarityPerMille: Int

    public init (name: String, sticker: TGSticker, rarityPerMille: Int) {
        self.name = name
        self.sticker = sticker
        self.rarityPerMille = rarityPerMille
    }
}
