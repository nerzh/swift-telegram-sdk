// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to unban a previously banned channel chat in a supergroup or channel. The bot must be an administrator for this to work and must have the appropriate administrator rights. Returns True on success.


/// Parameters container struct for `unbanChatSenderChat` method
public struct TGUnbanChatSenderChatParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier of the target sender chat
    public var senderChatId: Int64

    /// Custom keys for coding/decoding `UnbanChatSenderChatParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case senderChatId = "sender_chat_id"
    }

    public init(chatId: TGChatId, senderChatId: Int64) {
            self.chatId = chatId
            self.senderChatId = senderChatId
    }
}


public extension TGBot {

/**
 Use this method to unban a previously banned channel chat in a supergroup or channel. The bot must be an administrator for this to work and must have the appropriate administrator rights. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [UnbanChatSenderChatParams](https://core.telegram.org/bots/api#unbanchatsenderchat)
 
 - Parameters:
     - params: Parameters container, see `UnbanChatSenderChatParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func unbanChatSenderChat(params: TGUnbanChatSenderChatParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("unbanChatSenderChat"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }

    @discardableResult
    func unbanChatSenderChat(params: TGUnbanChatSenderChatParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("unbanChatSenderChat"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
