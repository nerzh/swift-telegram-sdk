// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The withdrawal succeeded.

 SeeAlso Telegram Bot API Reference:
 [RevenueWithdrawalStateSucceeded](https://core.telegram.org/bots/api#revenuewithdrawalstatesucceeded)
 **/
public final class TGRevenueWithdrawalStateSucceeded: Codable {

    /// Custom keys for coding/decoding `RevenueWithdrawalStateSucceeded` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case date = "date"
        case url = "url"
    }

    /// Type of the state, always “succeeded”
    public var type: TGRevenueWithdrawalStateSucceededType

    /// Date the withdrawal was completed in Unix time
    public var date: Int

    /// An HTTPS URL that can be used to see transaction details
    public var url: String

    public init (type: TGRevenueWithdrawalStateSucceededType, date: Int, url: String) {
        self.type = type
        self.date = date
        self.url = url
    }
}
