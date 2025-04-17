// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The paid media to send is a photo.

 SeeAlso Telegram Bot API Reference:
 [InputPaidMediaPhoto](https://core.telegram.org/bots/api#inputpaidmediaphoto)
 **/
public final class TGInputPaidMediaPhoto: Codable {

    /// Custom keys for coding/decoding `InputPaidMediaPhoto` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case media = "media"
    }

    /// Type of the media, must be photo
    public var type: TGInputPaidMediaPhotoType

    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    public var media: TGFileInfo

    public init (type: TGInputPaidMediaPhotoType, media: TGFileInfo) {
        self.type = type
        self.media = media
    }
}
