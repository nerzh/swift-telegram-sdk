// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to restrict a user in a supergroup. The bot must be an administrator in the supergroup for this to work and must have the appropriate administrator rights. Pass True for all permissions to lift restrictions from a user. Returns True on success.


/// Parameters container struct for `restrictChatMember` method
public struct TGRestrictChatMemberParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Unique identifier of the target user
    public var userId: Int64

    /// A JSON-serialized object for new user permissions
    public var permissions: TGChatPermissions

    /// Pass True if chat permissions are set independently. Otherwise, the can_send_other_messages and can_add_web_page_previews permissions will imply the can_send_messages, can_send_audios, can_send_documents, can_send_photos, can_send_videos, can_send_video_notes, and can_send_voice_notes permissions; the can_send_polls permission will imply the can_send_messages permission.
    public var useIndependentChatPermissions: Bool?

    /// Date when restrictions will be lifted for the user; Unix time. If user is restricted for more than 366 days or less than 30 seconds from the current time, they are considered to be restricted forever
    public var untilDate: Int?

    /// Custom keys for coding/decoding `RestrictChatMemberParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case userId = "user_id"
            case permissions = "permissions"
            case useIndependentChatPermissions = "use_independent_chat_permissions"
            case untilDate = "until_date"
    }

    public init(chatId: TGChatId, userId: Int64, permissions: TGChatPermissions, useIndependentChatPermissions: Bool? = nil, untilDate: Int? = nil) {
            self.chatId = chatId
            self.userId = userId
            self.permissions = permissions
            self.useIndependentChatPermissions = useIndependentChatPermissions
            self.untilDate = untilDate
    }
}


public extension TGBot {

/**
 Use this method to restrict a user in a supergroup. The bot must be an administrator in the supergroup for this to work and must have the appropriate administrator rights. Pass True for all permissions to lift restrictions from a user. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [RestrictChatMemberParams](https://core.telegram.org/bots/api#restrictchatmember)
 
 - Parameters:
     - params: Parameters container, see `RestrictChatMemberParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func restrictChatMember(params: TGRestrictChatMemberParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("restrictChatMember")) else {
            throw BotError("Bad URL: \(getMethodURL("restrictChatMember"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
