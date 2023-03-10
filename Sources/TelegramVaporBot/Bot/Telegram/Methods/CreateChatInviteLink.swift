// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to create an additional invite link for a chat. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. The link can be revoked using the method revokeChatInviteLink. Returns the new invite link as ChatInviteLink object.


/// Parameters container struct for `createChatInviteLink` method
public struct TGCreateChatInviteLinkParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Invite link name; 0-32 characters
    public var name: String?

    /// Point in time (Unix timestamp) when the link will expire
    public var expireDate: Int?

    /// The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    public var memberLimit: Int?

    /// True, if users joining the chat via the link need to be approved by chat administrators. If True, member_limit can't be specified
    public var createsJoinRequest: Bool?

    /// Custom keys for coding/decoding `CreateChatInviteLinkParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case name = "name"
            case expireDate = "expire_date"
            case memberLimit = "member_limit"
            case createsJoinRequest = "creates_join_request"
    }

    public init(chatId: TGChatId, name: String? = nil, expireDate: Int? = nil, memberLimit: Int? = nil, createsJoinRequest: Bool? = nil) {
            self.chatId = chatId
            self.name = name
            self.expireDate = expireDate
            self.memberLimit = memberLimit
            self.createsJoinRequest = createsJoinRequest
    }
}


public extension TGBot {

/**
 Use this method to create an additional invite link for a chat. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. The link can be revoked using the method revokeChatInviteLink. Returns the new invite link as ChatInviteLink object.

 SeeAlso Telegram Bot API Reference:
 [CreateChatInviteLinkParams](https://core.telegram.org/bots/api#createchatinvitelink)
 
 - Parameters:
     - params: Parameters container, see `CreateChatInviteLinkParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */

    @discardableResult
    func createChatInviteLink(params: TGCreateChatInviteLinkParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("createChatInviteLink"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
