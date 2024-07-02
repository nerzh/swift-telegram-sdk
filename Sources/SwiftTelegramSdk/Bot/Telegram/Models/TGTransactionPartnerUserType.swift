// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Describes a transaction with a user.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerUser](https://core.telegram.org/bots/api#transactionpartneruser)
 */

public enum TGTransactionPartnerUserType: String, Codable {
    case user = "user"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGTransactionPartnerUserType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}