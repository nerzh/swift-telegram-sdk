// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Describes documents or other Telegram Passport elements shared with the bot by the user.

 SeeAlso Telegram Bot API Reference:
 [EncryptedPassportElement](https://core.telegram.org/bots/api#encryptedpassportelement)
 */

public enum TGEncryptedPassportElementType: String, Codable {
    case personalDetails = "personal_details"
    case passport = "passport"
    case driverLicense = "driver_license"
    case identityCard = "identity_card"
    case internalPassport = "internal_passport"
    case address = "address"
    case utilityBill = "utility_bill"
    case bankStatement = "bank_statement"
    case rentalAgreement = "rental_agreement"
    case passportRegistration = "passport_registration"
    case temporaryRegistration = "temporary_registration"
    case phoneNumber = "phone_number"
    case email = "email"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGEncryptedPassportElementType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}