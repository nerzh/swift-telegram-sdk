// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a transaction with payment for paid broadcasting.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerTelegramApi](https://core.telegram.org/bots/api#transactionpartnertelegramapi)
 */

public enum TGTransactionPartnerTelegramApiType: String, Codable {
    case telegramApi = "telegram_api"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGTransactionPartnerTelegramApiType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}