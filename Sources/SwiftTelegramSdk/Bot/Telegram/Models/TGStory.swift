// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a story.

 SeeAlso Telegram Bot API Reference:
 [Story](https://core.telegram.org/bots/api#story)
 **/
public final class TGStory: Codable {

    /// Custom keys for coding/decoding `Story` struct
    public enum CodingKeys: String, CodingKey {
        case chat = "chat"
        case id = "id"
    }

    /// Chat that posted the story
    public var chat: TGChat

    /// Unique identifier for the story in the chat
    public var id: Int

    public init (chat: TGChat, id: Int) {
        self.chat = chat
        self.id = id
    }
}
