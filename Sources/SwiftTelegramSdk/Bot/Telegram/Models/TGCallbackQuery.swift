// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents an incoming callback query from a callback button in an inline keyboard. If the button that originated the query was attached to a message sent by the bot, the field message will be present. If the button was attached to a message sent via the bot (in inline mode), the field inline_message_id will be present. Exactly one of the fields data or game_short_name will be present.

 SeeAlso Telegram Bot API Reference:
 [CallbackQuery](https://core.telegram.org/bots/api#callbackquery)
 **/
public final class TGCallbackQuery: Codable {

    /// Custom keys for coding/decoding `CallbackQuery` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case from = "from"
        case message = "message"
        case inlineMessageId = "inline_message_id"
        case chatInstance = "chat_instance"
        case data = "data"
        case gameShortName = "game_short_name"
    }

    /// Unique identifier for this query
    public var id: String

    /// Sender
    public var from: TGUser

    /// Optional. Message sent by the bot with the callback button that originated the query
    public var message: TGMaybeInaccessibleMessage?

    /// Optional. Identifier of the message sent via the bot in inline mode, that originated the query.
    public var inlineMessageId: String?

    /// Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent. Useful for high scores in games.
    public var chatInstance: String

    /// Optional. Data associated with the callback button. Be aware that the message originated the query can contain no callback buttons with this data.
    public var data: String?

    /// Optional. Short name of a Game to be returned, serves as the unique identifier for the game
    public var gameShortName: String?

    public init (id: String, from: TGUser, message: TGMaybeInaccessibleMessage? = nil, inlineMessageId: String? = nil, chatInstance: String, data: String? = nil, gameShortName: String? = nil) {
        self.id = id
        self.from = from
        self.message = message
        self.inlineMessageId = inlineMessageId
        self.chatInstance = chatInstance
        self.data = data
        self.gameShortName = gameShortName
    }
}
