// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about one member of a chat. Currently, the following 6 types of chat members are supported:
 ChatMemberOwner
 ChatMemberAdministrator
 ChatMemberMember
 ChatMemberRestricted
 ChatMemberLeft
 ChatMemberBanned

 SeeAlso Telegram Bot API Reference:
 [ChatMember](https://core.telegram.org/bots/api#chatmember)
 **/
public enum TGChatMember: Codable {
    case chatMemberOwner(TGChatMemberOwner)
    case chatMemberAdministrator(TGChatMemberAdministrator)
    case chatMemberMember(TGChatMemberMember)
    case chatMemberRestricted(TGChatMemberRestricted)
    case chatMemberLeft(TGChatMemberLeft)
    case chatMemberBanned(TGChatMemberBanned)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGChatMemberOwner.self) {
            self = .chatMemberOwner(value)
        } else if let value = try? container.decode(TGChatMemberAdministrator.self) {
            self = .chatMemberAdministrator(value)
        } else if let value = try? container.decode(TGChatMemberMember.self) {
            self = .chatMemberMember(value)
        } else if let value = try? container.decode(TGChatMemberRestricted.self) {
            self = .chatMemberRestricted(value)
        } else if let value = try? container.decode(TGChatMemberLeft.self) {
            self = .chatMemberLeft(value)
        } else if let value = try? container.decode(TGChatMemberBanned.self) {
            self = .chatMemberBanned(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE ChatMember.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .chatMemberOwner(value):
            try container.encode(value)
        case let .chatMemberAdministrator(value):
            try container.encode(value)
        case let .chatMemberMember(value):
            try container.encode(value)
        case let .chatMemberRestricted(value):
            try container.encode(value)
        case let .chatMemberLeft(value):
            try container.encode(value)
        case let .chatMemberBanned(value):
            try container.encode(value)
        }
    }
}
