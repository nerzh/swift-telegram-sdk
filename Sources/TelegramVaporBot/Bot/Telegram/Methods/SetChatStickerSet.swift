// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.


/// Parameters container struct for `setChatStickerSet` method
public struct TGSetChatStickerSetParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Name of the sticker set to be set as the group sticker set
    public var stickerSetName: String

    /// Custom keys for coding/decoding `SetChatStickerSetParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case stickerSetName = "sticker_set_name"
    }

    public init(chatId: TGChatId, stickerSetName: String) {
            self.chatId = chatId
            self.stickerSetName = stickerSetName
    }
}


public extension TGBot {

/**
 Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetChatStickerSetParams](https://core.telegram.org/bots/api#setchatstickerset)
 
 - Parameters:
     - params: Parameters container, see `SetChatStickerSetParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func setChatStickerSet(params: TGSetChatStickerSetParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("setChatStickerSet"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
