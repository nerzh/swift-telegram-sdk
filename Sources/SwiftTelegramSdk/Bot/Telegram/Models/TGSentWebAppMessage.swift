// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes an inline message sent by a Web App on behalf of a user.

 SeeAlso Telegram Bot API Reference:
 [SentWebAppMessage](https://core.telegram.org/bots/api#sentwebappmessage)
 **/
public final class TGSentWebAppMessage: Codable {

    /// Custom keys for coding/decoding `SentWebAppMessage` struct
    public enum CodingKeys: String, CodingKey {
        case inlineMessageId = "inline_message_id"
    }

    /// Optional. Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message.
    public var inlineMessageId: String?

    public init (inlineMessageId: String? = nil) {
        self.inlineMessageId = inlineMessageId
    }
}
