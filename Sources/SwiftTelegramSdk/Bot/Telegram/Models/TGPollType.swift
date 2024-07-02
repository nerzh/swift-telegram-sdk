// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about a poll.

 SeeAlso Telegram Bot API Reference:
 [Poll](https://core.telegram.org/bots/api#poll)
 */

public enum TGPollType: String, Codable {
    case regular = "regular"
    case quiz = "quiz"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGPollType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}