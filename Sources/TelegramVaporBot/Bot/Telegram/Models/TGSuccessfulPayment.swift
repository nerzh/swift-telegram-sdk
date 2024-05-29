// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object contains basic information about a successful payment.

 SeeAlso Telegram Bot API Reference:
 [SuccessfulPayment](https://core.telegram.org/bots/api#successfulpayment)
 **/
public final class TGSuccessfulPayment: Codable {

    /// Custom keys for coding/decoding `SuccessfulPayment` struct
    public enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case totalAmount = "total_amount"
        case invoicePayload = "invoice_payload"
        case shippingOptionId = "shipping_option_id"
        case orderInfo = "order_info"
        case telegramPaymentChargeId = "telegram_payment_charge_id"
        case providerPaymentChargeId = "provider_payment_charge_id"
    }

    /// Three-letter ISO 4217 currency code, or “XTR” for payments in Telegram Stars
    public var currency: String

    /// Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    public var totalAmount: Int

    /// Bot specified invoice payload
    public var invoicePayload: String

    /// Optional. Identifier of the shipping option chosen by the user
    public var shippingOptionId: String?

    /// Optional. Order information provided by the user
    public var orderInfo: TGOrderInfo?

    /// Telegram payment identifier
    public var telegramPaymentChargeId: String

    /// Provider payment identifier
    public var providerPaymentChargeId: String

    public init (currency: String, totalAmount: Int, invoicePayload: String, shippingOptionId: String? = nil, orderInfo: TGOrderInfo? = nil, telegramPaymentChargeId: String, providerPaymentChargeId: String) {
        self.currency = currency
        self.totalAmount = totalAmount
        self.invoicePayload = invoicePayload
        self.shippingOptionId = shippingOptionId
        self.orderInfo = orderInfo
        self.telegramPaymentChargeId = telegramPaymentChargeId
        self.providerPaymentChargeId = providerPaymentChargeId
    }
}
