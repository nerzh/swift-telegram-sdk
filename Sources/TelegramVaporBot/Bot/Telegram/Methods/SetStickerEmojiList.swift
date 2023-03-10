// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to change the list of emoji assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set created by the bot. Returns True on success.


/// Parameters container struct for `setStickerEmojiList` method
public struct TGSetStickerEmojiListParams: Encodable {

    /// File identifier of the sticker
    public var sticker: String

    /// A JSON-serialized list of 1-20 emoji associated with the sticker
    public var emojiList: [String]

    /// Custom keys for coding/decoding `SetStickerEmojiListParams` struct
    public enum CodingKeys: String, CodingKey {
            case sticker = "sticker"
            case emojiList = "emoji_list"
    }

    public init(sticker: String, emojiList: [String]) {
            self.sticker = sticker
            self.emojiList = emojiList
    }
}


public extension TGBot {

/**
 Use this method to change the list of emoji assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set created by the bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetStickerEmojiListParams](https://core.telegram.org/bots/api#setstickeremojilist)
 
 - Parameters:
     - params: Parameters container, see `SetStickerEmojiListParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */

    @discardableResult
    func setStickerEmojiList(params: TGSetStickerEmojiListParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("setStickerEmojiList"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
