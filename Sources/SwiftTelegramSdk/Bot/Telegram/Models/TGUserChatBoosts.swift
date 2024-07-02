// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a list of boosts added to a chat by a user.

 SeeAlso Telegram Bot API Reference:
 [UserChatBoosts](https://core.telegram.org/bots/api#userchatboosts)
 **/
public final class TGUserChatBoosts: Codable {

    /// Custom keys for coding/decoding `UserChatBoosts` struct
    public enum CodingKeys: String, CodingKey {
        case boosts = "boosts"
    }

    /// The list of boosts added to the chat by the user
    public var boosts: [TGChatBoost]

    public init (boosts: [TGChatBoost]) {
        self.boosts = boosts
    }
}
