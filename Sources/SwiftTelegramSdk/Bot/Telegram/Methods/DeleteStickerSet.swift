// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to delete a sticker set that was created by the bot. Returns True on success.


/// Parameters container struct for `deleteStickerSet` method
public struct TGDeleteStickerSetParams: Encodable {

    /// Sticker set name
    public var name: String

    /// Custom keys for coding/decoding `DeleteStickerSetParams` struct
    public enum CodingKeys: String, CodingKey {
            case name = "name"
    }

    public init(name: String) {
            self.name = name
    }
}


public extension TGBot {

/**
 Use this method to delete a sticker set that was created by the bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteStickerSetParams](https://core.telegram.org/bots/api#deletestickerset)
 
 - Parameters:
     - params: Parameters container, see `DeleteStickerSetParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func deleteStickerSet(params: TGDeleteStickerSetParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("deleteStickerSet")) else {
            throw BotError("Bad URL: \(getMethodURL("deleteStickerSet"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
