// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering all private chats.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeAllPrivateChats](https://core.telegram.org/bots/api#botcommandscopeallprivatechats)
 **/
public final class TGBotCommandScopeAllPrivateChats: Codable {

    /// Custom keys for coding/decoding `BotCommandScopeAllPrivateChats` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Scope type, must be all_private_chats
    public var type: TGBotCommandScopeAllPrivateChatsType

    public init (type: TGBotCommandScopeAllPrivateChatsType) {
        self.type = type
    }
}
