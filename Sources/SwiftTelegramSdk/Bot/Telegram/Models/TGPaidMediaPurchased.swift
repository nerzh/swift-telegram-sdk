// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about a paid media purchase.

 SeeAlso Telegram Bot API Reference:
 [PaidMediaPurchased](https://core.telegram.org/bots/api#paidmediapurchased)
 **/
public final class TGPaidMediaPurchased: Codable {

    /// Custom keys for coding/decoding `PaidMediaPurchased` struct
    public enum CodingKeys: String, CodingKey {
        case from = "from"
        case paidMediaPayload = "paid_media_payload"
    }

    /// User who purchased the media
    public var from: TGUser

    /// Bot-specified paid media payload
    public var paidMediaPayload: String

    public init (from: TGUser, paidMediaPayload: String) {
        self.from = from
        self.paidMediaPayload = paidMediaPayload
    }
}
