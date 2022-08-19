// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents an audio file to be treated as music by the Telegram clients.

 SeeAlso Telegram Bot API Reference:
 [Audio](https://core.telegram.org/bots/api#audio)
 */
public final class TGAudio: Codable {

    /// Custom keys for coding/decoding `Audio` struct
    public enum CodingKeys: String, CodingKey {
        case fileId = "file_id"
        case fileUniqueId = "file_unique_id"
        case duration = "duration"
        case performer = "performer"
        case title = "title"
        case fileName = "file_name"
        case mimeType = "mime_type"
        case fileSize = "file_size"
        case thumb = "thumb"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public var fileId: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var fileUniqueId: String

    /// Duration of the audio in seconds as defined by sender
    public var duration: Int

    /// Optional. Performer of the audio as defined by sender or by audio tags
    public var performer: String?

    /// Optional. Title of the audio as defined by sender or by audio tags
    public var title: String?

    /// Optional. Original filename as defined by sender
    public var fileName: String?

    /// Optional. MIME type of the file as defined by sender
    public var mimeType: String?

    /// Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    public var fileSize: Int?

    /// Optional. Thumbnail of the album cover to which the music file belongs
    public var thumb: TGPhotoSize?

    public init (fileId: String, fileUniqueId: String, duration: Int, performer: String? = nil, title: String? = nil, fileName: String? = nil, mimeType: String? = nil, fileSize: Int? = nil, thumb: TGPhotoSize? = nil) {
        self.fileId = fileId
        self.fileUniqueId = fileUniqueId
        self.duration = duration
        self.performer = performer
        self.title = title
        self.fileName = fileName
        self.mimeType = mimeType
        self.fileSize = fileSize
        self.thumb = thumb
    }
}
