// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Allows the bot to cancel or re-enable extension of a subscription paid in Telegram Stars. Returns True on success.


/// Parameters container struct for `editUserStarSubscription` method
public struct TGEditUserStarSubscriptionParams: Encodable {

    /// Identifier of the user whose subscription will be edited
    public var userId: Int64

    /// Telegram payment identifier for the subscription
    public var telegramPaymentChargeId: String

    /// Pass True to cancel extension of the user subscription; the subscription must be active up to the end of the current subscription period. Pass False to allow the user to re-enable a subscription that was previously canceled by the bot.
    public var isCanceled: Bool

    /// Custom keys for coding/decoding `EditUserStarSubscriptionParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case telegramPaymentChargeId = "telegram_payment_charge_id"
            case isCanceled = "is_canceled"
    }

    public init(userId: Int64, telegramPaymentChargeId: String, isCanceled: Bool) {
            self.userId = userId
            self.telegramPaymentChargeId = telegramPaymentChargeId
            self.isCanceled = isCanceled
    }
}


public extension TGBot {

/**
 Allows the bot to cancel or re-enable extension of a subscription paid in Telegram Stars. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [EditUserStarSubscriptionParams](https://core.telegram.org/bots/api#edituserstarsubscription)
 
 - Parameters:
     - params: Parameters container, see `EditUserStarSubscriptionParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func editUserStarSubscription(params: TGEditUserStarSubscriptionParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("editUserStarSubscription")) else {
            throw BotError("Bad URL: \(getMethodURL("editUserStarSubscription"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
