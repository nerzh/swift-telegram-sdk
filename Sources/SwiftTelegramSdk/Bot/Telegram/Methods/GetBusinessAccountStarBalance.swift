// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Returns the amount of Telegram Stars owned by a managed business account. Requires the can_view_gifts_and_stars business bot right. Returns StarAmount on success.


/// Parameters container struct for `getBusinessAccountStarBalance` method
public struct TGGetBusinessAccountStarBalanceParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// Custom keys for coding/decoding `GetBusinessAccountStarBalanceParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
    }

    public init(businessConnectionId: String) {
            self.businessConnectionId = businessConnectionId
    }
}


public extension TGBot {

/**
 Returns the amount of Telegram Stars owned by a managed business account. Requires the can_view_gifts_and_stars business bot right. Returns StarAmount on success.

 SeeAlso Telegram Bot API Reference:
 [GetBusinessAccountStarBalanceParams](https://core.telegram.org/bots/api#getbusinessaccountstarbalance)
 
 - Parameters:
     - params: Parameters container, see `GetBusinessAccountStarBalanceParams` struct
 - Throws: Throws on errors
 - Returns: `TGStarAmount`
 */

    @discardableResult
    func getBusinessAccountStarBalance(params: TGGetBusinessAccountStarBalanceParams) async throws -> TGStarAmount {
        guard let methodURL: URL = .init(string: getMethodURL("getBusinessAccountStarBalance")) else {
            throw BotError("Bad URL: \(getMethodURL("getBusinessAccountStarBalance"))")
        }
        let result: TGStarAmount = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
