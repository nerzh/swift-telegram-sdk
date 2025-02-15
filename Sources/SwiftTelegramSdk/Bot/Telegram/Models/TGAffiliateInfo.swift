// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Contains information about the affiliate that received a commission via this transaction.

 SeeAlso Telegram Bot API Reference:
 [AffiliateInfo](https://core.telegram.org/bots/api#affiliateinfo)
 **/
public final class TGAffiliateInfo: Codable {

    /// Custom keys for coding/decoding `AffiliateInfo` struct
    public enum CodingKeys: String, CodingKey {
        case affiliateUser = "affiliate_user"
        case affiliateChat = "affiliate_chat"
        case commissionPerMille = "commission_per_mille"
        case amount = "amount"
        case nanostarAmount = "nanostar_amount"
    }

    /// Optional. The bot or the user that received an affiliate commission if it was received by a bot or a user
    public var affiliateUser: TGUser?

    /// Optional. The chat that received an affiliate commission if it was received by a chat
    public var affiliateChat: TGChat?

    /// The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the bot from referred users
    public var commissionPerMille: Int

    /// Integer amount of Telegram Stars received by the affiliate from the transaction, rounded to 0; can be negative for refunds
    public var amount: Int

    /// Optional. The number of 1/1000000000 shares of Telegram Stars received by the affiliate; from -999999999 to 999999999; can be negative for refunds
    public var nanostarAmount: Int?

    public init (affiliateUser: TGUser? = nil, affiliateChat: TGChat? = nil, commissionPerMille: Int, amount: Int, nanostarAmount: Int? = nil) {
        self.affiliateUser = affiliateUser
        self.affiliateChat = affiliateChat
        self.commissionPerMille = commissionPerMille
        self.amount = amount
        self.nanostarAmount = nanostarAmount
    }
}
