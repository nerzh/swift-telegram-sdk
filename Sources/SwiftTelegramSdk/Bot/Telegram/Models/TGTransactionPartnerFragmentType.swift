// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a withdrawal transaction with Fragment.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerFragment](https://core.telegram.org/bots/api#transactionpartnerfragment)
 */

public enum TGTransactionPartnerFragmentType: String, Codable {
    case fragment = "fragment"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGTransactionPartnerFragmentType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}