// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to send a group of photos, videos, documents or audios as an album. Documents and audio files can be only grouped in an album with messages of the same type. On success, an array of Messages that were sent is returned.


/// Parameters container struct for `sendMediaGroup` method
public struct TGSendMediaGroupParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public var messageThreadId: Int?

    /// A JSON-serialized array describing messages to be sent, must include 2-10 items
    public var media: [TGInputMedia]

    /// Sends messages silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent messages from forwarding and saving
    public var protectContent: Bool?

    /// If the messages are a reply, ID of the original message
    public var replyToMessageId: Int?

    /// Pass True if the message should be sent even if the specified replied-to message is not found
    public var allowSendingWithoutReply: Bool?

    /// Custom keys for coding/decoding `SendMediaGroupParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case media = "media"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case replyToMessageId = "reply_to_message_id"
            case allowSendingWithoutReply = "allow_sending_without_reply"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, media: [TGInputMedia], disableNotification: Bool? = nil, protectContent: Bool? = nil, replyToMessageId: Int? = nil, allowSendingWithoutReply: Bool? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.media = media
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.replyToMessageId = replyToMessageId
            self.allowSendingWithoutReply = allowSendingWithoutReply
    }
}


public extension TGBot {

/**
 Use this method to send a group of photos, videos, documents or audios as an album. Documents and audio files can be only grouped in an album with messages of the same type. On success, an array of Messages that were sent is returned.

 SeeAlso Telegram Bot API Reference:
 [SendMediaGroupParams](https://core.telegram.org/bots/api#sendmediagroup)
 
 - Parameters:
     - params: Parameters container, see `SendMediaGroupParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `[TGMessage]` type
 */
    @discardableResult
    func sendMediaGroup(params: TGSendMediaGroupParams) throws -> EventLoopFuture<[TGMessage]> {
        let methodURL: URI = .init(string: getMethodURL("sendMediaGroup"))
        let future: EventLoopFuture<[TGMessage]> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }

    @discardableResult
    func sendMediaGroup(params: TGSendMediaGroupParams) async throws -> [TGMessage] {
        let methodURL: URI = .init(string: getMethodURL("sendMediaGroup"))
        let result: [TGMessage] = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
