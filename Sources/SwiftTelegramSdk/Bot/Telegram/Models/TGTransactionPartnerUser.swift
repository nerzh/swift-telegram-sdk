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
        case user = "user"
        case invoicePayload = "invoice_payload"
        case subscriptionPeriod = "subscription_period"
        case paidMedia = "paid_media"
        case paidMediaPayload = "paid_media_payload"
        case gift = "gift"
    }

    /// Type of the transaction partner, always “user”
    public var type: TGTransactionPartnerUserType

    /// Information about the user
    public var user: TGUser

    /// Optional. Bot-specified invoice payload
    public var invoicePayload: String?

    /// Optional. The duration of the paid subscription
    public var subscriptionPeriod: Int?

    /// Optional. Information about the paid media bought by the user
    public var paidMedia: [TGPaidMedia]?

    /// Optional. Bot-specified paid media payload
    public var paidMediaPayload: String?

    /// Optional. The gift sent to the user by the bot
    public var gift: String?

    public init (type: TGTransactionPartnerUserType, user: TGUser, invoicePayload: String? = nil, subscriptionPeriod: Int? = nil, paidMedia: [TGPaidMedia]? = nil, paidMediaPayload: String? = nil, gift: String? = nil) {
        self.type = type
        self.user = user
        self.invoicePayload = invoicePayload
        self.subscriptionPeriod = subscriptionPeriod
        self.paidMedia = paidMedia
        self.paidMediaPayload = paidMediaPayload
        self.gift = gift
    }
}
