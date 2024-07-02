// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object describes the source of a transaction, or its recipient for outgoing transactions. Currently, it can be one of
 TransactionPartnerUser
 TransactionPartnerFragment
 TransactionPartnerTelegramAds
 TransactionPartnerOther

 SeeAlso Telegram Bot API Reference:
 [TransactionPartner](https://core.telegram.org/bots/api#transactionpartner)
 **/
public enum TGTransactionPartner: Codable {
    case transactionPartnerUser(TGTransactionPartnerUser)
    case transactionPartnerFragment(TGTransactionPartnerFragment)
    case transactionPartnerTelegramAds(TGTransactionPartnerTelegramAds)
    case transactionPartnerOther(TGTransactionPartnerOther)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGTransactionPartnerUser.self) {
            self = .transactionPartnerUser(value)
        } else if let value = try? container.decode(TGTransactionPartnerFragment.self) {
            self = .transactionPartnerFragment(value)
        } else if let value = try? container.decode(TGTransactionPartnerTelegramAds.self) {
            self = .transactionPartnerTelegramAds(value)
        } else if let value = try? container.decode(TGTransactionPartnerOther.self) {
            self = .transactionPartnerOther(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE TransactionPartner.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .transactionPartnerUser(value):
            try container.encode(value)
        case let .transactionPartnerFragment(value):
            try container.encode(value)
        case let .transactionPartnerTelegramAds(value):
            try container.encode(value)
        case let .transactionPartnerOther(value):
            try container.encode(value)
        }
    }
}
