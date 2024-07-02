// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to get the number of members in a chat. Returns Int on success.


/// Parameters container struct for `getChatMemberCount` method
public struct TGGetChatMemberCountParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Custom keys for coding/decoding `GetChatMemberCountParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to get the number of members in a chat. Returns Int on success.

 SeeAlso Telegram Bot API Reference:
 [GetChatMemberCountParams](https://core.telegram.org/bots/api#getchatmembercount)
 
 - Parameters:
     - params: Parameters container, see `GetChatMemberCountParams` struct
 - Throws: Throws on errors
 - Returns: `Int`
 */

    @discardableResult
    func getChatMemberCount(params: TGGetChatMemberCountParams) async throws -> Int {
        let methodURL: URI = .init(string: getMethodURL("getChatMemberCount"))
        let result: Int = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
