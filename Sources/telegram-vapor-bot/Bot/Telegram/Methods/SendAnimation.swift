// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to send animation files (GIF or H.264/MPEG-4 AVC video without sound). On success, the sent Message is returned. Bots can currently send animation files of up to 50 MB in size, this limit may be changed in the future.


/// Parameters container struct for `sendAnimation` method
public struct TGSendAnimationParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Animation to send. Pass a file_id as String to send an animation that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get an animation from the Internet, or upload a new animation using multipart/form-data. More information on Sending Files »
    public var animation: TGFileInfo

    /// Duration of sent animation in seconds
    public var duration: Int?

    /// Animation width
    public var width: Int?

    /// Animation height
    public var height: Int?

    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    public var thumb: TGFileInfo?

    /// Animation caption (may also be used when resending animation by file_id), 0-1024 characters after entities parsing
    public var caption: String?

    /// Mode for parsing entities in the animation caption. See formatting options for more details.
    public var parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
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

    /// Custom keys for coding/decoding `SendAnimationParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case animation = "animation"
            case duration = "duration"
            case width = "width"
            case height = "height"
            case thumb = "thumb"
            case caption = "caption"
            case parseMode = "parse_mode"
            case captionEntities = "caption_entities"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case replyToMessageId = "reply_to_message_id"
            case allowSendingWithoutReply = "allow_sending_without_reply"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, animation: TGFileInfo, duration: Int? = nil, width: Int? = nil, height: Int? = nil, thumb: TGFileInfo? = nil, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyToMessageId: Int? = nil, allowSendingWithoutReply: Bool? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.chatId = chatId
            self.animation = animation
            self.duration = duration
            self.width = width
            self.height = height
            self.thumb = thumb
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
 Use this method to send animation files (GIF or H.264/MPEG-4 AVC video without sound). On success, the sent Message is returned. Bots can currently send animation files of up to 50 MB in size, this limit may be changed in the future.

 SeeAlso Telegram Bot API Reference:
 [SendAnimationParams](https://core.telegram.org/bots/api#sendanimation)
 
 - Parameters:
     - params: Parameters container, see `SendAnimationParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `TGMessage` type
 */
    @discardableResult
    func sendAnimation(params: TGSendAnimationParams) throws -> EventLoopFuture<TGMessage> {
        let methodURL: URI = .init(string: getMethodURL("sendAnimation"))
        let future: EventLoopFuture<TGMessage> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
