// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to create a link for an invoice. Returns the created invoice link as String on success.


/// Parameters container struct for `createInvoiceLink` method
public struct TGCreateInvoiceLinkParams: Encodable {

    /// Unique identifier of the business connection on behalf of which the link will be created. For payments in Telegram Stars only.
    public var businessConnectionId: String?

    /// Product name, 1-32 characters
    public var title: String

    /// Product description, 1-255 characters
    public var description: String

    /// Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use it for your internal processes.
    public var payload: String

    /// Payment provider token, obtained via @BotFather. Pass an empty string for payments in Telegram Stars.
    public var providerToken: String?

    /// Three-letter ISO 4217 currency code, see more on currencies. Pass “XTR” for payments in Telegram Stars.
    public var currency: String

    /// Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.). Must contain exactly one item for payments in Telegram Stars.
    public var prices: [TGLabeledPrice]

    /// The number of seconds the subscription will be active for before the next payment. The currency must be set to “XTR” (Telegram Stars) if the parameter is used. Currently, it must always be 2592000 (30 days) if specified. Any number of subscriptions can be active for a given bot at the same time, including multiple concurrent subscriptions from the same user. Subscription price must no exceed 10000 Telegram Stars.
    public var subscriptionPeriod: Int?

    /// The maximum accepted amount for tips in the smallest units of the currency (integer, not float/double). For example, for a maximum tip of US$ 1.45 pass max_tip_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0. Not supported for payments in Telegram Stars.
    public var maxTipAmount: Int?

    /// A JSON-serialized array of suggested amounts of tips in the smallest units of the currency (integer, not float/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed max_tip_amount.
    public var suggestedTipAmounts: [Int]?

    /// JSON-serialized data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
    public var providerData: String?

    /// URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service.
    public var photoUrl: String?

    /// Photo size in bytes
    public var photoSize: Int?

    /// Photo width
    public var photoWidth: Int?

    /// Photo height
    public var photoHeight: Int?

    /// Pass True if you require the user's full name to complete the order. Ignored for payments in Telegram Stars.
    public var needName: Bool?

    /// Pass True if you require the user's phone number to complete the order. Ignored for payments in Telegram Stars.
    public var needPhoneNumber: Bool?

    /// Pass True if you require the user's email address to complete the order. Ignored for payments in Telegram Stars.
    public var needEmail: Bool?

    /// Pass True if you require the user's shipping address to complete the order. Ignored for payments in Telegram Stars.
    public var needShippingAddress: Bool?

    /// Pass True if the user's phone number should be sent to the provider. Ignored for payments in Telegram Stars.
    public var sendPhoneNumberToProvider: Bool?

    /// Pass True if the user's email address should be sent to the provider. Ignored for payments in Telegram Stars.
    public var sendEmailToProvider: Bool?

    /// Pass True if the final price depends on the shipping method. Ignored for payments in Telegram Stars.
    public var isFlexible: Bool?

    /// Custom keys for coding/decoding `CreateInvoiceLinkParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case title = "title"
            case description = "description"
            case payload = "payload"
            case providerToken = "provider_token"
            case currency = "currency"
            case prices = "prices"
            case subscriptionPeriod = "subscription_period"
            case maxTipAmount = "max_tip_amount"
            case suggestedTipAmounts = "suggested_tip_amounts"
            case providerData = "provider_data"
            case photoUrl = "photo_url"
            case photoSize = "photo_size"
            case photoWidth = "photo_width"
            case photoHeight = "photo_height"
            case needName = "need_name"
            case needPhoneNumber = "need_phone_number"
            case needEmail = "need_email"
            case needShippingAddress = "need_shipping_address"
            case sendPhoneNumberToProvider = "send_phone_number_to_provider"
            case sendEmailToProvider = "send_email_to_provider"
            case isFlexible = "is_flexible"
    }

    public init(businessConnectionId: String? = nil, title: String, description: String, payload: String, providerToken: String? = nil, currency: String, prices: [TGLabeledPrice], subscriptionPeriod: Int? = nil, maxTipAmount: Int? = nil, suggestedTipAmounts: [Int]? = nil, providerData: String? = nil, photoUrl: String? = nil, photoSize: Int? = nil, photoWidth: Int? = nil, photoHeight: Int? = nil, needName: Bool? = nil, needPhoneNumber: Bool? = nil, needEmail: Bool? = nil, needShippingAddress: Bool? = nil, sendPhoneNumberToProvider: Bool? = nil, sendEmailToProvider: Bool? = nil, isFlexible: Bool? = nil) {
            self.businessConnectionId = businessConnectionId
            self.title = title
            self.description = description
            self.payload = payload
            self.providerToken = providerToken
            self.currency = currency
            self.prices = prices
            self.subscriptionPeriod = subscriptionPeriod
            self.maxTipAmount = maxTipAmount
            self.suggestedTipAmounts = suggestedTipAmounts
            self.providerData = providerData
            self.photoUrl = photoUrl
            self.photoSize = photoSize
            self.photoWidth = photoWidth
            self.photoHeight = photoHeight
            self.needName = needName
            self.needPhoneNumber = needPhoneNumber
            self.needEmail = needEmail
            self.needShippingAddress = needShippingAddress
            self.sendPhoneNumberToProvider = sendPhoneNumberToProvider
            self.sendEmailToProvider = sendEmailToProvider
            self.isFlexible = isFlexible
    }
}


public extension TGBot {

/**
 Use this method to create a link for an invoice. Returns the created invoice link as String on success.

 SeeAlso Telegram Bot API Reference:
 [CreateInvoiceLinkParams](https://core.telegram.org/bots/api#createinvoicelink)
 
 - Parameters:
     - params: Parameters container, see `CreateInvoiceLinkParams` struct
 - Throws: Throws on errors
 - Returns: `String`
 */

    @discardableResult
    func createInvoiceLink(params: TGCreateInvoiceLinkParams) async throws -> String {
        guard let methodURL: URL = .init(string: getMethodURL("createInvoiceLink")) else {
            throw BotError("Bad URL: \(getMethodURL("createInvoiceLink"))")
        }
        let result: String = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
