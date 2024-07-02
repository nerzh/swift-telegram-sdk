// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue in one of the data fields that was provided by the user. The error is considered resolved when the field's value changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorDataField](https://core.telegram.org/bots/api#passportelementerrordatafield)
 **/
public final class TGPassportElementErrorDataField: Codable {

    /// Custom keys for coding/decoding `PassportElementErrorDataField` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case type = "type"
        case fieldName = "field_name"
        case dataHash = "data_hash"
        case message = "message"
    }

    /// Error source, must be data
    public var source: String

    /// The section of the user's Telegram Passport which has the error, one of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”
    public var type: TGPassportElementErrorDataFieldType

    /// Name of the data field which has the error
    public var fieldName: String

    /// Base64-encoded data hash
    public var dataHash: String

    /// Error message
    public var message: String

    public init (source: String, type: TGPassportElementErrorDataFieldType, fieldName: String, dataHash: String, message: String) {
        self.source = source
        self.type = type
        self.fieldName = fieldName
        self.dataHash = dataHash
        self.message = message
    }
}
