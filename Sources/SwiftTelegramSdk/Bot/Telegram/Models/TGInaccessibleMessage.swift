// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object describes a message that was deleted or is otherwise inaccessible to the bot.

 SeeAlso Telegram Bot API Reference:
 [InaccessibleMessage](https://core.telegram.org/bots/api#inaccessiblemessage)
 **/
public final class TGInaccessibleMessage: Codable {

    /// Custom keys for coding/decoding `InaccessibleMessage` struct
    public enum CodingKeys: String, CodingKey {
        case chat = "chat"
        case messageId = "message_id"
        case date = "date"
    }

    /// Chat the message belonged to
    public var chat: TGChat

    /// Unique message identifier inside the chat
    public var messageId: Int

    /// Always 0. The field can be used to differentiate regular and inaccessible messages.
    public var date: Int

    public init (chat: TGChat, messageId: Int, date: Int) {
        self.chat = chat
        self.messageId = messageId
        self.date = date
    }
}
