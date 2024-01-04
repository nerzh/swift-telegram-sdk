// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to send static .WEBP, animated .TGS, or video .WEBM stickers. On success, the sent Message is returned.


/// Parameters container struct for `sendSticker` method
public struct TGSendStickerParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public var messageThreadId: Int?

    /// Sticker to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a .WEBP sticker from the Internet, or upload a new .WEBP or .TGS sticker using multipart/form-data. More information on Sending Files ». Video stickers can only be sent by a file_id. Animated stickers can't be sent via an HTTP URL.
    public var sticker: TGFileInfo

    /// Emoji associated with the sticker; only for just uploaded stickers
    public var emoji: String?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// Description of the message to reply to
    public var replyParameters: TGReplyParameters?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    public var replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `SendStickerParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case sticker = "sticker"
            case emoji = "emoji"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, sticker: TGFileInfo, emoji: String? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.sticker = sticker
            self.emoji = emoji
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.replyParameters = replyParameters
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to send static .WEBP, animated .TGS, or video .WEBM stickers. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendStickerParams](https://core.telegram.org/bots/api#sendsticker)
 
 - Parameters:
     - params: Parameters container, see `SendStickerParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendSticker(params: TGSendStickerParams) async throws -> TGMessage {
        let methodURL: URI = .init(string: getMethodURL("sendSticker"))
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
