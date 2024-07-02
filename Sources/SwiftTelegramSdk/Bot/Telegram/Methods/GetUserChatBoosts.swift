// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get the list of boosts added to a chat by a user. Requires administrator rights in the chat. Returns a UserChatBoosts object.


/// Parameters container struct for `getUserChatBoosts` method
public struct TGGetUserChatBoostsParams: Encodable {

    /// Unique identifier for the chat or username of the channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier of the target user
    public var userId: Int64

    /// Custom keys for coding/decoding `GetUserChatBoostsParams` struct
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
 Use this method to get the list of boosts added to a chat by a user. Requires administrator rights in the chat. Returns a UserChatBoosts object.

 SeeAlso Telegram Bot API Reference:
 [GetUserChatBoostsParams](https://core.telegram.org/bots/api#getuserchatboosts)
 
 - Parameters:
     - params: Parameters container, see `GetUserChatBoostsParams` struct
 - Throws: Throws on errors
 - Returns: `TGUserChatBoosts`
 */

    @discardableResult
    func getUserChatBoosts(params: TGGetUserChatBoostsParams) async throws -> TGUserChatBoosts {
        guard let methodURL: URL = .init(string: getMethodURL("getUserChatBoosts")) else {
            throw BotError("Bad URL: \(getMethodURL("getUserChatBoosts"))")
        }
        let result: TGUserChatBoosts = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
