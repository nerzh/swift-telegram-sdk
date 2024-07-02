// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a withdrawal transaction with Fragment.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerFragment](https://core.telegram.org/bots/api#transactionpartnerfragment)
 **/
public final class TGTransactionPartnerFragment: Codable {

    /// Custom keys for coding/decoding `TransactionPartnerFragment` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case withdrawalState = "withdrawal_state"
    }

    /// Type of the transaction partner, always “fragment”
    public var type: TGTransactionPartnerFragmentType

    /// Optional. State of the transaction if the transaction is outgoing
    public var withdrawalState: TGRevenueWithdrawalState?

    public init (type: TGTransactionPartnerFragmentType, withdrawalState: TGRevenueWithdrawalState? = nil) {
        self.type = type
        self.withdrawalState = withdrawalState
    }
}
