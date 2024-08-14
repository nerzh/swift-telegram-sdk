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
        case paidMedia = "paid_media"
    }

    /// Type of the transaction partner, always “user”
    public var type: TGTransactionPartnerUserType

    /// Information about the user
    public var user: TGUser

    /// Optional. Bot-specified invoice payload
    public var invoicePayload: String?

    /// Optional. Information about the paid media bought by the user
    public var paidMedia: [TGPaidMedia]?

    public init (type: TGTransactionPartnerUserType, user: TGUser, invoicePayload: String? = nil, paidMedia: [TGPaidMedia]? = nil) {
        self.type = type
        self.user = user
        self.invoicePayload = invoicePayload
        self.paidMedia = paidMedia
    }
}
