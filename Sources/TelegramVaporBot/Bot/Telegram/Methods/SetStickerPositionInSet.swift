// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to move a sticker in a set created by the bot to a specific position. Returns True on success.


/// Parameters container struct for `setStickerPositionInSet` method
public struct TGSetStickerPositionInSetParams: Encodable {

    /// File identifier of the sticker
    public var sticker: String

    /// New sticker position in the set, zero-based
    public var position: Int

    /// Custom keys for coding/decoding `SetStickerPositionInSetParams` struct
    public enum CodingKeys: String, CodingKey {
            case sticker = "sticker"
            case position = "position"
    }

    public init(sticker: String, position: Int) {
            self.sticker = sticker
            self.position = position
    }
}


public extension TGBot {

/**
 Use this method to move a sticker in a set created by the bot to a specific position. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetStickerPositionInSetParams](https://core.telegram.org/bots/api#setstickerpositioninset)
 
 - Parameters:
     - params: Parameters container, see `SetStickerPositionInSetParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */

    @discardableResult
    func setStickerPositionInSet(params: TGSetStickerPositionInSetParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("setStickerPositionInSet"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
