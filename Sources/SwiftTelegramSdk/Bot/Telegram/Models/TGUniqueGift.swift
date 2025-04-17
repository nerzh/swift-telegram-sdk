// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes a unique gift that was upgraded from a regular gift.

 SeeAlso Telegram Bot API Reference:
 [UniqueGift](https://core.telegram.org/bots/api#uniquegift)
 **/
public final class TGUniqueGift: Codable {

    /// Custom keys for coding/decoding `UniqueGift` struct
    public enum CodingKeys: String, CodingKey {
        case baseName = "base_name"
        case name = "name"
        case number = "number"
        case model = "model"
        case symbol = "symbol"
        case backdrop = "backdrop"
    }

    /// Human-readable name of the regular gift from which this unique gift was upgraded
    public var baseName: String

    /// Unique name of the gift. This name can be used in https://t.me/nft/... links and story areas
    public var name: String

    /// Unique number of the upgraded gift among gifts upgraded from the same regular gift
    public var number: Int

    /// Model of the gift
    public var model: TGUniqueGiftModel

    /// Symbol of the gift
    public var symbol: TGUniqueGiftSymbol

    /// Backdrop of the gift
    public var backdrop: TGUniqueGiftBackdrop

    public init (baseName: String, name: String, number: Int, model: TGUniqueGiftModel, symbol: TGUniqueGiftSymbol, backdrop: TGUniqueGiftBackdrop) {
        self.baseName = baseName
        self.name = name
        self.number = number
        self.model = model
        self.symbol = symbol
        self.backdrop = backdrop
    }
}
