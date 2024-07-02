// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the source of a chat boost. It can be one of
 ChatBoostSourcePremium
 ChatBoostSourceGiftCode
 ChatBoostSourceGiveaway

 SeeAlso Telegram Bot API Reference:
 [ChatBoostSource](https://core.telegram.org/bots/api#chatboostsource)
 **/
public enum TGChatBoostSource: Codable {
    case chatBoostSourcePremium(TGChatBoostSourcePremium)
    case chatBoostSourceGiftCode(TGChatBoostSourceGiftCode)
    case chatBoostSourceGiveaway(TGChatBoostSourceGiveaway)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGChatBoostSourcePremium.self) {
            self = .chatBoostSourcePremium(value)
        } else if let value = try? container.decode(TGChatBoostSourceGiftCode.self) {
            self = .chatBoostSourceGiftCode(value)
        } else if let value = try? container.decode(TGChatBoostSourceGiveaway.self) {
            self = .chatBoostSourceGiveaway(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE ChatBoostSource.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .chatBoostSourcePremium(value):
            try container.encode(value)
        case let .chatBoostSourceGiftCode(value):
            try container.encode(value)
        case let .chatBoostSourceGiveaway(value):
            try container.encode(value)
        }
    }
}
