// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents an issue with the front side of a document. The error is considered resolved when the file with the front side of the document changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorFrontSide](https://core.telegram.org/bots/api#passportelementerrorfrontside)
 */

public enum TGPassportElementErrorFrontSideType: String, Codable {
    case passport = "passport"
    case driverLicense = "driver_license"
    case identityCard = "identity_card"
    case internalPassport = "internal_passport"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGPassportElementErrorFrontSideType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}