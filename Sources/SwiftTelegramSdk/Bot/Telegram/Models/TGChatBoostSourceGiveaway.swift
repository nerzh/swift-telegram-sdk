// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The boost was obtained by the creation of a Telegram Premium giveaway. This boosts the chat 4 times for the duration of the corresponding Telegram Premium subscription.

 SeeAlso Telegram Bot API Reference:
 [ChatBoostSourceGiveaway](https://core.telegram.org/bots/api#chatboostsourcegiveaway)
 **/
public final class TGChatBoostSourceGiveaway: Codable {

    /// Custom keys for coding/decoding `ChatBoostSourceGiveaway` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case giveawayMessageId = "giveaway_message_id"
        case user = "user"
        case isUnclaimed = "is_unclaimed"
    }

    /// Source of the boost, always “giveaway”
    public var source: String

    /// Identifier of a message in the chat with the giveaway; the message could have been deleted already. May be 0 if the message isn't sent yet.
    public var giveawayMessageId: Int

    /// Optional. User that won the prize in the giveaway if any
    public var user: TGUser?

    /// Optional. True, if the giveaway was completed, but there was no user to win the prize
    public var isUnclaimed: Bool?

    public init (source: String, giveawayMessageId: Int, user: TGUser? = nil, isUnclaimed: Bool? = nil) {
        self.source = source
        self.giveawayMessageId = giveawayMessageId
        self.user = user
        self.isUnclaimed = isUnclaimed
    }
}
