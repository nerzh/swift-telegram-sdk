// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue with the selfie with a document. The error is considered resolved when the file with the selfie changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorSelfie](https://core.telegram.org/bots/api#passportelementerrorselfie)
 */

public enum TGPassportElementErrorSelfieType: String, Codable {
    case passport = "passport"
    case driverLicense = "driver_license"
    case identityCard = "identity_card"
    case internalPassport = "internal_passport"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGPassportElementErrorSelfieType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}