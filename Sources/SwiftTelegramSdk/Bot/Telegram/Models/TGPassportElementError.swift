// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents an error in the Telegram Passport element which was submitted that should be resolved by the user. It should be one of:
 PassportElementErrorDataField
 PassportElementErrorFrontSide
 PassportElementErrorReverseSide
 PassportElementErrorSelfie
 PassportElementErrorFile
 PassportElementErrorFiles
 PassportElementErrorTranslationFile
 PassportElementErrorTranslationFiles
 PassportElementErrorUnspecified

 SeeAlso Telegram Bot API Reference:
 [PassportElementError](https://core.telegram.org/bots/api#passportelementerror)
 **/
public enum TGPassportElementError: Codable {
    case passportElementErrorDataField(TGPassportElementErrorDataField)
    case passportElementErrorFrontSide(TGPassportElementErrorFrontSide)
    case passportElementErrorReverseSide(TGPassportElementErrorReverseSide)
    case passportElementErrorSelfie(TGPassportElementErrorSelfie)
    case passportElementErrorFile(TGPassportElementErrorFile)
    case passportElementErrorFiles(TGPassportElementErrorFiles)
    case passportElementErrorTranslationFile(TGPassportElementErrorTranslationFile)
    case passportElementErrorTranslationFiles(TGPassportElementErrorTranslationFiles)
    case passportElementErrorUnspecified(TGPassportElementErrorUnspecified)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGPassportElementErrorDataField.self) {
            self = .passportElementErrorDataField(value)
        } else if let value = try? container.decode(TGPassportElementErrorFrontSide.self) {
            self = .passportElementErrorFrontSide(value)
        } else if let value = try? container.decode(TGPassportElementErrorReverseSide.self) {
            self = .passportElementErrorReverseSide(value)
        } else if let value = try? container.decode(TGPassportElementErrorSelfie.self) {
            self = .passportElementErrorSelfie(value)
        } else if let value = try? container.decode(TGPassportElementErrorFile.self) {
            self = .passportElementErrorFile(value)
        } else if let value = try? container.decode(TGPassportElementErrorFiles.self) {
            self = .passportElementErrorFiles(value)
        } else if let value = try? container.decode(TGPassportElementErrorTranslationFile.self) {
            self = .passportElementErrorTranslationFile(value)
        } else if let value = try? container.decode(TGPassportElementErrorTranslationFiles.self) {
            self = .passportElementErrorTranslationFiles(value)
        } else if let value = try? container.decode(TGPassportElementErrorUnspecified.self) {
            self = .passportElementErrorUnspecified(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE PassportElementError.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .passportElementErrorDataField(value):
            try container.encode(value)
        case let .passportElementErrorFrontSide(value):
            try container.encode(value)
        case let .passportElementErrorReverseSide(value):
            try container.encode(value)
        case let .passportElementErrorSelfie(value):
            try container.encode(value)
        case let .passportElementErrorFile(value):
            try container.encode(value)
        case let .passportElementErrorFiles(value):
            try container.encode(value)
        case let .passportElementErrorTranslationFile(value):
            try container.encode(value)
        case let .passportElementErrorTranslationFiles(value):
            try container.encode(value)
        case let .passportElementErrorUnspecified(value):
            try container.encode(value)
        }
    }
}
