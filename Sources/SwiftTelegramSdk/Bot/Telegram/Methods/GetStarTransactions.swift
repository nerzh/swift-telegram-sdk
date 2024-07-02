// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Returns the bot's Telegram Star transactions in chronological order. On success, returns a StarTransactions object.


/// Parameters container struct for `getStarTransactions` method
public struct TGGetStarTransactionsParams: Encodable {

    /// Number of transactions to skip in the response
    public var offset: Int?

    /// The maximum number of transactions to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    public var limit: Int?

    /// Custom keys for coding/decoding `GetStarTransactionsParams` struct
    public enum CodingKeys: String, CodingKey {
            case offset = "offset"
            case limit = "limit"
    }

    public init(offset: Int? = nil, limit: Int? = nil) {
            self.offset = offset
            self.limit = limit
    }
}


public extension TGBot {

/**
 Returns the bot's Telegram Star transactions in chronological order. On success, returns a StarTransactions object.

 SeeAlso Telegram Bot API Reference:
 [GetStarTransactionsParams](https://core.telegram.org/bots/api#getstartransactions)
 
 - Parameters:
     - params: Parameters container, see `GetStarTransactionsParams` struct
 - Throws: Throws on errors
 - Returns: `TGStarTransactions`
 */

    @discardableResult
    func getStarTransactions(params: TGGetStarTransactionsParams? = nil) async throws -> TGStarTransactions {
        guard let methodURL: URL = .init(string: getMethodURL("getStarTransactions")) else {
            throw BotError("Bad URL: \(getMethodURL("getStarTransactions"))")
        }
        let result: TGStarTransactions = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
