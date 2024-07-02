// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get a sticker set. On success, a StickerSet object is returned.


/// Parameters container struct for `getStickerSet` method
public struct TGGetStickerSetParams: Encodable {

    /// Name of the sticker set
    public var name: String

    /// Custom keys for coding/decoding `GetStickerSetParams` struct
    public enum CodingKeys: String, CodingKey {
            case name = "name"
    }

    public init(name: String) {
            self.name = name
    }
}


public extension TGBot {

/**
 Use this method to get a sticker set. On success, a StickerSet object is returned.

 SeeAlso Telegram Bot API Reference:
 [GetStickerSetParams](https://core.telegram.org/bots/api#getstickerset)
 
 - Parameters:
     - params: Parameters container, see `GetStickerSetParams` struct
 - Throws: Throws on errors
 - Returns: `TGStickerSet`
 */

    @discardableResult
    func getStickerSet(params: TGGetStickerSetParams) async throws -> TGStickerSet {
        guard let methodURL: URL = .init(string: getMethodURL("getStickerSet")) else {
            throw BotError("Bad URL: \(getMethodURL("getStickerSet"))")
        }
        let result: TGStickerSet = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
