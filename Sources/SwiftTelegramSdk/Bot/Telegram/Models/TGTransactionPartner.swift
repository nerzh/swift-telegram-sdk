// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the source of a transaction, or its recipient for outgoing transactions. Currently, it can be one of
 TransactionPartnerUser
 TransactionPartnerChat
 TransactionPartnerAffiliateProgram
 TransactionPartnerFragment
 TransactionPartnerTelegramAds
 TransactionPartnerTelegramApi
 TransactionPartnerOther

 SeeAlso Telegram Bot API Reference:
 [TransactionPartner](https://core.telegram.org/bots/api#transactionpartner)
 **/
public enum TGTransactionPartner: Codable {
    case transactionPartnerUser(TGTransactionPartnerUser)
    case transactionPartnerChat(TGTransactionPartnerChat)
    case transactionPartnerAffiliateProgram(TGTransactionPartnerAffiliateProgram)
    case transactionPartnerFragment(TGTransactionPartnerFragment)
    case transactionPartnerTelegramAds(TGTransactionPartnerTelegramAds)
    case transactionPartnerTelegramApi(TGTransactionPartnerTelegramApi)
    case transactionPartnerOther(TGTransactionPartnerOther)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGTransactionPartnerUser.self) {
            self = .transactionPartnerUser(value)
        } else if let value = try? container.decode(TGTransactionPartnerChat.self) {
            self = .transactionPartnerChat(value)
        } else if let value = try? container.decode(TGTransactionPartnerAffiliateProgram.self) {
            self = .transactionPartnerAffiliateProgram(value)
        } else if let value = try? container.decode(TGTransactionPartnerFragment.self) {
            self = .transactionPartnerFragment(value)
        } else if let value = try? container.decode(TGTransactionPartnerTelegramAds.self) {
            self = .transactionPartnerTelegramAds(value)
        } else if let value = try? container.decode(TGTransactionPartnerTelegramApi.self) {
            self = .transactionPartnerTelegramApi(value)
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
        case let .transactionPartnerChat(value):
            try container.encode(value)
        case let .transactionPartnerAffiliateProgram(value):
            try container.encode(value)
        case let .transactionPartnerFragment(value):
            try container.encode(value)
        case let .transactionPartnerTelegramAds(value):
            try container.encode(value)
        case let .transactionPartnerTelegramApi(value):
            try container.encode(value)
        case let .transactionPartnerOther(value):
            try container.encode(value)
        }
    }
}
