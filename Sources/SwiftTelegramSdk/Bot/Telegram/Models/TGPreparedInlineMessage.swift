// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes an inline message to be sent by a user of a Mini App.

 SeeAlso Telegram Bot API Reference:
 [PreparedInlineMessage](https://core.telegram.org/bots/api#preparedinlinemessage)
 **/
public final class TGPreparedInlineMessage: Codable {

    /// Custom keys for coding/decoding `PreparedInlineMessage` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case expirationDate = "expiration_date"
    }

    /// Unique identifier of the prepared message
    public var id: String

    /// Expiration date of the prepared message, in Unix time. Expired prepared messages can no longer be used
    public var expirationDate: Int

    public init (id: String, expirationDate: Int) {
        self.id = id
        self.expirationDate = expirationDate
    }
}
