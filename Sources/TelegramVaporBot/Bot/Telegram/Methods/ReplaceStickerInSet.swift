// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to replace an existing sticker in a sticker set with a new one. The method is equivalent to calling deleteStickerFromSet, then addStickerToSet, then setStickerPositionInSet. Returns True on success.


/// Parameters container struct for `replaceStickerInSet` method
public struct TGReplaceStickerInSetParams: Encodable {

    /// User identifier of the sticker set owner
    public var userId: Int64

    /// Sticker set name
    public var name: String

    /// File identifier of the replaced sticker
    public var oldSticker: String

    /// A JSON-serialized object with information about the added sticker. If exactly the same sticker had already been added to the set, then the set remains unchanged.
    public var sticker: TGInputSticker

    /// Custom keys for coding/decoding `ReplaceStickerInSetParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case name = "name"
            case oldSticker = "old_sticker"
            case sticker = "sticker"
    }

    public init(userId: Int64, name: String, oldSticker: String, sticker: TGInputSticker) {
            self.userId = userId
            self.name = name
            self.oldSticker = oldSticker
            self.sticker = sticker
    }
}


public extension TGBot {

/**
 Use this method to replace an existing sticker in a sticker set with a new one. The method is equivalent to calling deleteStickerFromSet, then addStickerToSet, then setStickerPositionInSet. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [ReplaceStickerInSetParams](https://core.telegram.org/bots/api#replacestickerinset)
 
 - Parameters:
     - params: Parameters container, see `ReplaceStickerInSetParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func replaceStickerInSet(params: TGReplaceStickerInSetParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("replaceStickerInSet"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
