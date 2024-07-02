// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The background is filled using the selected color.

 SeeAlso Telegram Bot API Reference:
 [BackgroundFillSolid](https://core.telegram.org/bots/api#backgroundfillsolid)
 */

public enum TGBackgroundFillSolidType: String, Codable {
    case solid = "solid"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBackgroundFillSolidType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}