// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering a specific chat.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeChat](https://core.telegram.org/bots/api#botcommandscopechat)
 **/
public final class TGBotCommandScopeChat: Codable {

    /// Custom keys for coding/decoding `BotCommandScopeChat` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case chatId = "chat_id"
    }

    /// Scope type, must be chat
    public var type: TGBotCommandScopeChatType

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    public init (type: TGBotCommandScopeChatType, chatId: TGChatId) {
        self.type = type
        self.chatId = chatId
    }
}
