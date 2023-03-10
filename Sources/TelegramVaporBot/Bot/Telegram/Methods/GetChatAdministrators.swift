// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to get a list of administrators in a chat, which aren't bots. Returns an Array of ChatMember objects.


/// Parameters container struct for `getChatAdministrators` method
public struct TGGetChatAdministratorsParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Custom keys for coding/decoding `GetChatAdministratorsParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to get a list of administrators in a chat, which aren't bots. Returns an Array of ChatMember objects.

 SeeAlso Telegram Bot API Reference:
 [GetChatAdministratorsParams](https://core.telegram.org/bots/api#getchatadministrators)
 
 - Parameters:
     - params: Parameters container, see `GetChatAdministratorsParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `[TGChatMember]` type
 */
    @discardableResult
    func getChatAdministrators(params: TGGetChatAdministratorsParams) throws -> EventLoopFuture<[TGChatMember]> {
        let methodURL: URI = .init(string: getMethodURL("getChatAdministrators"))
        let future: EventLoopFuture<[TGChatMember]> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }

    @discardableResult
    func getChatAdministrators(params: TGGetChatAdministratorsParams) async throws -> [TGChatMember] {
        let methodURL: URI = .init(string: getMethodURL("getChatAdministrators"))
        let result: [TGChatMember] = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
