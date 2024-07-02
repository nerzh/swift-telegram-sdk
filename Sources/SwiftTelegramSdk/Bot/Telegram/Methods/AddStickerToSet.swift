// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to add a new sticker to a set created by the bot. Emoji sticker sets can have up to 200 stickers. Other sticker sets can have up to 120 stickers. Returns True on success.


/// Parameters container struct for `addStickerToSet` method
public struct TGAddStickerToSetParams: Encodable {

    /// User identifier of sticker set owner
    public var userId: Int64

    /// Sticker set name
    public var name: String

    /// A JSON-serialized object with information about the added sticker. If exactly the same sticker had already been added to the set, then the set isn't changed.
    public var sticker: TGInputSticker

    /// Custom keys for coding/decoding `AddStickerToSetParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case name = "name"
            case sticker = "sticker"
    }

    public init(userId: Int64, name: String, sticker: TGInputSticker) {
            self.userId = userId
            self.name = name
            self.sticker = sticker
    }
}


public extension TGBot {

/**
 Use this method to add a new sticker to a set created by the bot. Emoji sticker sets can have up to 200 stickers. Other sticker sets can have up to 120 stickers. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [AddStickerToSetParams](https://core.telegram.org/bots/api#addstickertoset)
 
 - Parameters:
     - params: Parameters container, see `AddStickerToSetParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func addStickerToSet(params: TGAddStickerToSetParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("addStickerToSet")) else {
            throw BotError("Bad URL: \(getMethodURL("addStickerToSet"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
