// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to send text messages. On success, the sent Message is returned.


/// Parameters container struct for `sendMessage` method
public struct TGSendMessageParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Text of the message to be sent, 1-4096 characters after entities parsing
    public var text: String

    /// Mode for parsing entities in the message text. See formatting options for more details.
    public var parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
    public var entities: [TGMessageEntity]?

    /// Disables link previews for links in this message
    public var disableWebPagePreview: Bool?

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

    /// Custom keys for coding/decoding `SendMessageParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case text = "text"
            case parseMode = "parse_mode"
            case entities = "entities"
            case disableWebPagePreview = "disable_web_page_preview"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case replyToMessageId = "reply_to_message_id"
            case allowSendingWithoutReply = "allow_sending_without_reply"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, text: String, parseMode: TGParseMode? = nil, entities: [TGMessageEntity]? = nil, disableWebPagePreview: Bool? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyToMessageId: Int? = nil, allowSendingWithoutReply: Bool? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.chatId = chatId
            self.text = text
            self.parseMode = parseMode
            self.entities = entities
            self.disableWebPagePreview = disableWebPagePreview
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.replyToMessageId = replyToMessageId
            self.allowSendingWithoutReply = allowSendingWithoutReply
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to send text messages. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendMessageParams](https://core.telegram.org/bots/api#sendmessage)
 
 - Parameters:
     - params: Parameters container, see `SendMessageParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `TGMessage` type
 */
    @discardableResult
    func sendMessage(params: TGSendMessageParams) throws -> EventLoopFuture<TGMessage> {
        let methodURL: URI = .init(string: getMethodURL("sendMessage"))
        let future: EventLoopFuture<TGMessage> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
