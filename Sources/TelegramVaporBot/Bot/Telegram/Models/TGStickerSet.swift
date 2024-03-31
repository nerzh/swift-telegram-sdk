// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a sticker set.

 SeeAlso Telegram Bot API Reference:
 [StickerSet](https://core.telegram.org/bots/api#stickerset)
 **/
public final class TGStickerSet: Codable {

    /// Custom keys for coding/decoding `StickerSet` struct
    public enum CodingKeys: String, CodingKey {
        case name = "name"
        case title = "title"
        case stickerType = "sticker_type"
        case stickers = "stickers"
        case thumbnail = "thumbnail"
    }

    /// Sticker set name
    public var name: String

    /// Sticker set title
    public var title: String

    /// Type of stickers in the set, currently one of “regular”, “mask”, “custom_emoji”
    public var stickerType: String

    /// List of all set stickers
    public var stickers: [TGSticker]

    /// Optional. Sticker set thumbnail in the .WEBP, .TGS, or .WEBM format
    public var thumbnail: TGPhotoSize?

    public init (name: String, title: String, stickerType: String, stickers: [TGSticker], thumbnail: TGPhotoSize? = nil) {
        self.name = name
        self.title = title
        self.stickerType = stickerType
        self.stickers = stickers
        self.thumbnail = thumbnail
    }
}
