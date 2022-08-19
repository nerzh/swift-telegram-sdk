// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to delete a message, including service messages, with the following limitations:
/// - A message can only be deleted if it was sent less than 48 hours ago.
/// - A dice message in a private chat can only be deleted if it was sent more than 24 hours ago.
/// - Bots can delete outgoing messages in private chats, groups, and supergroups.
/// - Bots can delete incoming messages in private chats.
/// - Bots granted can_post_messages permissions can delete outgoing messages in channels.
/// - If the bot is an administrator of a group, it can delete any message there.
/// - If the bot has can_delete_messages permission in a supergroup or a channel, it can delete any message there.
/// Returns True on success.


/// Parameters container struct for `deleteMessage` method
public struct TGDeleteMessageParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Identifier of the message to delete
    public var messageId: Int

    /// Custom keys for coding/decoding `DeleteMessageParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
    }

    public init(chatId: TGChatId, messageId: Int) {
            self.chatId = chatId
            self.messageId = messageId
    }
}


public extension TGBot {

/**
 Use this method to delete a message, including service messages, with the following limitations:
 - A message can only be deleted if it was sent less than 48 hours ago.
 - A dice message in a private chat can only be deleted if it was sent more than 24 hours ago.
 - Bots can delete outgoing messages in private chats, groups, and supergroups.
 - Bots can delete incoming messages in private chats.
 - Bots granted can_post_messages permissions can delete outgoing messages in channels.
 - If the bot is an administrator of a group, it can delete any message there.
 - If the bot has can_delete_messages permission in a supergroup or a channel, it can delete any message there.
 Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteMessageParams](https://core.telegram.org/bots/api#deletemessage)
 
 - Parameters:
     - params: Parameters container, see `DeleteMessageParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func deleteMessage(params: TGDeleteMessageParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("deleteMessage"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
