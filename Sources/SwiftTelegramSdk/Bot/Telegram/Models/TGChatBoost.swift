// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about a chat boost.

 SeeAlso Telegram Bot API Reference:
 [ChatBoost](https://core.telegram.org/bots/api#chatboost)
 **/
public final class TGChatBoost: Codable {

    /// Custom keys for coding/decoding `ChatBoost` struct
    public enum CodingKeys: String, CodingKey {
        case boostId = "boost_id"
        case addDate = "add_date"
        case expirationDate = "expiration_date"
        case source = "source"
    }

    /// Unique identifier of the boost
    public var boostId: String

    /// Point in time (Unix timestamp) when the chat was boosted
    public var addDate: Int

    /// Point in time (Unix timestamp) when the boost will automatically expire, unless the booster's Telegram Premium subscription is prolonged
    public var expirationDate: Int

    /// Source of the added boost
    public var source: TGChatBoostSource

    public init (boostId: String, addDate: Int, expirationDate: Int, source: TGChatBoostSource) {
        self.boostId = boostId
        self.addDate = addDate
        self.expirationDate = expirationDate
        self.source = source
    }
}
