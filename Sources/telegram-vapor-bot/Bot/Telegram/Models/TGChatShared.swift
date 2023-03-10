// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object contains information about the chat whose identifier was shared with the bot using a KeyboardButtonRequestChat button.

 SeeAlso Telegram Bot API Reference:
 [ChatShared](https://core.telegram.org/bots/api#chatshared)
 */
public final class TGChatShared: Codable {

    /// Custom keys for coding/decoding `ChatShared` struct
    public enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case chatId = "chat_id"
    }

    /// Identifier of the request
    public var requestId: Int

    /// Identifier of the shared chat. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. The bot may not have access to the chat and could be unable to use this identifier, unless the chat is already known to the bot by some other means.
    public var chatId: Int64

    public init (requestId: Int, chatId: Int64) {
        self.requestId = requestId
        self.chatId = chatId
    }
}
