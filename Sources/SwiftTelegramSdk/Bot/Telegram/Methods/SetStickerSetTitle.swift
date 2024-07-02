// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to set the title of a created sticker set. Returns True on success.


/// Parameters container struct for `setStickerSetTitle` method
public struct TGSetStickerSetTitleParams: Encodable {

    /// Sticker set name
    public var name: String

    /// Sticker set title, 1-64 characters
    public var title: String

    /// Custom keys for coding/decoding `SetStickerSetTitleParams` struct
    public enum CodingKeys: String, CodingKey {
            case name = "name"
            case title = "title"
    }

    public init(name: String, title: String) {
            self.name = name
            self.title = title
    }
}


public extension TGBot {

/**
 Use this method to set the title of a created sticker set. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetStickerSetTitleParams](https://core.telegram.org/bots/api#setstickersettitle)
 
 - Parameters:
     - params: Parameters container, see `SetStickerSetTitleParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setStickerSetTitle(params: TGSetStickerSetTitleParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setStickerSetTitle")) else {
            throw BotError("Bad URL: \(getMethodURL("setStickerSetTitle"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
