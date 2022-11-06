// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to copy messages of any kind. Service messages and invoice messages can't be copied. A quiz poll can be copied only if the value of the field correct_option_id is known to the bot. The method is analogous to the method forwardMessage, but the copied message doesn't have a link to the original message. Returns the MessageId of the sent message on success.


/// Parameters container struct for `copyMessage` method
public struct TGCopyMessageParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public var messageThreadId: Int?

    /// Unique identifier for the chat where the original message was sent (or channel username in the format @channelusername)
    public var fromChatId: TGChatId

    /// Message identifier in the chat specified in from_chat_id
    public var messageId: Int

    /// New caption for media, 0-1024 characters after entities parsing. If not specified, the original caption is kept
    public var caption: String?

    /// Mode for parsing entities in the new caption. See formatting options for more details.
    public var parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the new caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// If the message is a reply, ID of the original message
    public var replyToMessageId: Int?

    /// Pass True if the message should be sent even if the specified replied-to message is not found
    public var allowSendingWithoutReply: Bool?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    public var replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `CopyMessageParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case fromChatId = "from_chat_id"
            case messageId = "message_id"
            case caption = "caption"
            case parseMode = "parse_mode"
            case captionEntities = "caption_entities"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case replyToMessageId = "reply_to_message_id"
            case allowSendingWithoutReply = "allow_sending_without_reply"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, fromChatId: TGChatId, messageId: Int, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyToMessageId: Int? = nil, allowSendingWithoutReply: Bool? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.fromChatId = fromChatId
            self.messageId = messageId
            self.caption = caption
            self.parseMode = parseMode
            self.captionEntities = captionEntities
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.replyToMessageId = replyToMessageId
            self.allowSendingWithoutReply = allowSendingWithoutReply
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to copy messages of any kind. Service messages and invoice messages can't be copied. A quiz poll can be copied only if the value of the field correct_option_id is known to the bot. The method is analogous to the method forwardMessage, but the copied message doesn't have a link to the original message. Returns the MessageId of the sent message on success.

 SeeAlso Telegram Bot API Reference:
 [CopyMessageParams](https://core.telegram.org/bots/api#copymessage)
 
 - Parameters:
     - params: Parameters container, see `CopyMessageParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `TGMessageId` type
 */
    @discardableResult
    func copyMessage(params: TGCopyMessageParams) throws -> EventLoopFuture<TGMessageId> {
        let methodURL: URI = .init(string: getMethodURL("copyMessage"))
        let future: EventLoopFuture<TGMessageId> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
