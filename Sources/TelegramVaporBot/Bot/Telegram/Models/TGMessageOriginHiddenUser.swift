// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The message was originally sent by an unknown user.

 SeeAlso Telegram Bot API Reference:
 [MessageOriginHiddenUser](https://core.telegram.org/bots/api#messageoriginhiddenuser)
 **/
public final class TGMessageOriginHiddenUser: Codable {

    /// Custom keys for coding/decoding `MessageOriginHiddenUser` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case date = "date"
        case senderUserName = "sender_user_name"
    }

    /// Type of the message origin, always “hidden_user”
    public var type: String

    /// Date the message was sent originally in Unix time
    public var date: Int

    /// Name of the user that sent the message originally
    public var senderUserName: String

    public init (type: String, date: Int, senderUserName: String) {
        self.type = type
        self.date = date
        self.senderUserName = senderUserName
    }
}
