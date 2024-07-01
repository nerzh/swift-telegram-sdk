// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Contains a list of Telegram Star transactions.

 SeeAlso Telegram Bot API Reference:
 [StarTransactions](https://core.telegram.org/bots/api#startransactions)
 **/
public final class TGStarTransactions: Codable {

    /// Custom keys for coding/decoding `StarTransactions` struct
    public enum CodingKeys: String, CodingKey {
        case transactions = "transactions"
    }

    /// The list of transactions
    public var transactions: [TGStarTransaction]

    public init (transactions: [TGStarTransaction]) {
        self.transactions = transactions
    }
}
