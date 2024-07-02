// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The message was originally sent by a known user.

 SeeAlso Telegram Bot API Reference:
 [MessageOriginUser](https://core.telegram.org/bots/api#messageoriginuser)
 **/
public final class TGMessageOriginUser: Codable {

    /// Custom keys for coding/decoding `MessageOriginUser` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case date = "date"
        case senderUser = "sender_user"
    }

    /// Type of the message origin, always “user”
    public var type: TGMessageOriginUserType

    /// Date the message was sent originally in Unix time
    public var date: Int

    /// User that sent the message originally
    public var senderUser: TGUser

    public init (type: TGMessageOriginUserType, date: Int, senderUser: TGUser) {
        self.type = type
        self.date = date
        self.senderUser = senderUser
    }
}
