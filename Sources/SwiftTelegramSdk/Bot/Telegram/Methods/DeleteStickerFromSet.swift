// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to delete a sticker from a set created by the bot. Returns True on success.


/// Parameters container struct for `deleteStickerFromSet` method
public struct TGDeleteStickerFromSetParams: Encodable {

    /// File identifier of the sticker
    public var sticker: String

    /// Custom keys for coding/decoding `DeleteStickerFromSetParams` struct
    public enum CodingKeys: String, CodingKey {
            case sticker = "sticker"
    }

    public init(sticker: String) {
            self.sticker = sticker
    }
}


public extension TGBot {

/**
 Use this method to delete a sticker from a set created by the bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteStickerFromSetParams](https://core.telegram.org/bots/api#deletestickerfromset)
 
 - Parameters:
     - params: Parameters container, see `DeleteStickerFromSetParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func deleteStickerFromSet(params: TGDeleteStickerFromSetParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("deleteStickerFromSet")) else {
            throw BotError("Bad URL: \(getMethodURL("deleteStickerFromSet"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
