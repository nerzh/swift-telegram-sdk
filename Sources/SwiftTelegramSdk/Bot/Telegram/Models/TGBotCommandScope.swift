// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents the scope to which bot commands are applied. Currently, the following 7 scopes are supported:
 BotCommandScopeDefault
 BotCommandScopeAllPrivateChats
 BotCommandScopeAllGroupChats
 BotCommandScopeAllChatAdministrators
 BotCommandScopeChat
 BotCommandScopeChatAdministrators
 BotCommandScopeChatMember

 SeeAlso Telegram Bot API Reference:
 [BotCommandScope](https://core.telegram.org/bots/api#botcommandscope)
 **/
public enum TGBotCommandScope: Codable {
    case botCommandScopeDefault(TGBotCommandScopeDefault)
    case botCommandScopeAllPrivateChats(TGBotCommandScopeAllPrivateChats)
    case botCommandScopeAllGroupChats(TGBotCommandScopeAllGroupChats)
    case botCommandScopeAllChatAdministrators(TGBotCommandScopeAllChatAdministrators)
    case botCommandScopeChat(TGBotCommandScopeChat)
    case botCommandScopeChatAdministrators(TGBotCommandScopeChatAdministrators)
    case botCommandScopeChatMember(TGBotCommandScopeChatMember)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGBotCommandScopeDefault.self) {
            self = .botCommandScopeDefault(value)
        } else if let value = try? container.decode(TGBotCommandScopeAllPrivateChats.self) {
            self = .botCommandScopeAllPrivateChats(value)
        } else if let value = try? container.decode(TGBotCommandScopeAllGroupChats.self) {
            self = .botCommandScopeAllGroupChats(value)
        } else if let value = try? container.decode(TGBotCommandScopeAllChatAdministrators.self) {
            self = .botCommandScopeAllChatAdministrators(value)
        } else if let value = try? container.decode(TGBotCommandScopeChat.self) {
            self = .botCommandScopeChat(value)
        } else if let value = try? container.decode(TGBotCommandScopeChatAdministrators.self) {
            self = .botCommandScopeChatAdministrators(value)
        } else if let value = try? container.decode(TGBotCommandScopeChatMember.self) {
            self = .botCommandScopeChatMember(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE BotCommandScope.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .botCommandScopeDefault(value):
            try container.encode(value)
        case let .botCommandScopeAllPrivateChats(value):
            try container.encode(value)
        case let .botCommandScopeAllGroupChats(value):
            try container.encode(value)
        case let .botCommandScopeAllChatAdministrators(value):
            try container.encode(value)
        case let .botCommandScopeChat(value):
            try container.encode(value)
        case let .botCommandScopeChatAdministrators(value):
            try container.encode(value)
        case let .botCommandScopeChatMember(value):
            try container.encode(value)
        }
    }
}
