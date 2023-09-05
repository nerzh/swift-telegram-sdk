// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to ban a user in a group, a supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.


/// Parameters container struct for `banChatMember` method
public struct TGBanChatMemberParams: Encodable {

    /// Unique identifier for the target group or username of the target supergroup or channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier of the target user
    public var userId: Int64

    /// Date when the user will be unbanned; Unix time. If user is banned for more than 366 days or less than 30 seconds from the current time they are considered to be banned forever. Applied for supergroups and channels only.
    public var untilDate: Int?

    /// Pass True to delete all messages from the chat for the user that is being removed. If False, the user will be able to see messages in the group that were sent before the user was removed. Always True for supergroups and channels.
    public var revokeMessages: Bool?

    /// Custom keys for coding/decoding `BanChatMemberParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case userId = "user_id"
            case untilDate = "until_date"
            case revokeMessages = "revoke_messages"
    }

    public init(chatId: TGChatId, userId: Int64, untilDate: Int? = nil, revokeMessages: Bool? = nil) {
            self.chatId = chatId
            self.userId = userId
            self.untilDate = untilDate
            self.revokeMessages = revokeMessages
    }
}


public extension TGBot {

/**
 Use this method to ban a user in a group, a supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [BanChatMemberParams](https://core.telegram.org/bots/api#banchatmember)
 
 - Parameters:
     - params: Parameters container, see `BanChatMemberParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func banChatMember(params: TGBanChatMemberParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("banChatMember"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
