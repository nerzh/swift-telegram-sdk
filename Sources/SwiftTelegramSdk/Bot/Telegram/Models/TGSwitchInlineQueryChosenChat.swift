// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents an inline button that switches the current user to inline mode in a chosen chat, with an optional default inline query.

 SeeAlso Telegram Bot API Reference:
 [SwitchInlineQueryChosenChat](https://core.telegram.org/bots/api#switchinlinequerychosenchat)
 **/
public final class TGSwitchInlineQueryChosenChat: Codable {

    /// Custom keys for coding/decoding `SwitchInlineQueryChosenChat` struct
    public enum CodingKeys: String, CodingKey {
        case query = "query"
        case allowUserChats = "allow_user_chats"
        case allowBotChats = "allow_bot_chats"
        case allowGroupChats = "allow_group_chats"
        case allowChannelChats = "allow_channel_chats"
    }

    /// Optional. The default inline query to be inserted in the input field. If left empty, only the bot's username will be inserted
    public var query: String?

    /// Optional. True, if private chats with users can be chosen
    public var allowUserChats: Bool?

    /// Optional. True, if private chats with bots can be chosen
    public var allowBotChats: Bool?

    /// Optional. True, if group and supergroup chats can be chosen
    public var allowGroupChats: Bool?

    /// Optional. True, if channel chats can be chosen
    public var allowChannelChats: Bool?

    public init (query: String? = nil, allowUserChats: Bool? = nil, allowBotChats: Bool? = nil, allowGroupChats: Bool? = nil, allowChannelChats: Bool? = nil) {
        self.query = query
        self.allowUserChats = allowUserChats
        self.allowBotChats = allowBotChats
        self.allowGroupChats = allowGroupChats
        self.allowChannelChats = allowChannelChats
    }
}
