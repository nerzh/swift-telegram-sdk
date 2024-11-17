// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a transaction with payment for paid broadcasting.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerTelegramApi](https://core.telegram.org/bots/api#transactionpartnertelegramapi)
 **/
public final class TGTransactionPartnerTelegramApi: Codable {

    /// Custom keys for coding/decoding `TransactionPartnerTelegramApi` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case requestCount = "request_count"
    }

    /// Type of the transaction partner, always “telegram_api”
    public var type: TGTransactionPartnerTelegramApiType

    /// The number of successful requests that exceeded regular limits and were therefore billed
    public var requestCount: Int

    public init (type: TGTransactionPartnerTelegramApiType, requestCount: Int) {
        self.type = type
        self.requestCount = requestCount
    }
}
