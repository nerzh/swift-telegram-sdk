// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents one shipping option.

 SeeAlso Telegram Bot API Reference:
 [ShippingOption](https://core.telegram.org/bots/api#shippingoption)
 **/
public final class TGShippingOption: Codable {

    /// Custom keys for coding/decoding `ShippingOption` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case prices = "prices"
    }

    /// Shipping option identifier
    public var id: String

    /// Option title
    public var title: String

    /// List of price portions
    public var prices: [TGLabeledPrice]

    public init (id: String, title: String, prices: [TGLabeledPrice]) {
        self.id = id
        self.title = title
        self.prices = prices
    }
}
