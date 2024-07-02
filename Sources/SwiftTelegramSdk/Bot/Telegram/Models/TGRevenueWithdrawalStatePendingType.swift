// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The withdrawal is in progress.

 SeeAlso Telegram Bot API Reference:
 [RevenueWithdrawalStatePending](https://core.telegram.org/bots/api#revenuewithdrawalstatepending)
 */

public enum TGRevenueWithdrawalStatePendingType: String, Codable {
    case pending = "pending"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRevenueWithdrawalStatePendingType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}