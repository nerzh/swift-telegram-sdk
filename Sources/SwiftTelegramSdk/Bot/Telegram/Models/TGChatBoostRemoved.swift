// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a boost removed from a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatBoostRemoved](https://core.telegram.org/bots/api#chatboostremoved)
 **/
public final class TGChatBoostRemoved: Codable {

    /// Custom keys for coding/decoding `ChatBoostRemoved` struct
    public enum CodingKeys: String, CodingKey {
        case chat = "chat"
        case boostId = "boost_id"
        case removeDate = "remove_date"
        case source = "source"
    }

    /// Chat which was boosted
    public var chat: TGChat

    /// Unique identifier of the boost
    public var boostId: String

    /// Point in time (Unix timestamp) when the boost was removed
    public var removeDate: Int

    /// Source of the removed boost
    public var source: TGChatBoostSource

    public init (chat: TGChat, boostId: String, removeDate: Int, source: TGChatBoostSource) {
        self.chat = chat
        self.boostId = boostId
        self.removeDate = removeDate
        self.source = source
    }
}
