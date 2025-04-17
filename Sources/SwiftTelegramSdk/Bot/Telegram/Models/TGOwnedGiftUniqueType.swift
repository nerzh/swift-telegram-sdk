// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a unique gift received and owned by a user or a chat.

 SeeAlso Telegram Bot API Reference:
 [OwnedGiftUnique](https://core.telegram.org/bots/api#ownedgiftunique)
 */

public enum TGOwnedGiftUniqueType: String, Codable {
    case unique = "unique"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGOwnedGiftUniqueType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}