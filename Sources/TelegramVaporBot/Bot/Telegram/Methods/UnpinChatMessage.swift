// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to remove a message from the list of pinned messages in a chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'can_pin_messages' administrator right in a supergroup or 'can_edit_messages' administrator right in a channel. Returns True on success.


/// Parameters container struct for `unpinChatMessage` method
public struct TGUnpinChatMessageParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Identifier of a message to unpin. If not specified, the most recent pinned message (by sending date) will be unpinned.
    public var messageId: Int?

    /// Custom keys for coding/decoding `UnpinChatMessageParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
    }

    public init(chatId: TGChatId, messageId: Int? = nil) {
            self.chatId = chatId
            self.messageId = messageId
    }
}


public extension TGBot {

/**
 Use this method to remove a message from the list of pinned messages in a chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'can_pin_messages' administrator right in a supergroup or 'can_edit_messages' administrator right in a channel. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [UnpinChatMessageParams](https://core.telegram.org/bots/api#unpinchatmessage)
 
 - Parameters:
     - params: Parameters container, see `UnpinChatMessageParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func unpinChatMessage(params: TGUnpinChatMessageParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("unpinChatMessage"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }

    @discardableResult
    func unpinChatMessage(params: TGUnpinChatMessageParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("unpinChatMessage"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
