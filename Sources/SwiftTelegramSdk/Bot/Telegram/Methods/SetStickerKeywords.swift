// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to change search keywords assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set created by the bot. Returns True on success.


/// Parameters container struct for `setStickerKeywords` method
public struct TGSetStickerKeywordsParams: Encodable {

    /// File identifier of the sticker
    public var sticker: String

    /// A JSON-serialized list of 0-20 search keywords for the sticker with total length of up to 64 characters
    public var keywords: [String]?

    /// Custom keys for coding/decoding `SetStickerKeywordsParams` struct
    public enum CodingKeys: String, CodingKey {
            case sticker = "sticker"
            case keywords = "keywords"
    }

    public init(sticker: String, keywords: [String]? = nil) {
            self.sticker = sticker
            self.keywords = keywords
    }
}


public extension TGBot {

/**
 Use this method to change search keywords assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set created by the bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetStickerKeywordsParams](https://core.telegram.org/bots/api#setstickerkeywords)
 
 - Parameters:
     - params: Parameters container, see `SetStickerKeywordsParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setStickerKeywords(params: TGSetStickerKeywordsParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setStickerKeywords")) else {
            throw BotError("Bad URL: \(getMethodURL("setStickerKeywords"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
