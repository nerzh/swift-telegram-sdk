// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The withdrawal failed and the transaction was refunded.

 SeeAlso Telegram Bot API Reference:
 [RevenueWithdrawalStateFailed](https://core.telegram.org/bots/api#revenuewithdrawalstatefailed)
 **/
public final class TGRevenueWithdrawalStateFailed: Codable {

    /// Custom keys for coding/decoding `RevenueWithdrawalStateFailed` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Type of the state, always “failed”
    public var type: TGRevenueWithdrawalStateFailedType

    public init (type: TGRevenueWithdrawalStateFailedType) {
        self.type = type
    }
}
