// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Returns the gifts received and owned by a managed business account. Requires the can_view_gifts_and_stars business bot right. Returns OwnedGifts on success.


/// Parameters container struct for `getBusinessAccountGifts` method
public struct TGGetBusinessAccountGiftsParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// Pass True to exclude gifts that aren't saved to the account's profile page
    public var excludeUnsaved: Bool?

    /// Pass True to exclude gifts that are saved to the account's profile page
    public var excludeSaved: Bool?

    /// Pass True to exclude gifts that can be purchased an unlimited number of times
    public var excludeUnlimited: Bool?

    /// Pass True to exclude gifts that can be purchased a limited number of times
    public var excludeLimited: Bool?

    /// Pass True to exclude unique gifts
    public var excludeUnique: Bool?

    /// Pass True to sort results by gift price instead of send date. Sorting is applied before pagination.
    public var sortByPrice: Bool?

    /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    public var offset: String?

    /// The maximum number of gifts to be returned; 1-100. Defaults to 100
    public var limit: Int?

    /// Custom keys for coding/decoding `GetBusinessAccountGiftsParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case excludeUnsaved = "exclude_unsaved"
            case excludeSaved = "exclude_saved"
            case excludeUnlimited = "exclude_unlimited"
            case excludeLimited = "exclude_limited"
            case excludeUnique = "exclude_unique"
            case sortByPrice = "sort_by_price"
            case offset = "offset"
            case limit = "limit"
    }

    public init(businessConnectionId: String, excludeUnsaved: Bool? = nil, excludeSaved: Bool? = nil, excludeUnlimited: Bool? = nil, excludeLimited: Bool? = nil, excludeUnique: Bool? = nil, sortByPrice: Bool? = nil, offset: String? = nil, limit: Int? = nil) {
            self.businessConnectionId = businessConnectionId
            self.excludeUnsaved = excludeUnsaved
            self.excludeSaved = excludeSaved
            self.excludeUnlimited = excludeUnlimited
            self.excludeLimited = excludeLimited
            self.excludeUnique = excludeUnique
            self.sortByPrice = sortByPrice
            self.offset = offset
            self.limit = limit
    }
}


public extension TGBot {

/**
 Returns the gifts received and owned by a managed business account. Requires the can_view_gifts_and_stars business bot right. Returns OwnedGifts on success.

 SeeAlso Telegram Bot API Reference:
 [GetBusinessAccountGiftsParams](https://core.telegram.org/bots/api#getbusinessaccountgifts)
 
 - Parameters:
     - params: Parameters container, see `GetBusinessAccountGiftsParams` struct
 - Throws: Throws on errors
 - Returns: `TGOwnedGifts`
 */

    @discardableResult
    func getBusinessAccountGifts(params: TGGetBusinessAccountGiftsParams) async throws -> TGOwnedGifts {
        guard let methodURL: URL = .init(string: getMethodURL("getBusinessAccountGifts")) else {
            throw BotError("Bad URL: \(getMethodURL("getBusinessAccountGifts"))")
        }
        let result: TGOwnedGifts = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
