// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the state of a revenue withdrawal operation. Currently, it can be one of
 RevenueWithdrawalStatePending
 RevenueWithdrawalStateSucceeded
 RevenueWithdrawalStateFailed

 SeeAlso Telegram Bot API Reference:
 [RevenueWithdrawalState](https://core.telegram.org/bots/api#revenuewithdrawalstate)
 **/
public enum TGRevenueWithdrawalState: Codable {
    case revenueWithdrawalStatePending(TGRevenueWithdrawalStatePending)
    case revenueWithdrawalStateSucceeded(TGRevenueWithdrawalStateSucceeded)
    case revenueWithdrawalStateFailed(TGRevenueWithdrawalStateFailed)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGRevenueWithdrawalStatePending.self) {
            self = .revenueWithdrawalStatePending(value)
        } else if let value = try? container.decode(TGRevenueWithdrawalStateSucceeded.self) {
            self = .revenueWithdrawalStateSucceeded(value)
        } else if let value = try? container.decode(TGRevenueWithdrawalStateFailed.self) {
            self = .revenueWithdrawalStateFailed(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE RevenueWithdrawalState.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .revenueWithdrawalStatePending(value):
            try container.encode(value)
        case let .revenueWithdrawalStateSucceeded(value):
            try container.encode(value)
        case let .revenueWithdrawalStateFailed(value):
            try container.encode(value)
        }
    }
}
