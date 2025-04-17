// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to create a subscription invite link for a channel chat. The bot must have the can_invite_users administrator rights. The link can be edited using the method editChatSubscriptionInviteLink or revoked using the method revokeChatInviteLink. Returns the new invite link as a ChatInviteLink object.


/// Parameters container struct for `createChatSubscriptionInviteLink` method
public struct TGCreateChatSubscriptionInviteLinkParams: Encodable {

    /// Unique identifier for the target channel chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Invite link name; 0-32 characters
    public var name: String?

    /// The number of seconds the subscription will be active for before the next payment. Currently, it must always be 2592000 (30 days).
    public var subscriptionPeriod: Int

    /// The amount of Telegram Stars a user must pay initially and after each subsequent subscription period to be a member of the chat; 1-10000
    public var subscriptionPrice: Int

    /// Custom keys for coding/decoding `CreateChatSubscriptionInviteLinkParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case name = "name"
            case subscriptionPeriod = "subscription_period"
            case subscriptionPrice = "subscription_price"
    }

    public init(chatId: TGChatId, name: String? = nil, subscriptionPeriod: Int, subscriptionPrice: Int) {
            self.chatId = chatId
            self.name = name
            self.subscriptionPeriod = subscriptionPeriod
            self.subscriptionPrice = subscriptionPrice
    }
}


public extension TGBot {

/**
 Use this method to create a subscription invite link for a channel chat. The bot must have the can_invite_users administrator rights. The link can be edited using the method editChatSubscriptionInviteLink or revoked using the method revokeChatInviteLink. Returns the new invite link as a ChatInviteLink object.

 SeeAlso Telegram Bot API Reference:
 [CreateChatSubscriptionInviteLinkParams](https://core.telegram.org/bots/api#createchatsubscriptioninvitelink)
 
 - Parameters:
     - params: Parameters container, see `CreateChatSubscriptionInviteLinkParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func createChatSubscriptionInviteLink(params: TGCreateChatSubscriptionInviteLinkParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("createChatSubscriptionInviteLink")) else {
            throw BotError("Bad URL: \(getMethodURL("createChatSubscriptionInviteLink"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
