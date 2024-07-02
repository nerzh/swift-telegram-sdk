// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object describes the origin of a message. It can be one of
 MessageOriginUser
 MessageOriginHiddenUser
 MessageOriginChat
 MessageOriginChannel

 SeeAlso Telegram Bot API Reference:
 [MessageOrigin](https://core.telegram.org/bots/api#messageorigin)
 **/
public enum TGMessageOrigin: Codable {
    case messageOriginUser(TGMessageOriginUser)
    case messageOriginHiddenUser(TGMessageOriginHiddenUser)
    case messageOriginChat(TGMessageOriginChat)
    case messageOriginChannel(TGMessageOriginChannel)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGMessageOriginUser.self) {
            self = .messageOriginUser(value)
        } else if let value = try? container.decode(TGMessageOriginHiddenUser.self) {
            self = .messageOriginHiddenUser(value)
        } else if let value = try? container.decode(TGMessageOriginChat.self) {
            self = .messageOriginChat(value)
        } else if let value = try? container.decode(TGMessageOriginChannel.self) {
            self = .messageOriginChannel(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE MessageOrigin.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .messageOriginUser(value):
            try container.encode(value)
        case let .messageOriginHiddenUser(value):
            try container.encode(value)
        case let .messageOriginChat(value):
            try container.encode(value)
        case let .messageOriginChannel(value):
            try container.encode(value)
        }
    }
}
