// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes a message that can be inaccessible to the bot. It can be one of
 Message
 InaccessibleMessage

 SeeAlso Telegram Bot API Reference:
 [MaybeInaccessibleMessage](https://core.telegram.org/bots/api#maybeinaccessiblemessage)
 **/
public enum TGMaybeInaccessibleMessage: Codable {
    case message(TGMessage)
    case inaccessibleMessage(TGInaccessibleMessage)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGMessage.self) {
            self = .message(value)
        } else if let value = try? container.decode(TGInaccessibleMessage.self) {
            self = .inaccessibleMessage(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE MaybeInaccessibleMessage.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .message(value):
            try container.encode(value)
        case let .inaccessibleMessage(value):
            try container.encode(value)
        }
    }
}
