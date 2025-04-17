// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an animation file (GIF or H.264/MPEG-4 AVC video without sound) to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaAnimation](https://core.telegram.org/bots/api#inputmediaanimation)
 **/
public final class TGInputMediaAnimation: Codable {

    /// Custom keys for coding/decoding `InputMediaAnimation` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case media = "media"
        case thumbnail = "thumbnail"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
        case width = "width"
        case height = "height"
        case duration = "duration"
        case hasSpoiler = "has_spoiler"
    }

    /// Type of the result, must be animation
    public var type: TGInputMediaAnimationType

    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    public var media: TGFileInfo

    /// Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    public var thumbnail: TGFileInfo?

    /// Optional. Caption of the animation to be sent, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the animation caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// Optional. Pass True, if the caption must be shown above the message media
    public var showCaptionAboveMedia: Bool?

    /// Optional. Animation width
    public var width: Int?

    /// Optional. Animation height
    public var height: Int?

    /// Optional. Animation duration in seconds
    public var duration: Int?

    /// Optional. Pass True if the animation needs to be covered with a spoiler animation
    public var hasSpoiler: Bool?

    public init (type: TGInputMediaAnimationType, media: TGFileInfo, thumbnail: TGFileInfo? = nil, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, width: Int? = nil, height: Int? = nil, duration: Int? = nil, hasSpoiler: Bool? = nil) {
        self.type = type
        self.media = media
        self.thumbnail = thumbnail
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
        self.width = width
        self.height = height
        self.duration = duration
        self.hasSpoiler = hasSpoiler
    }
}
