// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to change the description of a group, a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.


/// Parameters container struct for `setChatDescription` method
public struct TGSetChatDescriptionParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// New chat description, 0-255 characters
    public var description: String?

    /// Custom keys for coding/decoding `SetChatDescriptionParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case description = "description"
    }

    public init(chatId: TGChatId, description: String? = nil) {
            self.chatId = chatId
            self.description = description
    }
}


public extension TGBot {

/**
 Use this method to change the description of a group, a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetChatDescriptionParams](https://core.telegram.org/bots/api#setchatdescription)
 
 - Parameters:
     - params: Parameters container, see `SetChatDescriptionParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func setChatDescription(params: TGSetChatDescriptionParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("setChatDescription"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }

    @discardableResult
    func setChatDescription(params: TGSetChatDescriptionParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("setChatDescription"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
