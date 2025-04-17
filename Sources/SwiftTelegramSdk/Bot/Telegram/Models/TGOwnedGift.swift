// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes a gift received and owned by a user or a chat. Currently, it can be one of
 OwnedGiftRegular
 OwnedGiftUnique

 SeeAlso Telegram Bot API Reference:
 [OwnedGift](https://core.telegram.org/bots/api#ownedgift)
 **/
public enum TGOwnedGift: Codable {
    case ownedGiftRegular(TGOwnedGiftRegular)
    case ownedGiftUnique(TGOwnedGiftUnique)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGOwnedGiftRegular.self) {
            self = .ownedGiftRegular(value)
        } else if let value = try? container.decode(TGOwnedGiftUnique.self) {
            self = .ownedGiftUnique(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE OwnedGift.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .ownedGiftRegular(value):
            try container.encode(value)
        case let .ownedGiftUnique(value):
            try container.encode(value)
        }
    }
}
