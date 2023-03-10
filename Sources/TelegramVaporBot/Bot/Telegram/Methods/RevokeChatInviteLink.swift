// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to revoke an invite link created by the bot. If the primary link is revoked, a new link is automatically generated. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the revoked invite link as ChatInviteLink object.


/// Parameters container struct for `revokeChatInviteLink` method
public struct TGRevokeChatInviteLinkParams: Encodable {

    /// Unique identifier of the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// The invite link to revoke
    public var inviteLink: String

    /// Custom keys for coding/decoding `RevokeChatInviteLinkParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case inviteLink = "invite_link"
    }

    public init(chatId: TGChatId, inviteLink: String) {
            self.chatId = chatId
            self.inviteLink = inviteLink
    }
}


public extension TGBot {

/**
 Use this method to revoke an invite link created by the bot. If the primary link is revoked, a new link is automatically generated. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the revoked invite link as ChatInviteLink object.

 SeeAlso Telegram Bot API Reference:
 [RevokeChatInviteLinkParams](https://core.telegram.org/bots/api#revokechatinvitelink)
 
 - Parameters:
     - params: Parameters container, see `RevokeChatInviteLinkParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */

    @discardableResult
    func revokeChatInviteLink(params: TGRevokeChatInviteLinkParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("revokeChatInviteLink"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
