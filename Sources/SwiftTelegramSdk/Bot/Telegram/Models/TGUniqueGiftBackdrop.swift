// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the backdrop of a unique gift.

 SeeAlso Telegram Bot API Reference:
 [UniqueGiftBackdrop](https://core.telegram.org/bots/api#uniquegiftbackdrop)
 **/
public final class TGUniqueGiftBackdrop: Codable {

    /// Custom keys for coding/decoding `UniqueGiftBackdrop` struct
    public enum CodingKeys: String, CodingKey {
        case name = "name"
        case colors = "colors"
        case rarityPerMille = "rarity_per_mille"
    }

    /// Name of the backdrop
    public var name: String

    /// Colors of the backdrop
    public var colors: TGUniqueGiftBackdropColors

    /// The number of unique gifts that receive this backdrop for every 1000 gifts upgraded
    public var rarityPerMille: Int

    public init (name: String, colors: TGUniqueGiftBackdropColors, rarityPerMille: Int) {
        self.name = name
        self.colors = colors
        self.rarityPerMille = rarityPerMille
    }
}
