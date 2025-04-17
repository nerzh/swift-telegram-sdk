// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Transfers an owned unique gift to another user. Requires the can_transfer_and_upgrade_gifts business bot right. Requires can_transfer_stars business bot right if the transfer is paid. Returns True on success.


/// Parameters container struct for `transferGift` method
public struct TGTransferGiftParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// Unique identifier of the regular gift that should be transferred
    public var ownedGiftId: String

    /// Unique identifier of the chat which will own the gift. The chat must be active in the last 24 hours.
    public var newOwnerChatId: Int64

    /// The amount of Telegram Stars that will be paid for the transfer from the business account balance. If positive, then the can_transfer_stars business bot right is required.
    public var starCount: Int?

    /// Custom keys for coding/decoding `TransferGiftParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case ownedGiftId = "owned_gift_id"
            case newOwnerChatId = "new_owner_chat_id"
            case starCount = "star_count"
    }

    public init(businessConnectionId: String, ownedGiftId: String, newOwnerChatId: Int64, starCount: Int? = nil) {
            self.businessConnectionId = businessConnectionId
            self.ownedGiftId = ownedGiftId
            self.newOwnerChatId = newOwnerChatId
            self.starCount = starCount
    }
}


public extension TGBot {

/**
 Transfers an owned unique gift to another user. Requires the can_transfer_and_upgrade_gifts business bot right. Requires can_transfer_stars business bot right if the transfer is paid. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [TransferGiftParams](https://core.telegram.org/bots/api#transfergift)
 
 - Parameters:
     - params: Parameters container, see `TransferGiftParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func transferGift(params: TGTransferGiftParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("transferGift")) else {
            throw BotError("Bad URL: \(getMethodURL("transferGift"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
