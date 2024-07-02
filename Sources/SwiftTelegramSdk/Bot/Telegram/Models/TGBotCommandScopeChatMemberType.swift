// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering a specific member of a group or supergroup chat.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeChatMember](https://core.telegram.org/bots/api#botcommandscopechatmember)
 */

public enum TGBotCommandScopeChatMemberType: String, Codable {
    case chatMember = "chat_member"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBotCommandScopeChatMemberType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}