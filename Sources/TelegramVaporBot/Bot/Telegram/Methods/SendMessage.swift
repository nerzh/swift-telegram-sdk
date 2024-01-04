// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to send text messages. On success, the sent Message is returned.


/// Parameters container struct for `sendMessage` method
public struct TGSendMessageParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public var messageThreadId: Int?

    /// Text of the message to be sent, 1-4096 characters after entities parsing
    public var text: String

    /// Mode for parsing entities in the message text. See formatting options for more details.
    public var parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
    public var entities: [TGMessageEntity]?

    /// Link preview generation options for the message
    public var linkPreviewOptions: TGLinkPreviewOptions?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// Description of the message to reply to
    public var replyParameters: TGReplyParameters?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    public var replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `SendMessageParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case text = "text"
            case parseMode = "parse_mode"
            case entities = "entities"
            case linkPreviewOptions = "link_preview_options"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, text: String, parseMode: TGParseMode? = nil, entities: [TGMessageEntity]? = nil, linkPreviewOptions: TGLinkPreviewOptions? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.text = text
            self.parseMode = parseMode
            self.entities = entities
            self.linkPreviewOptions = linkPreviewOptions
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.replyParameters = replyParameters
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
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendMessage(params: TGSendMessageParams) async throws -> TGMessage {
        let methodURL: URI = .init(string: getMethodURL("sendMessage"))
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
