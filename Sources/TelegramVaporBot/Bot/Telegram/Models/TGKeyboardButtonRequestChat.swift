// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object defines the criteria used to request a suitable chat. The identifier of the selected chat will be shared with the bot when the corresponding button is pressed. More about requesting chats »

 SeeAlso Telegram Bot API Reference:
 [KeyboardButtonRequestChat](https://core.telegram.org/bots/api#keyboardbuttonrequestchat)
 */
public final class TGKeyboardButtonRequestChat: Codable {

    /// Custom keys for coding/decoding `KeyboardButtonRequestChat` struct
    public enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case chatIsChannel = "chat_is_channel"
        case chatIsForum = "chat_is_forum"
        case chatHasUsername = "chat_has_username"
        case chatIsCreated = "chat_is_created"
        case userAdministratorRights = "user_administrator_rights"
        case botAdministratorRights = "bot_administrator_rights"
        case botIsMember = "bot_is_member"
    }

    /// Signed 32-bit identifier of the request, which will be received back in the ChatShared object. Must be unique within the message
    public var requestId: Int

    /// Pass True to request a channel chat, pass False to request a group or a supergroup chat.
    public var chatIsChannel: Bool

    /// Optional. Pass True to request a forum supergroup, pass False to request a non-forum chat. If not specified, no additional restrictions are applied.
    public var chatIsForum: Bool?

    /// Optional. Pass True to request a supergroup or a channel with a username, pass False to request a chat without a username. If not specified, no additional restrictions are applied.
    public var chatHasUsername: Bool?

    /// Optional. Pass True to request a chat owned by the user. Otherwise, no additional restrictions are applied.
    public var chatIsCreated: Bool?

    /// Optional. A JSON-serialized object listing the required administrator rights of the user in the chat. The rights must be a superset of bot_administrator_rights. If not specified, no additional restrictions are applied.
    public var userAdministratorRights: TGChatAdministratorRights?

    /// Optional. A JSON-serialized object listing the required administrator rights of the bot in the chat. The rights must be a subset of user_administrator_rights. If not specified, no additional restrictions are applied.
    public var botAdministratorRights: TGChatAdministratorRights?

    /// Optional. Pass True to request a chat with the bot as a member. Otherwise, no additional restrictions are applied.
    public var botIsMember: Bool?

    public init (requestId: Int, chatIsChannel: Bool, chatIsForum: Bool? = nil, chatHasUsername: Bool? = nil, chatIsCreated: Bool? = nil, userAdministratorRights: TGChatAdministratorRights? = nil, botAdministratorRights: TGChatAdministratorRights? = nil, botIsMember: Bool? = nil) {
        self.requestId = requestId
        self.chatIsChannel = chatIsChannel
        self.chatIsForum = chatIsForum
        self.chatHasUsername = chatHasUsername
        self.chatIsCreated = chatIsCreated
        self.userAdministratorRights = userAdministratorRights
        self.botAdministratorRights = botAdministratorRights
        self.botIsMember = botIsMember
    }
}
