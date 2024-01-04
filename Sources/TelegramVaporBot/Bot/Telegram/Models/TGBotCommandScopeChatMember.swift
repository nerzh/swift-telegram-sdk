// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering a specific member of a group or supergroup chat.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeChatMember](https://core.telegram.org/bots/api#botcommandscopechatmember)
 **/
public final class TGBotCommandScopeChatMember: Codable {

    /// Custom keys for coding/decoding `BotCommandScopeChatMember` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case chatId = "chat_id"
        case userId = "user_id"
    }

    /// Scope type, must be chat_member
    public var type: String

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Unique identifier of the target user
    public var userId: Int64

    public init (type: String, chatId: TGChatId, userId: Int64) {
        self.type = type
        self.chatId = chatId
        self.userId = userId
    }
}
