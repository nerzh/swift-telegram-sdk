// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains full information about a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatFullInfo](https://core.telegram.org/bots/api#chatfullinfo)
 */

public enum TGChatFullInfoType: String, Codable {
    case `private` = "private"
    case group = "group"
    case supergroup = "supergroup"
    case channel = "channel"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGChatFullInfoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}