// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Changes the profile photo of a managed business account. Requires the can_edit_profile_photo business bot right. Returns True on success.


/// Parameters container struct for `setBusinessAccountProfilePhoto` method
public struct TGSetBusinessAccountProfilePhotoParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// The new profile photo to set
    public var photo: TGInputProfilePhoto

    /// Pass True to set the public photo, which will be visible even if the main photo is hidden by the business account's privacy settings. An account can have only one public photo.
    public var isPublic: Bool?

    /// Custom keys for coding/decoding `SetBusinessAccountProfilePhotoParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case photo = "photo"
            case isPublic = "is_public"
    }

    public init(businessConnectionId: String, photo: TGInputProfilePhoto, isPublic: Bool? = nil) {
            self.businessConnectionId = businessConnectionId
            self.photo = photo
            self.isPublic = isPublic
    }
}


public extension TGBot {

/**
 Changes the profile photo of a managed business account. Requires the can_edit_profile_photo business bot right. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetBusinessAccountProfilePhotoParams](https://core.telegram.org/bots/api#setbusinessaccountprofilephoto)
 
 - Parameters:
     - params: Parameters container, see `SetBusinessAccountProfilePhotoParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setBusinessAccountProfilePhoto(params: TGSetBusinessAccountProfilePhotoParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setBusinessAccountProfilePhoto")) else {
            throw BotError("Bad URL: \(getMethodURL("setBusinessAccountProfilePhoto"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
