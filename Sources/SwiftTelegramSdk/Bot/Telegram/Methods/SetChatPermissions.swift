// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to set default chat permissions for all members. The bot must be an administrator in the group or a supergroup for this to work and must have the can_restrict_members administrator rights. Returns True on success.


/// Parameters container struct for `setChatPermissions` method
public struct TGSetChatPermissionsParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// A JSON-serialized object for new default chat permissions
    public var permissions: TGChatPermissions

    /// Pass True if chat permissions are set independently. Otherwise, the can_send_other_messages and can_add_web_page_previews permissions will imply the can_send_messages, can_send_audios, can_send_documents, can_send_photos, can_send_videos, can_send_video_notes, and can_send_voice_notes permissions; the can_send_polls permission will imply the can_send_messages permission.
    public var useIndependentChatPermissions: Bool?

    /// Custom keys for coding/decoding `SetChatPermissionsParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case permissions = "permissions"
            case useIndependentChatPermissions = "use_independent_chat_permissions"
    }

    public init(chatId: TGChatId, permissions: TGChatPermissions, useIndependentChatPermissions: Bool? = nil) {
            self.chatId = chatId
            self.permissions = permissions
            self.useIndependentChatPermissions = useIndependentChatPermissions
    }
}


public extension TGBot {

/**
 Use this method to set default chat permissions for all members. The bot must be an administrator in the group or a supergroup for this to work and must have the can_restrict_members administrator rights. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetChatPermissionsParams](https://core.telegram.org/bots/api#setchatpermissions)
 
 - Parameters:
     - params: Parameters container, see `SetChatPermissionsParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setChatPermissions(params: TGSetChatPermissionsParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setChatPermissions")) else {
            throw BotError("Bad URL: \(getMethodURL("setChatPermissions"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
