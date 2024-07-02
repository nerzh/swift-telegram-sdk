// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about a chat that was shared with the bot using a KeyboardButtonRequestChat button.

 SeeAlso Telegram Bot API Reference:
 [ChatShared](https://core.telegram.org/bots/api#chatshared)
 **/
public final class TGChatShared: Codable {

    /// Custom keys for coding/decoding `ChatShared` struct
    public enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case chatId = "chat_id"
        case title = "title"
        case username = "username"
        case photo = "photo"
    }

    /// Identifier of the request
    public var requestId: Int

    /// Identifier of the shared chat. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. The bot may not have access to the chat and could be unable to use this identifier, unless the chat is already known to the bot by some other means.
    public var chatId: Int64

    /// Optional. Title of the chat, if the title was requested by the bot.
    public var title: String?

    /// Optional. Username of the chat, if the username was requested by the bot and available.
    public var username: String?

    /// Optional. Available sizes of the chat photo, if the photo was requested by the bot
    public var photo: [TGPhotoSize]?

    public init (requestId: Int, chatId: Int64, title: String? = nil, username: String? = nil, photo: [TGPhotoSize]? = nil) {
        self.requestId = requestId
        self.chatId = chatId
        self.title = title
        self.username = username
        self.photo = photo
    }
}
