// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The background is automatically filled based on the selected colors.

 SeeAlso Telegram Bot API Reference:
 [BackgroundTypeFill](https://core.telegram.org/bots/api#backgroundtypefill)
 **/
public final class TGBackgroundTypeFill: Codable {

    /// Custom keys for coding/decoding `BackgroundTypeFill` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case fill = "fill"
        case darkThemeDimming = "dark_theme_dimming"
    }

    /// Type of the background, always “fill”
    public var type: TGBackgroundTypeFillType

    /// The background fill
    public var fill: TGBackgroundFill

    /// Dimming of the background in dark themes, as a percentage; 0-100
    public var darkThemeDimming: Int

    public init (type: TGBackgroundTypeFillType, fill: TGBackgroundFill, darkThemeDimming: Int) {
        self.type = type
        self.fill = fill
        self.darkThemeDimming = darkThemeDimming
    }
}
