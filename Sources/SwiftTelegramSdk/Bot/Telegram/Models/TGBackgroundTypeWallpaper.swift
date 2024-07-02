// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The background is a wallpaper in the JPEG format.

 SeeAlso Telegram Bot API Reference:
 [BackgroundTypeWallpaper](https://core.telegram.org/bots/api#backgroundtypewallpaper)
 **/
public final class TGBackgroundTypeWallpaper: Codable {

    /// Custom keys for coding/decoding `BackgroundTypeWallpaper` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case document = "document"
        case darkThemeDimming = "dark_theme_dimming"
        case isBlurred = "is_blurred"
        case isMoving = "is_moving"
    }

    /// Type of the background, always “wallpaper”
    public var type: TGBackgroundTypeWallpaperType

    /// Document with the wallpaper
    public var document: TGDocument

    /// Dimming of the background in dark themes, as a percentage; 0-100
    public var darkThemeDimming: Int

    /// Optional. True, if the wallpaper is downscaled to fit in a 450x450 square and then box-blurred with radius 12
    public var isBlurred: Bool?

    /// Optional. True, if the background moves slightly when the device is tilted
    public var isMoving: Bool?

    public init (type: TGBackgroundTypeWallpaperType, document: TGDocument, darkThemeDimming: Int, isBlurred: Bool? = nil, isMoving: Bool? = nil) {
        self.type = type
        self.document = document
        self.darkThemeDimming = darkThemeDimming
        self.isBlurred = isBlurred
        self.isMoving = isMoving
    }
}
