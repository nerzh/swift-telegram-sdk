// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about one answer option in a poll.

 SeeAlso Telegram Bot API Reference:
 [PollOption](https://core.telegram.org/bots/api#polloption)
 **/
public final class TGPollOption: Codable {

    /// Custom keys for coding/decoding `PollOption` struct
    public enum CodingKeys: String, CodingKey {
        case text = "text"
        case textEntities = "text_entities"
        case voterCount = "voter_count"
    }

    /// Option text, 1-100 characters
    public var text: String

    /// Optional. Special entities that appear in the option text. Currently, only custom emoji entities are allowed in poll option texts
    public var textEntities: [TGMessageEntity]?

    /// Number of users that voted for this option
    public var voterCount: Int

    public init (text: String, textEntities: [TGMessageEntity]? = nil, voterCount: Int) {
        self.text = text
        self.textEntities = textEntities
        self.voterCount = voterCount
    }
}
