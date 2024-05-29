// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The message was originally sent on behalf of a chat to a group chat.

 SeeAlso Telegram Bot API Reference:
 [MessageOriginChat](https://core.telegram.org/bots/api#messageoriginchat)
 */

public enum TGMessageOriginChatType: String, Codable {
    case chat = "chat"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGMessageOriginChatType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}