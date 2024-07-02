// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The background is filled using the selected color.

 SeeAlso Telegram Bot API Reference:
 [BackgroundFillSolid](https://core.telegram.org/bots/api#backgroundfillsolid)
 **/
public final class TGBackgroundFillSolid: Codable {

    /// Custom keys for coding/decoding `BackgroundFillSolid` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case color = "color"
    }

    /// Type of the background fill, always “solid”
    public var type: TGBackgroundFillSolidType

    /// The color of the background fill in the RGB24 format
    public var color: Int

    public init (type: TGBackgroundFillSolidType, color: Int) {
        self.type = type
        self.color = color
    }
}
