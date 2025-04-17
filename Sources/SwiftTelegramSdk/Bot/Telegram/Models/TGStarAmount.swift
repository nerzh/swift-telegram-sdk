// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes an amount of Telegram Stars.

 SeeAlso Telegram Bot API Reference:
 [StarAmount](https://core.telegram.org/bots/api#staramount)
 **/
public final class TGStarAmount: Codable {

    /// Custom keys for coding/decoding `StarAmount` struct
    public enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case nanostarAmount = "nanostar_amount"
    }

    /// Integer amount of Telegram Stars, rounded to 0; can be negative
    public var amount: Int

    /// Optional. The number of 1/1000000000 shares of Telegram Stars; from -999999999 to 999999999; can be negative if and only if amount is non-positive
    public var nanostarAmount: Int?

    public init (amount: Int, nanostarAmount: Int? = nil) {
        self.amount = amount
        self.nanostarAmount = nanostarAmount
    }
}
