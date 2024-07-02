// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a chat.

 SeeAlso Telegram Bot API Reference:
 [Chat](https://core.telegram.org/bots/api#chat)
 */

public enum TGChatType: String, Codable {
    case `private` = "private"
    case group = "group"
    case supergroup = "supergroup"
    case channel = "channel"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGChatType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}