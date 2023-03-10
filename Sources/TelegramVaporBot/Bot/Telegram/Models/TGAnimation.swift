// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents an animation file (GIF or H.264/MPEG-4 AVC video without sound).

 SeeAlso Telegram Bot API Reference:
 [Animation](https://core.telegram.org/bots/api#animation)
 */
public final class TGAnimation: Codable {

    /// Custom keys for coding/decoding `Animation` struct
    public enum CodingKeys: String, CodingKey {
        case fileId = "file_id"
        case fileUniqueId = "file_unique_id"
        case width = "width"
        case height = "height"
        case duration = "duration"
        case thumbnail = "thumbnail"
        case fileName = "file_name"
        case mimeType = "mime_type"
        case fileSize = "file_size"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public var fileId: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var fileUniqueId: String

    /// Video width as defined by sender
    public var width: Int

    /// Video height as defined by sender
    public var height: Int

    /// Duration of the video in seconds as defined by sender
    public var duration: Int

    /// Optional. Animation thumbnail as defined by sender
    public var thumbnail: TGPhotoSize?

    /// Optional. Original animation filename as defined by sender
    public var fileName: String?

    /// Optional. MIME type of the file as defined by sender
    public var mimeType: String?

    /// Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    public var fileSize: Int?

    public init (fileId: String, fileUniqueId: String, width: Int, height: Int, duration: Int, thumbnail: TGPhotoSize? = nil, fileName: String? = nil, mimeType: String? = nil, fileSize: Int? = nil) {
        self.fileId = fileId
        self.fileUniqueId = fileUniqueId
        self.width = width
        self.height = height
        self.duration = duration
        self.thumbnail = thumbnail
        self.fileName = fileName
        self.mimeType = mimeType
        self.fileSize = fileSize
    }
}
