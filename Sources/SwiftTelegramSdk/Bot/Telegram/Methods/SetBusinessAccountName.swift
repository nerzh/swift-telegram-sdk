// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Changes the first and last name of a managed business account. Requires the can_change_name business bot right. Returns True on success.


/// Parameters container struct for `setBusinessAccountName` method
public struct TGSetBusinessAccountNameParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// The new value of the first name for the business account; 1-64 characters
    public var firstName: String

    /// The new value of the last name for the business account; 0-64 characters
    public var lastName: String?

    /// Custom keys for coding/decoding `SetBusinessAccountNameParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case firstName = "first_name"
            case lastName = "last_name"
    }

    public init(businessConnectionId: String, firstName: String, lastName: String? = nil) {
            self.businessConnectionId = businessConnectionId
            self.firstName = firstName
            self.lastName = lastName
    }
}


public extension TGBot {

/**
 Changes the first and last name of a managed business account. Requires the can_change_name business bot right. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetBusinessAccountNameParams](https://core.telegram.org/bots/api#setbusinessaccountname)
 
 - Parameters:
     - params: Parameters container, see `SetBusinessAccountNameParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setBusinessAccountName(params: TGSetBusinessAccountNameParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setBusinessAccountName")) else {
            throw BotError("Bad URL: \(getMethodURL("setBusinessAccountName"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
