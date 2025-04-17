// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a video to post as a story.

 SeeAlso Telegram Bot API Reference:
 [InputStoryContentVideo](https://core.telegram.org/bots/api#inputstorycontentvideo)
 **/
public final class TGInputStoryContentVideo: Codable {

    /// Custom keys for coding/decoding `InputStoryContentVideo` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case video = "video"
        case duration = "duration"
        case coverFrameTimestamp = "cover_frame_timestamp"
        case isAnimation = "is_animation"
    }

    /// Type of the content, must be video
    public var type: TGInputStoryContentVideoType

    /// The video to post as a story. The video must be of the size 720x1280, streamable, encoded with H.265 codec, with key frames added each second in the MPEG4 format, and must not exceed 30 MB. The video can't be reused and can only be uploaded as a new file, so you can pass “attach://<file_attach_name>” if the video was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    public var video: String

    /// Optional. Precise duration of the video in seconds; 0-60
    public var duration: Float?

    /// Optional. Timestamp in seconds of the frame that will be used as the static cover for the story. Defaults to 0.0.
    public var coverFrameTimestamp: Float?

    /// Optional. Pass True if the video has no sound
    public var isAnimation: Bool?

    public init (type: TGInputStoryContentVideoType, video: String, duration: Float? = nil, coverFrameTimestamp: Float? = nil, isAnimation: Bool? = nil) {
        self.type = type
        self.video = video
        self.duration = duration
        self.coverFrameTimestamp = coverFrameTimestamp
        self.isAnimation = isAnimation
    }
}
