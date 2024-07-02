// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The withdrawal is in progress.

 SeeAlso Telegram Bot API Reference:
 [RevenueWithdrawalStatePending](https://core.telegram.org/bots/api#revenuewithdrawalstatepending)
 **/
public final class TGRevenueWithdrawalStatePending: Codable {

    /// Custom keys for coding/decoding `RevenueWithdrawalStatePending` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Type of the state, always “pending”
    public var type: TGRevenueWithdrawalStatePendingType

    public init (type: TGRevenueWithdrawalStatePendingType) {
        self.type = type
    }
}
