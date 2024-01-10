// Telegram-vapor-bot - Telegram Bot Swift SDK.

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
}

