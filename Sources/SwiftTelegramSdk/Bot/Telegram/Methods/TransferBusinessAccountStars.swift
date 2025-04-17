// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Transfers Telegram Stars from the business account balance to the bot's balance. Requires the can_transfer_stars business bot right. Returns True on success.


/// Parameters container struct for `transferBusinessAccountStars` method
public struct TGTransferBusinessAccountStarsParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// Number of Telegram Stars to transfer; 1-10000
    public var starCount: Int

    /// Custom keys for coding/decoding `TransferBusinessAccountStarsParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case starCount = "star_count"
    }

    public init(businessConnectionId: String, starCount: Int) {
            self.businessConnectionId = businessConnectionId
            self.starCount = starCount
    }
}


public extension TGBot {

/**
 Transfers Telegram Stars from the business account balance to the bot's balance. Requires the can_transfer_stars business bot right. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [TransferBusinessAccountStarsParams](https://core.telegram.org/bots/api#transferbusinessaccountstars)
 
 - Parameters:
     - params: Parameters container, see `TransferBusinessAccountStarsParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func transferBusinessAccountStars(params: TGTransferBusinessAccountStarsParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("transferBusinessAccountStars")) else {
            throw BotError("Bad URL: \(getMethodURL("transferBusinessAccountStars"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
