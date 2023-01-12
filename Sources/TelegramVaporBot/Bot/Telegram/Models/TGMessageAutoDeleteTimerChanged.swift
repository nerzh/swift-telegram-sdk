// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a service message about a change in auto-delete timer settings.

 SeeAlso Telegram Bot API Reference:
 [MessageAutoDeleteTimerChanged](https://core.telegram.org/bots/api#messageautodeletetimerchanged)
 */
public final class TGMessageAutoDeleteTimerChanged: Codable {

    /// Custom keys for coding/decoding `MessageAutoDeleteTimerChanged` struct
    public enum CodingKeys: String, CodingKey {
        case messageAutoDeleteTime = "message_auto_delete_time"
    }

    /// New auto-delete time for messages in the chat; in seconds
    public var messageAutoDeleteTime: Int

    public init (messageAutoDeleteTime: Int) {
        self.messageAutoDeleteTime = messageAutoDeleteTime
    }
}
