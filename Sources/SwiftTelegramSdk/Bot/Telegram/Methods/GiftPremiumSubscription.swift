// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Gifts a Telegram Premium subscription to the given user. Returns True on success.


/// Parameters container struct for `giftPremiumSubscription` method
public struct TGGiftPremiumSubscriptionParams: Encodable {

    /// Unique identifier of the target user who will receive a Telegram Premium subscription
    public var userId: Int64

    /// Number of months the Telegram Premium subscription will be active for the user; must be one of 3, 6, or 12
    public var monthCount: Int

    /// Number of Telegram Stars to pay for the Telegram Premium subscription; must be 1000 for 3 months, 1500 for 6 months, and 2500 for 12 months
    public var starCount: Int

    /// Text that will be shown along with the service message about the subscription; 0-128 characters
    public var text: String?

    /// Mode for parsing entities in the text. See formatting options for more details. Entities other than “bold”, “italic”, “underline”, “strikethrough”, “spoiler”, and “custom_emoji” are ignored.
    public var textParseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the gift text. It can be specified instead of text_parse_mode. Entities other than “bold”, “italic”, “underline”, “strikethrough”, “spoiler”, and “custom_emoji” are ignored.
    public var textEntities: [TGMessageEntity]?

    /// Custom keys for coding/decoding `GiftPremiumSubscriptionParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case monthCount = "month_count"
            case starCount = "star_count"
            case text = "text"
            case textParseMode = "text_parse_mode"
            case textEntities = "text_entities"
    }

    public init(userId: Int64, monthCount: Int, starCount: Int, text: String? = nil, textParseMode: TGParseMode? = nil, textEntities: [TGMessageEntity]? = nil) {
            self.userId = userId
            self.monthCount = monthCount
            self.starCount = starCount
            self.text = text
            self.textParseMode = textParseMode
            self.textEntities = textEntities
    }
}


public extension TGBot {

/**
 Gifts a Telegram Premium subscription to the given user. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [GiftPremiumSubscriptionParams](https://core.telegram.org/bots/api#giftpremiumsubscription)
 
 - Parameters:
     - params: Parameters container, see `GiftPremiumSubscriptionParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func giftPremiumSubscription(params: TGGiftPremiumSubscriptionParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("giftPremiumSubscription")) else {
            throw BotError("Bad URL: \(getMethodURL("giftPremiumSubscription"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
