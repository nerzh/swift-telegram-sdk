// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes the affiliate program that issued the affiliate commission received via this transaction.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerAffiliateProgram](https://core.telegram.org/bots/api#transactionpartneraffiliateprogram)
 */

public enum TGTransactionPartnerAffiliateProgramType: String, Codable {
    case affiliateProgram = "affiliate_program"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGTransactionPartnerAffiliateProgramType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}