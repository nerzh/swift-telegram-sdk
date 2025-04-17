// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Upgrades a given regular gift to a unique gift. Requires the can_transfer_and_upgrade_gifts business bot right. Additionally requires the can_transfer_stars business bot right if the upgrade is paid. Returns True on success.


/// Parameters container struct for `upgradeGift` method
public struct TGUpgradeGiftParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// Unique identifier of the regular gift that should be upgraded to a unique one
    public var ownedGiftId: String

    /// Pass True to keep the original gift text, sender and receiver in the upgraded gift
    public var keepOriginalDetails: Bool?

    /// The amount of Telegram Stars that will be paid for the upgrade from the business account balance. If gift.prepaid_upgrade_star_count > 0, then pass 0, otherwise, the can_transfer_stars business bot right is required and gift.upgrade_star_count must be passed.
    public var starCount: Int?

    /// Custom keys for coding/decoding `UpgradeGiftParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case ownedGiftId = "owned_gift_id"
            case keepOriginalDetails = "keep_original_details"
            case starCount = "star_count"
    }

    public init(businessConnectionId: String, ownedGiftId: String, keepOriginalDetails: Bool? = nil, starCount: Int? = nil) {
            self.businessConnectionId = businessConnectionId
            self.ownedGiftId = ownedGiftId
            self.keepOriginalDetails = keepOriginalDetails
            self.starCount = starCount
    }
}


public extension TGBot {

/**
 Upgrades a given regular gift to a unique gift. Requires the can_transfer_and_upgrade_gifts business bot right. Additionally requires the can_transfer_stars business bot right if the upgrade is paid. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [UpgradeGiftParams](https://core.telegram.org/bots/api#upgradegift)
 
 - Parameters:
     - params: Parameters container, see `UpgradeGiftParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func upgradeGift(params: TGUpgradeGiftParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("upgradeGift")) else {
            throw BotError("Bad URL: \(getMethodURL("upgradeGift"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
