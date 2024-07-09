// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains basic information about a refunded payment.

 SeeAlso Telegram Bot API Reference:
 [RefundedPayment](https://core.telegram.org/bots/api#refundedpayment)
 **/
public final class TGRefundedPayment: Codable {

    /// Custom keys for coding/decoding `RefundedPayment` struct
    public enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case totalAmount = "total_amount"
        case invoicePayload = "invoice_payload"
        case telegramPaymentChargeId = "telegram_payment_charge_id"
        case providerPaymentChargeId = "provider_payment_charge_id"
    }

    /// Three-letter ISO 4217 currency code, or “XTR” for payments in Telegram Stars. Currently, always “XTR”
    public var currency: String

    /// Total refunded price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45, total_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    public var totalAmount: Int

    /// Bot-specified invoice payload
    public var invoicePayload: String

    /// Telegram payment identifier
    public var telegramPaymentChargeId: String

    /// Optional. Provider payment identifier
    public var providerPaymentChargeId: String?

    public init (currency: String, totalAmount: Int, invoicePayload: String, telegramPaymentChargeId: String, providerPaymentChargeId: String? = nil) {
        self.currency = currency
        self.totalAmount = totalAmount
        self.invoicePayload = invoicePayload
        self.telegramPaymentChargeId = telegramPaymentChargeId
        self.providerPaymentChargeId = providerPaymentChargeId
    }
}
