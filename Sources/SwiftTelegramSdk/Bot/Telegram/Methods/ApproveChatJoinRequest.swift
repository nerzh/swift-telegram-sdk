// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to approve a chat join request. The bot must be an administrator in the chat for this to work and must have the can_invite_users administrator right. Returns True on success.


/// Parameters container struct for `approveChatJoinRequest` method
public struct TGApproveChatJoinRequestParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier of the target user
    public var userId: Int64

    /// Custom keys for coding/decoding `ApproveChatJoinRequestParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case userId = "user_id"
    }

    public init(chatId: TGChatId, userId: Int64) {
            self.chatId = chatId
            self.userId = userId
    }
}


public extension TGBot {

/**
 Use this method to approve a chat join request. The bot must be an administrator in the chat for this to work and must have the can_invite_users administrator right. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [ApproveChatJoinRequestParams](https://core.telegram.org/bots/api#approvechatjoinrequest)
 
 - Parameters:
     - params: Parameters container, see `ApproveChatJoinRequestParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func approveChatJoinRequest(params: TGApproveChatJoinRequestParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("approveChatJoinRequest")) else {
            throw BotError("Bad URL: \(getMethodURL("approveChatJoinRequest"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
