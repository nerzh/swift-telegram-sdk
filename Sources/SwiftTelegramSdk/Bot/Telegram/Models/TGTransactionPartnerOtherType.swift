// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a transaction with an unknown source or recipient.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerOther](https://core.telegram.org/bots/api#transactionpartnerother)
 */

public enum TGTransactionPartnerOtherType: String, Codable {
    case other = "other"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGTransactionPartnerOtherType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}