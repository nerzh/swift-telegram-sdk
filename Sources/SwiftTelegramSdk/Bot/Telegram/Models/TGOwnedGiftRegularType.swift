// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a regular gift owned by a user or a chat.

 SeeAlso Telegram Bot API Reference:
 [OwnedGiftRegular](https://core.telegram.org/bots/api#ownedgiftregular)
 */

public enum TGOwnedGiftRegularType: String, Codable {
    case regular = "regular"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGOwnedGiftRegularType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}