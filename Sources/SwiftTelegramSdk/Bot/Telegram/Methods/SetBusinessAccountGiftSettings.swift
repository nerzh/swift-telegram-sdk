// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Changes the privacy settings pertaining to incoming gifts in a managed business account. Requires the can_change_gift_settings business bot right. Returns True on success.


/// Parameters container struct for `setBusinessAccountGiftSettings` method
public struct TGSetBusinessAccountGiftSettingsParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// Pass True, if a button for sending a gift to the user or by the business account must always be shown in the input field
    public var showGiftButton: Bool

    /// Types of gifts accepted by the business account
    public var acceptedGiftTypes: TGAcceptedGiftTypes

    /// Custom keys for coding/decoding `SetBusinessAccountGiftSettingsParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case showGiftButton = "show_gift_button"
            case acceptedGiftTypes = "accepted_gift_types"
    }

    public init(businessConnectionId: String, showGiftButton: Bool, acceptedGiftTypes: TGAcceptedGiftTypes) {
            self.businessConnectionId = businessConnectionId
            self.showGiftButton = showGiftButton
            self.acceptedGiftTypes = acceptedGiftTypes
    }
}


public extension TGBot {

/**
 Changes the privacy settings pertaining to incoming gifts in a managed business account. Requires the can_change_gift_settings business bot right. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetBusinessAccountGiftSettingsParams](https://core.telegram.org/bots/api#setbusinessaccountgiftsettings)
 
 - Parameters:
     - params: Parameters container, see `SetBusinessAccountGiftSettingsParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setBusinessAccountGiftSettings(params: TGSetBusinessAccountGiftSettingsParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setBusinessAccountGiftSettings")) else {
            throw BotError("Bad URL: \(getMethodURL("setBusinessAccountGiftSettings"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
