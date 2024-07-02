// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The withdrawal failed and the transaction was refunded.

 SeeAlso Telegram Bot API Reference:
 [RevenueWithdrawalStateFailed](https://core.telegram.org/bots/api#revenuewithdrawalstatefailed)
 */

public enum TGRevenueWithdrawalStateFailedType: String, Codable {
    case failed = "failed"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRevenueWithdrawalStateFailedType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}