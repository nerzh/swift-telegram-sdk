// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a boost added to a chat or changed.

 SeeAlso Telegram Bot API Reference:
 [ChatBoostUpdated](https://core.telegram.org/bots/api#chatboostupdated)
 **/
public final class TGChatBoostUpdated: Codable {

    /// Custom keys for coding/decoding `ChatBoostUpdated` struct
    public enum CodingKeys: String, CodingKey {
        case chat = "chat"
        case boost = "boost"
    }

    /// Chat which was boosted
    public var chat: TGChat

    /// Information about the chat boost
    public var boost: TGChatBoost

    public init (chat: TGChat, boost: TGChatBoost) {
        self.chat = chat
        self.boost = boost
    }
}
