// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a sticker.

 SeeAlso Telegram Bot API Reference:
 [Sticker](https://core.telegram.org/bots/api#sticker)
 **/
public final class TGSticker: Codable {

    /// Custom keys for coding/decoding `Sticker` struct
    public enum CodingKeys: String, CodingKey {
        case fileId = "file_id"
        case fileUniqueId = "file_unique_id"
        case type = "type"
        case width = "width"
        case height = "height"
        case isAnimated = "is_animated"
        case isVideo = "is_video"
        case thumbnail = "thumbnail"
        case emoji = "emoji"
        case setName = "set_name"
        case premiumAnimation = "premium_animation"
        case maskPosition = "mask_position"
        case customEmojiId = "custom_emoji_id"
        case needsRepainting = "needs_repainting"
        case fileSize = "file_size"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public var fileId: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var fileUniqueId: String

    /// Type of the sticker, currently one of “regular”, “mask”, “custom_emoji”. The type of the sticker is independent from its format, which is determined by the fields is_animated and is_video.
    public var type: TGStickerType

    /// Sticker width
    public var width: Int

    /// Sticker height
    public var height: Int

    /// True, if the sticker is animated
    public var isAnimated: Bool

    /// True, if the sticker is a video sticker
    public var isVideo: Bool

    /// Optional. Sticker thumbnail in the .WEBP or .JPG format
    public var thumbnail: TGPhotoSize?

    /// Optional. Emoji associated with the sticker
    public var emoji: String?

    /// Optional. Name of the sticker set to which the sticker belongs
    public var setName: String?

    /// Optional. For premium regular stickers, premium animation for the sticker
    public var premiumAnimation: TGFile?

    /// Optional. For mask stickers, the position where the mask should be placed
    public var maskPosition: TGMaskPosition?

    /// Optional. For custom emoji stickers, unique identifier of the custom emoji
    public var customEmojiId: String?

    /// Optional. True, if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places
    public var needsRepainting: Bool?

    /// Optional. File size in bytes
    public var fileSize: Int?

    public init (fileId: String, fileUniqueId: String, type: TGStickerType, width: Int, height: Int, isAnimated: Bool, isVideo: Bool, thumbnail: TGPhotoSize? = nil, emoji: String? = nil, setName: String? = nil, premiumAnimation: TGFile? = nil, maskPosition: TGMaskPosition? = nil, customEmojiId: String? = nil, needsRepainting: Bool? = nil, fileSize: Int? = nil) {
        self.fileId = fileId
        self.fileUniqueId = fileUniqueId
        self.type = type
        self.width = width
        self.height = height
        self.isAnimated = isAnimated
        self.isVideo = isVideo
        self.thumbnail = thumbnail
        self.emoji = emoji
        self.setName = setName
        self.premiumAnimation = premiumAnimation
        self.maskPosition = maskPosition
        self.customEmojiId = customEmojiId
        self.needsRepainting = needsRepainting
        self.fileSize = fileSize
    }
}
