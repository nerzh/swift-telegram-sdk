// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The background is a gradient fill.

 SeeAlso Telegram Bot API Reference:
 [BackgroundFillGradient](https://core.telegram.org/bots/api#backgroundfillgradient)
 **/
public final class TGBackgroundFillGradient: Codable {

    /// Custom keys for coding/decoding `BackgroundFillGradient` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case topColor = "top_color"
        case bottomColor = "bottom_color"
        case rotationAngle = "rotation_angle"
    }

    /// Type of the background fill, always “gradient”
    public var type: TGBackgroundFillGradientType

    /// Top color of the gradient in the RGB24 format
    public var topColor: Int

    /// Bottom color of the gradient in the RGB24 format
    public var bottomColor: Int

    /// Clockwise rotation angle of the background fill in degrees; 0-359
    public var rotationAngle: Int

    public init (type: TGBackgroundFillGradientType, topColor: Int, bottomColor: Int, rotationAngle: Int) {
        self.type = type
        self.topColor = topColor
        self.bottomColor = bottomColor
        self.rotationAngle = rotationAngle
    }
}
