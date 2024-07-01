// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to edit captions of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent.


/// Parameters container struct for `editMessageCaption` method
public struct TGEditMessageCaptionParams: Encodable {

    /// Unique identifier of the business connection on behalf of which the message to be edited was sent
    public var businessConnectionId: String?

    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId?

    /// Required if inline_message_id is not specified. Identifier of the message to edit
    public var messageId: Int?

    /// Required if chat_id and message_id are not specified. Identifier of the inline message
    public var inlineMessageId: String?

    /// New caption of the message, 0-1024 characters after entities parsing
    public var caption: String?

    /// Mode for parsing entities in the message caption. See formatting options for more details.
    public var parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// Pass True, if the caption must be shown above the message media. Supported only for animation, photo and video messages.
    public var showCaptionAboveMedia: Bool?

    /// A JSON-serialized object for an inline keyboard.
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditMessageCaptionParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageId = "message_id"
            case inlineMessageId = "inline_message_id"
            case caption = "caption"
            case parseMode = "parse_mode"
            case captionEntities = "caption_entities"
            case showCaptionAboveMedia = "show_caption_above_media"
            case replyMarkup = "reply_markup"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId? = nil, messageId: Int? = nil, inlineMessageId: String? = nil, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageId = messageId
            self.inlineMessageId = inlineMessageId
            self.caption = caption
            self.parseMode = parseMode
            self.captionEntities = captionEntities
            self.showCaptionAboveMedia = showCaptionAboveMedia
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to edit captions of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent.

 SeeAlso Telegram Bot API Reference:
 [EditMessageCaptionParams](https://core.telegram.org/bots/api#editmessagecaption)
 
 - Parameters:
     - params: Parameters container, see `EditMessageCaptionParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessageOrBool`
 */

    @discardableResult
    func editMessageCaption(params: TGEditMessageCaptionParams? = nil) async throws -> TGMessageOrBool {
        let methodURL: URI = .init(string: getMethodURL("editMessageCaption"))
        let result: TGMessageOrBool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
