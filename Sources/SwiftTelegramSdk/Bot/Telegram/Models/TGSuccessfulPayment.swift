// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains basic information about a successful payment. Note that if the buyer initiates a chargeback with the relevant payment provider following this transaction, the funds may be debited from your balance. This is outside of Telegram's control.

 SeeAlso Telegram Bot API Reference:
 [SuccessfulPayment](https://core.telegram.org/bots/api#successfulpayment)
 **/
public final class TGSuccessfulPayment: Codable {

    /// Custom keys for coding/decoding `SuccessfulPayment` struct
    public enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case totalAmount = "total_amount"
        case invoicePayload = "invoice_payload"
        case subscriptionExpirationDate = "subscription_expiration_date"
        case isRecurring = "is_recurring"
        case isFirstRecurring = "is_first_recurring"
        case shippingOptionId = "shipping_option_id"
        case orderInfo = "order_info"
        case telegramPaymentChargeId = "telegram_payment_charge_id"
        case providerPaymentChargeId = "provider_payment_charge_id"
    }

    /// Three-letter ISO 4217 currency code, or “XTR” for payments in Telegram Stars
    public var currency: String

    /// Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    public var totalAmount: Int

    /// Bot-specified invoice payload
    public var invoicePayload: String

    /// Optional. Expiration date of the subscription, in Unix time; for recurring payments only
    public var subscriptionExpirationDate: Int?

    /// Optional. True, if the payment is a recurring payment for a subscription
    public var isRecurring: Bool?

    /// Optional. True, if the payment is the first payment for a subscription
    public var isFirstRecurring: Bool?

    /// Optional. Identifier of the shipping option chosen by the user
    public var shippingOptionId: String?

    /// Optional. Order information provided by the user
    public var orderInfo: TGOrderInfo?

    /// Telegram payment identifier
    public var telegramPaymentChargeId: String

    /// Provider payment identifier
    public var providerPaymentChargeId: String

    public init (currency: String, totalAmount: Int, invoicePayload: String, subscriptionExpirationDate: Int? = nil, isRecurring: Bool? = nil, isFirstRecurring: Bool? = nil, shippingOptionId: String? = nil, orderInfo: TGOrderInfo? = nil, telegramPaymentChargeId: String, providerPaymentChargeId: String) {
        self.currency = currency
        self.totalAmount = totalAmount
        self.invoicePayload = invoicePayload
        self.subscriptionExpirationDate = subscriptionExpirationDate
        self.isRecurring = isRecurring
        self.isFirstRecurring = isFirstRecurring
        self.shippingOptionId = shippingOptionId
        self.orderInfo = orderInfo
        self.telegramPaymentChargeId = telegramPaymentChargeId
        self.providerPaymentChargeId = providerPaymentChargeId
    }
}
