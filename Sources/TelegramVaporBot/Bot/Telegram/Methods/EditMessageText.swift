// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to edit text and game messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.


/// Parameters container struct for `editMessageText` method
public struct TGEditMessageTextParams: Encodable {

    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId?

    /// Required if inline_message_id is not specified. Identifier of the message to edit
    public var messageId: Int?

    /// Required if chat_id and message_id are not specified. Identifier of the inline message
    public var inlineMessageId: String?

    /// New text of the message, 1-4096 characters after entities parsing
    public var text: String

    /// Mode for parsing entities in the message text. See formatting options for more details.
    public var parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
    public var entities: [TGMessageEntity]?

    /// Disables link previews for links in this message
    public var disableWebPagePreview: Bool?

    /// A JSON-serialized object for an inline keyboard.
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditMessageTextParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case inlineMessageId = "inline_message_id"
            case text = "text"
            case parseMode = "parse_mode"
            case entities = "entities"
            case disableWebPagePreview = "disable_web_page_preview"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId? = nil, messageId: Int? = nil, inlineMessageId: String? = nil, text: String, parseMode: TGParseMode? = nil, entities: [TGMessageEntity]? = nil, disableWebPagePreview: Bool? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.inlineMessageId = inlineMessageId
            self.text = text
            self.parseMode = parseMode
            self.entities = entities
            self.disableWebPagePreview = disableWebPagePreview
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to edit text and game messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.

 SeeAlso Telegram Bot API Reference:
 [EditMessageTextParams](https://core.telegram.org/bots/api#editmessagetext)
 
 - Parameters:
     - params: Parameters container, see `EditMessageTextParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessageOrBool`
 */

    @discardableResult
    func editMessageText(params: TGEditMessageTextParams) async throws -> TGMessageOrBool {
        let methodURL: URI = .init(string: getMethodURL("editMessageText"))
        let result: TGMessageOrBool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
