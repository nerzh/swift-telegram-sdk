// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Changes the username of a managed business account. Requires the can_change_username business bot right. Returns True on success.


/// Parameters container struct for `setBusinessAccountUsername` method
public struct TGSetBusinessAccountUsernameParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// The new value of the username for the business account; 0-32 characters
    public var username: String?

    /// Custom keys for coding/decoding `SetBusinessAccountUsernameParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case username = "username"
    }

    public init(businessConnectionId: String, username: String? = nil) {
            self.businessConnectionId = businessConnectionId
            self.username = username
    }
}


public extension TGBot {

/**
 Changes the username of a managed business account. Requires the can_change_username business bot right. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetBusinessAccountUsernameParams](https://core.telegram.org/bots/api#setbusinessaccountusername)
 
 - Parameters:
     - params: Parameters container, see `SetBusinessAccountUsernameParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setBusinessAccountUsername(params: TGSetBusinessAccountUsernameParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setBusinessAccountUsername")) else {
            throw BotError("Bad URL: \(getMethodURL("setBusinessAccountUsername"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
