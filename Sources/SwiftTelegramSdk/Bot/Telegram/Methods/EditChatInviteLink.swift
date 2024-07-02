// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to edit a non-primary invite link created by the bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the edited invite link as a ChatInviteLink object.


/// Parameters container struct for `editChatInviteLink` method
public struct TGEditChatInviteLinkParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// The invite link to edit
    public var inviteLink: String

    /// Invite link name; 0-32 characters
    public var name: String?

    /// Point in time (Unix timestamp) when the link will expire
    public var expireDate: Int?

    /// The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    public var memberLimit: Int?

    /// True, if users joining the chat via the link need to be approved by chat administrators. If True, member_limit can't be specified
    public var createsJoinRequest: Bool?

    /// Custom keys for coding/decoding `EditChatInviteLinkParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case inviteLink = "invite_link"
            case name = "name"
            case expireDate = "expire_date"
            case memberLimit = "member_limit"
            case createsJoinRequest = "creates_join_request"
    }

    public init(chatId: TGChatId, inviteLink: String, name: String? = nil, expireDate: Int? = nil, memberLimit: Int? = nil, createsJoinRequest: Bool? = nil) {
            self.chatId = chatId
            self.inviteLink = inviteLink
            self.name = name
            self.expireDate = expireDate
            self.memberLimit = memberLimit
            self.createsJoinRequest = createsJoinRequest
    }
}


public extension TGBot {

/**
 Use this method to edit a non-primary invite link created by the bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the edited invite link as a ChatInviteLink object.

 SeeAlso Telegram Bot API Reference:
 [EditChatInviteLinkParams](https://core.telegram.org/bots/api#editchatinvitelink)
 
 - Parameters:
     - params: Parameters container, see `EditChatInviteLinkParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func editChatInviteLink(params: TGEditChatInviteLinkParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("editChatInviteLink"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
