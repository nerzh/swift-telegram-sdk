// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to a video file stored on the Telegram servers. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedVideo](https://core.telegram.org/bots/api#inlinequeryresultcachedvideo)
 **/
public final class TGInlineQueryResultCachedVideo: Codable {

    /// Custom keys for coding/decoding `InlineQueryResultCachedVideo` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case videoFileId = "video_file_id"
        case title = "title"
        case description = "description"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be video
    public var type: TGInlineQueryResultCachedVideoType

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// A valid file identifier for the video file
    public var videoFileId: String

    /// Title for the result
    public var title: String

    /// Optional. Short description of the result
    public var description: String?

    /// Optional. Caption of the video to be sent, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the video caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// Optional. Pass True, if the caption must be shown above the message media
    public var showCaptionAboveMedia: Bool?

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the video
    public var inputMessageContent: TGInputMessageContent?

    public init (type: TGInlineQueryResultCachedVideoType, id: String, videoFileId: String, title: String, description: String? = nil, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.videoFileId = videoFileId
        self.title = title
        self.description = description
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
