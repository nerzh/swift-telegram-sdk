// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Contains the list of gifts received and owned by a user or a chat.

 SeeAlso Telegram Bot API Reference:
 [OwnedGifts](https://core.telegram.org/bots/api#ownedgifts)
 **/
public final class TGOwnedGifts: Codable {

    /// Custom keys for coding/decoding `OwnedGifts` struct
    public enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case gifts = "gifts"
        case nextOffset = "next_offset"
    }

    /// The total number of gifts owned by the user or the chat
    public var totalCount: Int

    /// The list of gifts
    public var gifts: [TGOwnedGift]

    /// Optional. Offset for the next request. If empty, then there are no more results
    public var nextOffset: String?

    public init (totalCount: Int, gifts: [TGOwnedGift], nextOffset: String? = nil) {
        self.totalCount = totalCount
        self.gifts = gifts
        self.nextOffset = nextOffset
    }
}
