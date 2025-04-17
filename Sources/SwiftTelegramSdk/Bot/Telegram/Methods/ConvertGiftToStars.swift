// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Converts a given regular gift to Telegram Stars. Requires the can_convert_gifts_to_stars business bot right. Returns True on success.


/// Parameters container struct for `convertGiftToStars` method
public struct TGConvertGiftToStarsParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// Unique identifier of the regular gift that should be converted to Telegram Stars
    public var ownedGiftId: String

    /// Custom keys for coding/decoding `ConvertGiftToStarsParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case ownedGiftId = "owned_gift_id"
    }

    public init(businessConnectionId: String, ownedGiftId: String) {
            self.businessConnectionId = businessConnectionId
            self.ownedGiftId = ownedGiftId
    }
}


public extension TGBot {

/**
 Converts a given regular gift to Telegram Stars. Requires the can_convert_gifts_to_stars business bot right. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [ConvertGiftToStarsParams](https://core.telegram.org/bots/api#convertgifttostars)
 
 - Parameters:
     - params: Parameters container, see `ConvertGiftToStarsParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func convertGiftToStars(params: TGConvertGiftToStarsParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("convertGiftToStars")) else {
            throw BotError("Bad URL: \(getMethodURL("convertGiftToStars"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
