// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to a video animation (H.264/MPEG-4 AVC video without sound). By default, this animated MPEG-4 file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultMpeg4Gif](https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif)
 **/
public final class TGInlineQueryResultMpeg4Gif: Codable {

    /// Custom keys for coding/decoding `InlineQueryResultMpeg4Gif` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case mpeg4Url = "mpeg4_url"
        case mpeg4Width = "mpeg4_width"
        case mpeg4Height = "mpeg4_height"
        case mpeg4Duration = "mpeg4_duration"
        case thumbnailUrl = "thumbnail_url"
        case thumbnailMimeType = "thumbnail_mime_type"
        case title = "title"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be mpeg4_gif
    public var type: TGInlineQueryResultMpeg4GifType

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// A valid URL for the MPEG4 file. File size must not exceed 1MB
    public var mpeg4Url: String

    /// Optional. Video width
    public var mpeg4Width: Int?

    /// Optional. Video height
    public var mpeg4Height: Int?

    /// Optional. Video duration in seconds
    public var mpeg4Duration: Int?

    /// URL of the static (JPEG or GIF) or animated (MPEG4) thumbnail for the result
    public var thumbnailUrl: String

    /// Optional. MIME type of the thumbnail, must be one of “image/jpeg”, “image/gif”, or “video/mp4”. Defaults to “image/jpeg”
    public var thumbnailMimeType: String?

    /// Optional. Title for the result
    public var title: String?

    /// Optional. Caption of the MPEG-4 file to be sent, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// Optional. Pass True, if the caption must be shown above the message media
    public var showCaptionAboveMedia: Bool?

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the video animation
    public var inputMessageContent: TGInputMessageContent?

    public init (type: TGInlineQueryResultMpeg4GifType, id: String, mpeg4Url: String, mpeg4Width: Int? = nil, mpeg4Height: Int? = nil, mpeg4Duration: Int? = nil, thumbnailUrl: String, thumbnailMimeType: String? = nil, title: String? = nil, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.mpeg4Url = mpeg4Url
        self.mpeg4Width = mpeg4Width
        self.mpeg4Height = mpeg4Height
        self.mpeg4Duration = mpeg4Duration
        self.thumbnailUrl = thumbnailUrl
        self.thumbnailMimeType = thumbnailMimeType
        self.title = title
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
