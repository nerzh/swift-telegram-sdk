// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Changes the bio of a managed business account. Requires the can_change_bio business bot right. Returns True on success.


/// Parameters container struct for `setBusinessAccountBio` method
public struct TGSetBusinessAccountBioParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// The new value of the bio for the business account; 0-140 characters
    public var bio: String?

    /// Custom keys for coding/decoding `SetBusinessAccountBioParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case bio = "bio"
    }

    public init(businessConnectionId: String, bio: String? = nil) {
            self.businessConnectionId = businessConnectionId
            self.bio = bio
    }
}


public extension TGBot {

/**
 Changes the bio of a managed business account. Requires the can_change_bio business bot right. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetBusinessAccountBioParams](https://core.telegram.org/bots/api#setbusinessaccountbio)
 
 - Parameters:
     - params: Parameters container, see `SetBusinessAccountBioParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setBusinessAccountBio(params: TGSetBusinessAccountBioParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setBusinessAccountBio")) else {
            throw BotError("Bad URL: \(getMethodURL("setBusinessAccountBio"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
