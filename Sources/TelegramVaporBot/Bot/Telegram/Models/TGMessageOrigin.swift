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
}
