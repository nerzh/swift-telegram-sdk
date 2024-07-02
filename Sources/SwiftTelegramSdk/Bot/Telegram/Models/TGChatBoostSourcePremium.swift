// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The boost was obtained by subscribing to Telegram Premium or by gifting a Telegram Premium subscription to another user.

 SeeAlso Telegram Bot API Reference:
 [ChatBoostSourcePremium](https://core.telegram.org/bots/api#chatboostsourcepremium)
 **/
public final class TGChatBoostSourcePremium: Codable {

    /// Custom keys for coding/decoding `ChatBoostSourcePremium` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case user = "user"
    }

    /// Source of the boost, always “premium”
    public var source: String

    /// User that boosted the chat
    public var user: TGUser

    public init (source: String, user: TGUser) {
        self.source = source
        self.user = user
    }
}
