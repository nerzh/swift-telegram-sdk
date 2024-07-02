// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Describes a transaction with an unknown source or recipient.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerOther](https://core.telegram.org/bots/api#transactionpartnerother)
 **/
public final class TGTransactionPartnerOther: Codable {

    /// Custom keys for coding/decoding `TransactionPartnerOther` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Type of the transaction partner, always “other”
    public var type: TGTransactionPartnerOtherType

    public init (type: TGTransactionPartnerOtherType) {
        self.type = type
    }
}
