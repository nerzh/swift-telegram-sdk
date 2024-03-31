// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Describes documents or other Telegram Passport elements shared with the bot by the user.

 SeeAlso Telegram Bot API Reference:
 [EncryptedPassportElement](https://core.telegram.org/bots/api#encryptedpassportelement)
 **/
public final class TGEncryptedPassportElement: Codable {

    /// Custom keys for coding/decoding `EncryptedPassportElement` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case data = "data"
        case phoneNumber = "phone_number"
        case email = "email"
        case files = "files"
        case frontSide = "front_side"
        case reverseSide = "reverse_side"
        case selfie = "selfie"
        case translation = "translation"
        case hash = "hash"
    }

    /// Element type. One of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”, “phone_number”, “email”.
    public var type: String

    /// Optional. Base64-encoded encrypted Telegram Passport element data provided by the user; available only for “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport” and “address” types. Can be decrypted and verified using the accompanying EncryptedCredentials.
    public var data: String?

    /// Optional. User's verified phone number; available only for “phone_number” type
    public var phoneNumber: String?

    /// Optional. User's verified email address; available only for “email” type
    public var email: String?

    /// Optional. Array of encrypted files with documents provided by the user; available only for “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
    public var files: [TGPassportFile]?

    /// Optional. Encrypted file with the front side of the document, provided by the user; available only for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
    public var frontSide: TGPassportFile?

    /// Optional. Encrypted file with the reverse side of the document, provided by the user; available only for “driver_license” and “identity_card”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
    public var reverseSide: TGPassportFile?

    /// Optional. Encrypted file with the selfie of the user holding a document, provided by the user; available if requested for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
    public var selfie: TGPassportFile?

    /// Optional. Array of encrypted files with translated versions of documents provided by the user; available if requested for “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
    public var translation: [TGPassportFile]?

    /// Base64-encoded element hash for using in PassportElementErrorUnspecified
    public var hash: String

    public init (type: String, data: String? = nil, phoneNumber: String? = nil, email: String? = nil, files: [TGPassportFile]? = nil, frontSide: TGPassportFile? = nil, reverseSide: TGPassportFile? = nil, selfie: TGPassportFile? = nil, translation: [TGPassportFile]? = nil, hash: String) {
        self.type = type
        self.data = data
        self.phoneNumber = phoneNumber
        self.email = email
        self.files = files
        self.frontSide = frontSide
        self.reverseSide = reverseSide
        self.selfie = selfie
        self.translation = translation
        self.hash = hash
    }
}
