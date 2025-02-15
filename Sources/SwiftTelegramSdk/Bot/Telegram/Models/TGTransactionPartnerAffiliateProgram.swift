// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes the affiliate program that issued the affiliate commission received via this transaction.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerAffiliateProgram](https://core.telegram.org/bots/api#transactionpartneraffiliateprogram)
 **/
public final class TGTransactionPartnerAffiliateProgram: Codable {

    /// Custom keys for coding/decoding `TransactionPartnerAffiliateProgram` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case sponsorUser = "sponsor_user"
        case commissionPerMille = "commission_per_mille"
    }

    /// Type of the transaction partner, always “affiliate_program”
    public var type: TGTransactionPartnerAffiliateProgramType

    /// Optional. Information about the bot that sponsored the affiliate program
    public var sponsorUser: TGUser?

    /// The number of Telegram Stars received by the bot for each 1000 Telegram Stars received by the affiliate program sponsor from referred users
    public var commissionPerMille: Int

    public init (type: TGTransactionPartnerAffiliateProgramType, sponsorUser: TGUser? = nil, commissionPerMille: Int) {
        self.type = type
        self.sponsorUser = sponsorUser
        self.commissionPerMille = commissionPerMille
    }
}
