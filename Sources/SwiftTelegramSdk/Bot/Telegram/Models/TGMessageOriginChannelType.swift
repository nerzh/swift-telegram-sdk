// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The message was originally sent to a channel chat.

 SeeAlso Telegram Bot API Reference:
 [MessageOriginChannel](https://core.telegram.org/bots/api#messageoriginchannel)
 */

public enum TGMessageOriginChannelType: String, Codable {
    case channel = "channel"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGMessageOriginChannelType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}