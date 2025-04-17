// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a photo to post as a story.

 SeeAlso Telegram Bot API Reference:
 [InputStoryContentPhoto](https://core.telegram.org/bots/api#inputstorycontentphoto)
 **/
public final class TGInputStoryContentPhoto: Codable {

    /// Custom keys for coding/decoding `InputStoryContentPhoto` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case photo = "photo"
    }

    /// Type of the content, must be photo
    public var type: TGInputStoryContentPhotoType

    /// The photo to post as a story. The photo must be of the size 1080x1920 and must not exceed 10 MB. The photo can't be reused and can only be uploaded as a new file, so you can pass “attach://<file_attach_name>” if the photo was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    public var photo: TGFileInfo

    public init (type: TGInputStoryContentPhotoType, photo: TGFileInfo) {
        self.type = type
        self.photo = photo
    }
}
