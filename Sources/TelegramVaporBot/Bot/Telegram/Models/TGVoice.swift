// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a voice note.

 SeeAlso Telegram Bot API Reference:
 [Voice](https://core.telegram.org/bots/api#voice)
 **/
public final class TGVoice: Codable {

    /// Custom keys for coding/decoding `Voice` struct
    public enum CodingKeys: String, CodingKey {
        case fileId = "file_id"
        case fileUniqueId = "file_unique_id"
        case duration = "duration"
        case mimeType = "mime_type"
        case fileSize = "file_size"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public var fileId: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var fileUniqueId: String

    /// Duration of the audio in seconds as defined by sender
    public var duration: Int

    /// Optional. MIME type of the file as defined by sender
    public var mimeType: String?

    /// Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    public var fileSize: Int?

    public init (fileId: String, fileUniqueId: String, duration: Int, mimeType: String? = nil, fileSize: Int? = nil) {
        self.fileId = fileId
        self.fileUniqueId = fileUniqueId
        self.duration = duration
        self.mimeType = mimeType
        self.fileSize = fileSize
    }
}
