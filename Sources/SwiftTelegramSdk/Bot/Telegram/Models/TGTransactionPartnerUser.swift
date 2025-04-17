// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a transaction with a user.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerUser](https://core.telegram.org/bots/api#transactionpartneruser)
 **/
public final class TGTransactionPartnerUser: Codable {

    /// Custom keys for coding/decoding `TransactionPartnerUser` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case transactionType = "transaction_type"
        case user = "user"
        case affiliate = "affiliate"
        case invoicePayload = "invoice_payload"
        case subscriptionPeriod = "subscription_period"
        case paidMedia = "paid_media"
        case paidMediaPayload = "paid_media_payload"
        case gift = "gift"
        case premiumSubscriptionDuration = "premium_subscription_duration"
    }

    /// Type of the transaction partner, always “user”
    public var type: TGTransactionPartnerUserType

    /// Type of the transaction, currently one of “invoice_payment” for payments via invoices, “paid_media_payment” for payments for paid media, “gift_purchase” for gifts sent by the bot, “premium_purchase” for Telegram Premium subscriptions gifted by the bot, “business_account_transfer” for direct transfers from managed business accounts
    public var transactionType: String

    /// Information about the user
    public var user: TGUser

    /// Optional. Information about the affiliate that received a commission via this transaction. Can be available only for “invoice_payment” and “paid_media_payment” transactions.
    public var affiliate: TGAffiliateInfo?

    /// Optional. Bot-specified invoice payload. Can be available only for “invoice_payment” transactions.
    public var invoicePayload: String?

    /// Optional. The duration of the paid subscription. Can be available only for “invoice_payment” transactions.
    public var subscriptionPeriod: Int?

    /// Optional. Information about the paid media bought by the user; for “paid_media_payment” transactions only
    public var paidMedia: [TGPaidMedia]?

    /// Optional. Bot-specified paid media payload. Can be available only for “paid_media_payment” transactions.
    public var paidMediaPayload: String?

    /// Optional. The gift sent to the user by the bot; for “gift_purchase” transactions only
    public var gift: TGGift?

    /// Optional. Number of months the gifted Telegram Premium subscription will be active for; for “premium_purchase” transactions only
    public var premiumSubscriptionDuration: Int?

    public init (type: TGTransactionPartnerUserType, transactionType: String, user: TGUser, affiliate: TGAffiliateInfo? = nil, invoicePayload: String? = nil, subscriptionPeriod: Int? = nil, paidMedia: [TGPaidMedia]? = nil, paidMediaPayload: String? = nil, gift: TGGift? = nil, premiumSubscriptionDuration: Int? = nil) {
        self.type = type
        self.transactionType = transactionType
        self.user = user
        self.affiliate = affiliate
        self.invoicePayload = invoicePayload
        self.subscriptionPeriod = subscriptionPeriod
        self.paidMedia = paidMedia
        self.paidMediaPayload = paidMediaPayload
        self.gift = gift
        self.premiumSubscriptionDuration = premiumSubscriptionDuration
    }
}
