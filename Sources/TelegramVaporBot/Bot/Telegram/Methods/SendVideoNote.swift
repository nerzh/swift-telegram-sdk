// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// As of v.4.0, Telegram clients support rounded square MPEG4 videos of up to 1 minute long. Use this method to send video messages. On success, the sent Message is returned.


/// Parameters container struct for `sendVideoNote` method
public struct TGSendVideoNoteParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public var messageThreadId: Int?

    /// Video note to send. Pass a file_id as String to send a video note that exists on the Telegram servers (recommended) or upload a new video using multipart/form-data. More information on Sending Files ». Sending video notes by a URL is currently unsupported
    public var videoNote: TGFileInfo

    /// Duration of sent video in seconds
    public var duration: Int?

    /// Video width and height, i.e. diameter of the video message
    public var length: Int?

    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    public var thumbnail: TGFileInfo?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// Description of the message to reply to
    public var replyParameters: TGReplyParameters?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    public var replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `SendVideoNoteParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case videoNote = "video_note"
            case duration = "duration"
            case length = "length"
            case thumbnail = "thumbnail"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, videoNote: TGFileInfo, duration: Int? = nil, length: Int? = nil, thumbnail: TGFileInfo? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.videoNote = videoNote
            self.duration = duration
            self.length = length
            self.thumbnail = thumbnail
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.replyParameters = replyParameters
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 As of v.4.0, Telegram clients support rounded square MPEG4 videos of up to 1 minute long. Use this method to send video messages. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendVideoNoteParams](https://core.telegram.org/bots/api#sendvideonote)
 
 - Parameters:
     - params: Parameters container, see `SendVideoNoteParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendVideoNote(params: TGSendVideoNoteParams) async throws -> TGMessage {
        let methodURL: URI = .init(string: getMethodURL("sendVideoNote"))
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
