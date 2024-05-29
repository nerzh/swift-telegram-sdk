// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to send audio files, if you want Telegram clients to display them in the music player. Your audio must be in the .MP3 or .M4A format. On success, the sent Message is returned. Bots can currently send audio files of up to 50 MB in size, this limit may be changed in the future.
/// For sending voice messages, use the sendVoice method instead.


/// Parameters container struct for `sendAudio` method
public struct TGSendAudioParams: Encodable {

    /// Unique identifier of the business connection on behalf of which the message will be sent
    public var businessConnectionId: String?

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public var messageThreadId: Int?

    /// Audio file to send. Pass a file_id as String to send an audio file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get an audio file from the Internet, or upload a new one using multipart/form-data. More information on Sending Files »
    public var audio: TGFileInfo

    /// Audio caption, 0-1024 characters after entities parsing
    public var caption: String?

    /// Mode for parsing entities in the audio caption. See formatting options for more details.
    public var parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// Duration of the audio in seconds
    public var duration: Int?

    /// Performer
    public var performer: String?

    /// Track name
    public var title: String?

    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    public var thumbnail: TGFileInfo?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// Unique identifier of the message effect to be added to the message; for private chats only
    public var messageEffectId: String?

    /// Description of the message to reply to
    public var replyParameters: TGReplyParameters?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove a reply keyboard or to force a reply from the user
    public var replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `SendAudioParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case audio = "audio"
            case caption = "caption"
            case parseMode = "parse_mode"
            case captionEntities = "caption_entities"
            case duration = "duration"
            case performer = "performer"
            case title = "title"
            case thumbnail = "thumbnail"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case messageEffectId = "message_effect_id"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId, messageThreadId: Int? = nil, audio: TGFileInfo, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, duration: Int? = nil, performer: String? = nil, title: String? = nil, thumbnail: TGFileInfo? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, messageEffectId: String? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.audio = audio
            self.caption = caption
            self.parseMode = parseMode
            self.captionEntities = captionEntities
            self.duration = duration
            self.performer = performer
            self.title = title
            self.thumbnail = thumbnail
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.messageEffectId = messageEffectId
            self.replyParameters = replyParameters
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to send audio files, if you want Telegram clients to display them in the music player. Your audio must be in the .MP3 or .M4A format. On success, the sent Message is returned. Bots can currently send audio files of up to 50 MB in size, this limit may be changed in the future.
 For sending voice messages, use the sendVoice method instead.

 SeeAlso Telegram Bot API Reference:
 [SendAudioParams](https://core.telegram.org/bots/api#sendaudio)
 
 - Parameters:
     - params: Parameters container, see `SendAudioParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendAudio(params: TGSendAudioParams) async throws -> TGMessage {
        let methodURL: URI = .init(string: getMethodURL("sendAudio"))
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
