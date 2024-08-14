// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to edit a subscription invite link created by the bot. The bot must have the can_invite_users administrator rights. Returns the edited invite link as a ChatInviteLink object.


/// Parameters container struct for `editChatSubscriptionInviteLink` method
public struct TGEditChatSubscriptionInviteLinkParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// The invite link to edit
    public var inviteLink: String

    /// Invite link name; 0-32 characters
    public var name: String?

    /// Custom keys for coding/decoding `EditChatSubscriptionInviteLinkParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case inviteLink = "invite_link"
            case name = "name"
    }

    public init(chatId: TGChatId, inviteLink: String, name: String? = nil) {
            self.chatId = chatId
            self.inviteLink = inviteLink
            self.name = name
    }
}


public extension TGBot {

/**
 Use this method to edit a subscription invite link created by the bot. The bot must have the can_invite_users administrator rights. Returns the edited invite link as a ChatInviteLink object.

 SeeAlso Telegram Bot API Reference:
 [EditChatSubscriptionInviteLinkParams](https://core.telegram.org/bots/api#editchatsubscriptioninvitelink)
 
 - Parameters:
     - params: Parameters container, see `EditChatSubscriptionInviteLinkParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func editChatSubscriptionInviteLink(params: TGEditChatSubscriptionInviteLinkParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("editChatSubscriptionInviteLink")) else {
            throw BotError("Bad URL: \(getMethodURL("editChatSubscriptionInviteLink"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
