// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The withdrawal succeeded.

 SeeAlso Telegram Bot API Reference:
 [RevenueWithdrawalStateSucceeded](https://core.telegram.org/bots/api#revenuewithdrawalstatesucceeded)
 */

public enum TGRevenueWithdrawalStateSucceededType: String, Codable {
    case succeeded = "succeeded"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRevenueWithdrawalStateSucceededType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}