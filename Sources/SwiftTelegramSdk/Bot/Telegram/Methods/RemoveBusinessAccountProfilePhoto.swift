// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Removes the current profile photo of a managed business account. Requires the can_edit_profile_photo business bot right. Returns True on success.


/// Parameters container struct for `removeBusinessAccountProfilePhoto` method
public struct TGRemoveBusinessAccountProfilePhotoParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// Pass True to remove the public photo, which is visible even if the main photo is hidden by the business account's privacy settings. After the main photo is removed, the previous profile photo (if present) becomes the main photo.
    public var isPublic: Bool?

    /// Custom keys for coding/decoding `RemoveBusinessAccountProfilePhotoParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case isPublic = "is_public"
    }

    public init(businessConnectionId: String, isPublic: Bool? = nil) {
            self.businessConnectionId = businessConnectionId
            self.isPublic = isPublic
    }
}


public extension TGBot {

/**
 Removes the current profile photo of a managed business account. Requires the can_edit_profile_photo business bot right. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [RemoveBusinessAccountProfilePhotoParams](https://core.telegram.org/bots/api#removebusinessaccountprofilephoto)
 
 - Parameters:
     - params: Parameters container, see `RemoveBusinessAccountProfilePhotoParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func removeBusinessAccountProfilePhoto(params: TGRemoveBusinessAccountProfilePhotoParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("removeBusinessAccountProfilePhoto")) else {
            throw BotError("Bad URL: \(getMethodURL("removeBusinessAccountProfilePhoto"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
