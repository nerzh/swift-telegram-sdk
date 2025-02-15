// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Removes verification from a user who is currently verified on behalf of the organization represented by the bot. Returns True on success.


/// Parameters container struct for `removeUserVerification` method
public struct TGRemoveUserVerificationParams: Encodable {

    /// Unique identifier of the target user
    public var userId: Int64

    /// Custom keys for coding/decoding `RemoveUserVerificationParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
    }

    public init(userId: Int64) {
            self.userId = userId
    }
}


public extension TGBot {

/**
 Removes verification from a user who is currently verified on behalf of the organization represented by the bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [RemoveUserVerificationParams](https://core.telegram.org/bots/api#removeuserverification)
 
 - Parameters:
     - params: Parameters container, see `RemoveUserVerificationParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func removeUserVerification(params: TGRemoveUserVerificationParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("removeUserVerification")) else {
            throw BotError("Bad URL: \(getMethodURL("removeUserVerification"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
