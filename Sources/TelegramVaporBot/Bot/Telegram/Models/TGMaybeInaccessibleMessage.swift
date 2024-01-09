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


public extension TGMaybeInaccessibleMessage {
    var chat: TGChat {
        switch self {
        case .inaccessibleMessage(let msg):
            return msg.chat
        case .message(let msg):
            return msg.chat
        }
    }
    
    var messageId: Int {
        switch self {
        case .inaccessibleMessage(let msg):
            return msg.messageId
        case .message(let msg):
            return msg.messageId
        }
    }
    
    var date: Int {
        switch self {
        case .inaccessibleMessage(let msg):
            return msg.date
        case .message(let msg):
            return msg.date
        }
    }
}
