// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The background is a wallpaper in the JPEG format.

 SeeAlso Telegram Bot API Reference:
 [BackgroundTypeWallpaper](https://core.telegram.org/bots/api#backgroundtypewallpaper)
 */

public enum TGBackgroundTypeWallpaperType: String, Codable {
    case wallpaper = "wallpaper"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBackgroundTypeWallpaperType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}