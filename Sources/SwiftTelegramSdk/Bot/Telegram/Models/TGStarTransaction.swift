// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Describes a Telegram Star transaction.

 SeeAlso Telegram Bot API Reference:
 [StarTransaction](https://core.telegram.org/bots/api#startransaction)
 **/
public final class TGStarTransaction: Codable {

    /// Custom keys for coding/decoding `StarTransaction` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case amount = "amount"
        case date = "date"
        case source = "source"
        case receiver = "receiver"
    }

    /// Unique identifier of the transaction. Coincides with the identifer of the original transaction for refund transactions. Coincides with SuccessfulPayment.telegram_payment_charge_id for successful incoming payments from users.
    public var id: String

    /// Number of Telegram Stars transferred by the transaction
    public var amount: Int

    /// Date the transaction was created in Unix time
    public var date: Int

    /// Optional. Source of an incoming transaction (e.g., a user purchasing goods or services, Fragment refunding a failed withdrawal). Only for incoming transactions
    public var source: TGTransactionPartner?

    /// Optional. Receiver of an outgoing transaction (e.g., a user for a purchase refund, Fragment for a withdrawal). Only for outgoing transactions
    public var receiver: TGTransactionPartner?

    public init (id: String, amount: Int, date: Int, source: TGTransactionPartner? = nil, receiver: TGTransactionPartner? = nil) {
        self.id = id
        self.amount = amount
        self.date = date
        self.source = source
        self.receiver = receiver
    }
}
