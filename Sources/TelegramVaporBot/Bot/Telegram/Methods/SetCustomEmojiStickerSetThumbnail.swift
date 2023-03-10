// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to set the thumbnail of a custom emoji sticker set. Returns True on success.


/// Parameters container struct for `setCustomEmojiStickerSetThumbnail` method
public struct TGSetCustomEmojiStickerSetThumbnailParams: Encodable {

    /// Sticker set name
    public var name: String

    /// Custom emoji identifier of a sticker from the sticker set; pass an empty string to drop the thumbnail and use the first sticker as the thumbnail.
    public var customEmojiId: String?

    /// Custom keys for coding/decoding `SetCustomEmojiStickerSetThumbnailParams` struct
    public enum CodingKeys: String, CodingKey {
            case name = "name"
            case customEmojiId = "custom_emoji_id"
    }

    public init(name: String, customEmojiId: String? = nil) {
            self.name = name
            self.customEmojiId = customEmojiId
    }
}


public extension TGBot {

/**
 Use this method to set the thumbnail of a custom emoji sticker set. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetCustomEmojiStickerSetThumbnailParams](https://core.telegram.org/bots/api#setcustomemojistickersetthumbnail)
 
 - Parameters:
     - params: Parameters container, see `SetCustomEmojiStickerSetThumbnailParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */

    @discardableResult
    func setCustomEmojiStickerSetThumbnail(params: TGSetCustomEmojiStickerSetThumbnailParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("setCustomEmojiStickerSetThumbnail"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
