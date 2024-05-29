// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents an issue with one of the files that constitute the translation of a document. The error is considered resolved when the file changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorTranslationFile](https://core.telegram.org/bots/api#passportelementerrortranslationfile)
 */

public enum TGPassportElementErrorTranslationFileType: String, Codable {
    case passport = "passport"
    case driverLicense = "driver_license"
    case identityCard = "identity_card"
    case internalPassport = "internal_passport"
    case utilityBill = "utility_bill"
    case bankStatement = "bank_statement"
    case rentalAgreement = "rental_agreement"
    case passportRegistration = "passport_registration"
    case temporaryRegistration = "temporary_registration"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGPassportElementErrorTranslationFileType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}