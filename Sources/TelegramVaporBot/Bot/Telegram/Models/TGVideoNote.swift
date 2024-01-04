// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a video message (available in Telegram apps as of v.4.0).

 SeeAlso Telegram Bot API Reference:
 [VideoNote](https://core.telegram.org/bots/api#videonote)
 **/
public final class TGVideoNote: Codable {

    /// Custom keys for coding/decoding `VideoNote` struct
    public enum CodingKeys: String, CodingKey {
        case fileId = "file_id"
        case fileUniqueId = "file_unique_id"
        case length = "length"
        case duration = "duration"
        case thumbnail = "thumbnail"
        case fileSize = "file_size"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public var fileId: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var fileUniqueId: String

    /// Video width and height (diameter of the video message) as defined by sender
    public var length: Int

    /// Duration of the video in seconds as defined by sender
    public var duration: Int

    /// Optional. Video thumbnail
    public var thumbnail: TGPhotoSize?

    /// Optional. File size in bytes
    public var fileSize: Int?

    public init (fileId: String, fileUniqueId: String, length: Int, duration: Int, thumbnail: TGPhotoSize? = nil, fileSize: Int? = nil) {
        self.fileId = fileId
        self.fileUniqueId = fileUniqueId
        self.length = length
        self.duration = duration
        self.thumbnail = thumbnail
        self.fileSize = fileSize
    }
}
