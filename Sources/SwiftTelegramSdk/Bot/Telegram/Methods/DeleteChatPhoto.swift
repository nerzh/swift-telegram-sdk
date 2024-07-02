// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to delete a chat photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.


/// Parameters container struct for `deleteChatPhoto` method
public struct TGDeleteChatPhotoParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Custom keys for coding/decoding `DeleteChatPhotoParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to delete a chat photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteChatPhotoParams](https://core.telegram.org/bots/api#deletechatphoto)
 
 - Parameters:
     - params: Parameters container, see `DeleteChatPhotoParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func deleteChatPhoto(params: TGDeleteChatPhotoParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("deleteChatPhoto")) else {
            throw BotError("Bad URL: \(getMethodURL("deleteChatPhoto"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
