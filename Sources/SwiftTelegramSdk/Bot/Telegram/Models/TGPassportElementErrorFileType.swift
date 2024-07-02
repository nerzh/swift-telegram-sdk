// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue with a document scan. The error is considered resolved when the file with the document scan changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorFile](https://core.telegram.org/bots/api#passportelementerrorfile)
 */

public enum TGPassportElementErrorFileType: String, Codable {
    case utilityBill = "utility_bill"
    case bankStatement = "bank_statement"
    case rentalAgreement = "rental_agreement"
    case passportRegistration = "passport_registration"
    case temporaryRegistration = "temporary_registration"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGPassportElementErrorFileType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}