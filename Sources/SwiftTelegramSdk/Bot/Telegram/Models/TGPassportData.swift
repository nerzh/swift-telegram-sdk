// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Describes Telegram Passport data shared with the bot by the user.

 SeeAlso Telegram Bot API Reference:
 [PassportData](https://core.telegram.org/bots/api#passportdata)
 **/
public final class TGPassportData: Codable {

    /// Custom keys for coding/decoding `PassportData` struct
    public enum CodingKeys: String, CodingKey {
        case data = "data"
        case credentials = "credentials"
    }

    /// Array with information about documents and other Telegram Passport elements that was shared with the bot
    public var data: [TGEncryptedPassportElement]

    /// Encrypted credentials required to decrypt the data
    public var credentials: TGEncryptedCredentials

    public init (data: [TGEncryptedPassportElement], credentials: TGEncryptedCredentials) {
        self.data = data
        self.credentials = credentials
    }
}
