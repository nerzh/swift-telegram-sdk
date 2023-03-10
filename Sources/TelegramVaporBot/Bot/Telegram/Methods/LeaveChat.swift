// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method for your bot to leave a group, supergroup or channel. Returns True on success.


/// Parameters container struct for `leaveChat` method
public struct TGLeaveChatParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Custom keys for coding/decoding `LeaveChatParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method for your bot to leave a group, supergroup or channel. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [LeaveChatParams](https://core.telegram.org/bots/api#leavechat)
 
 - Parameters:
     - params: Parameters container, see `LeaveChatParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */

    @discardableResult
    func leaveChat(params: TGLeaveChatParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("leaveChat"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
