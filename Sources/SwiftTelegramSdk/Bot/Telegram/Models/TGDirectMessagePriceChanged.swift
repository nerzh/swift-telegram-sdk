// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about a change in the price of direct messages sent to a channel chat.

 SeeAlso Telegram Bot API Reference:
 [DirectMessagePriceChanged](https://core.telegram.org/bots/api#directmessagepricechanged)
 **/
public final class TGDirectMessagePriceChanged: Codable {

    /// Custom keys for coding/decoding `DirectMessagePriceChanged` struct
    public enum CodingKeys: String, CodingKey {
        case areDirectMessagesEnabled = "are_direct_messages_enabled"
        case directMessageStarCount = "direct_message_star_count"
    }

    /// True, if direct messages are enabled for the channel chat; false otherwise
    public var areDirectMessagesEnabled: Bool

    /// Optional. The new number of Telegram Stars that must be paid by users for each direct message sent to the channel. Does not apply to users who have been exempted by administrators. Defaults to 0.
    public var directMessageStarCount: Int?

    public init (areDirectMessagesEnabled: Bool, directMessageStarCount: Int? = nil) {
        self.areDirectMessagesEnabled = areDirectMessagesEnabled
        self.directMessageStarCount = directMessageStarCount
    }
}
