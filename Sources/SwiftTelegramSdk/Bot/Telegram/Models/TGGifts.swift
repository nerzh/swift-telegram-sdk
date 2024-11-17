// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represent a list of gifts.

 SeeAlso Telegram Bot API Reference:
 [Gifts](https://core.telegram.org/bots/api#gifts)
 **/
public final class TGGifts: Codable {

    /// Custom keys for coding/decoding `Gifts` struct
    public enum CodingKeys: String, CodingKey {
        case gifts = "gifts"
    }

    /// The list of gifts
    public var gifts: [TGGift]

    public init (gifts: [TGGift]) {
        self.gifts = gifts
    }
}
