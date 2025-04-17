// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An animated profile photo in the MPEG4 format.

 SeeAlso Telegram Bot API Reference:
 [InputProfilePhotoAnimated](https://core.telegram.org/bots/api#inputprofilephotoanimated)
 **/
public final class TGInputProfilePhotoAnimated: Codable {

    /// Custom keys for coding/decoding `InputProfilePhotoAnimated` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case animation = "animation"
        case mainFrameTimestamp = "main_frame_timestamp"
    }

    /// Type of the profile photo, must be animated
    public var type: TGInputProfilePhotoAnimatedType

    /// The animated profile photo. Profile photos can't be reused and can only be uploaded as a new file, so you can pass “attach://<file_attach_name>” if the photo was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    public var animation: String

    /// Optional. Timestamp in seconds of the frame that will be used as the static profile photo. Defaults to 0.0.
    public var mainFrameTimestamp: Float?

    public init (type: TGInputProfilePhotoAnimatedType, animation: String, mainFrameTimestamp: Float? = nil) {
        self.type = type
        self.animation = animation
        self.mainFrameTimestamp = mainFrameTimestamp
    }
}
