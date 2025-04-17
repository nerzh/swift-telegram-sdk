// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about a change in the price of paid messages within a chat.

 SeeAlso Telegram Bot API Reference:
 [PaidMessagePriceChanged](https://core.telegram.org/bots/api#paidmessagepricechanged)
 **/
public final class TGPaidMessagePriceChanged: Codable {

    /// Custom keys for coding/decoding `PaidMessagePriceChanged` struct
    public enum CodingKeys: String, CodingKey {
        case paidMessageStarCount = "paid_message_star_count"
    }

    /// The new number of Telegram Stars that must be paid by non-administrator users of the supergroup chat for each sent message
    public var paidMessageStarCount: Int

    public init (paidMessageStarCount: Int) {
        self.paidMessageStarCount = paidMessageStarCount
    }
}
