// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue in one of the data fields that was provided by the user. The error is considered resolved when the field's value changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorDataField](https://core.telegram.org/bots/api#passportelementerrordatafield)
 */

public enum TGPassportElementErrorDataFieldType: String, Codable {
    case personalDetails = "personal_details"
    case passport = "passport"
    case driverLicense = "driver_license"
    case identityCard = "identity_card"
    case internalPassport = "internal_passport"
    case address = "address"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGPassportElementErrorDataFieldType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}