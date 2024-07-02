// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The boost was obtained by the creation of Telegram Premium gift codes to boost a chat. Each such code boosts the chat 4 times for the duration of the corresponding Telegram Premium subscription.

 SeeAlso Telegram Bot API Reference:
 [ChatBoostSourceGiftCode](https://core.telegram.org/bots/api#chatboostsourcegiftcode)
 **/
public final class TGChatBoostSourceGiftCode: Codable {

    /// Custom keys for coding/decoding `ChatBoostSourceGiftCode` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case user = "user"
    }

    /// Source of the boost, always “gift_code”
    public var source: String

    /// User for which the gift code was created
    public var user: TGUser

    public init (source: String, user: TGUser) {
        self.source = source
        self.user = user
    }
}
