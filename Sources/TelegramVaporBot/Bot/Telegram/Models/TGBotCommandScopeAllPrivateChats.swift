// Telegram-vapor-bot - Telegram Bot Swift SDK.

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
    public var type: String

    public init (type: String) {
        self.type = type
    }
}
