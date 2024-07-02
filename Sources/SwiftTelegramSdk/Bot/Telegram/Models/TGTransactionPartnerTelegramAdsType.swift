// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a withdrawal transaction to the Telegram Ads platform.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerTelegramAds](https://core.telegram.org/bots/api#transactionpartnertelegramads)
 */

public enum TGTransactionPartnerTelegramAdsType: String, Codable {
    case telegramAds = "telegram_ads"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGTransactionPartnerTelegramAdsType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}