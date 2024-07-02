// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue with the reverse side of a document. The error is considered resolved when the file with reverse side of the document changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorReverseSide](https://core.telegram.org/bots/api#passportelementerrorreverseside)
 */

public enum TGPassportElementErrorReverseSideType: String, Codable {
    case driverLicense = "driver_license"
    case identityCard = "identity_card"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGPassportElementErrorReverseSideType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}