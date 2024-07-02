// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to get custom emoji stickers, which can be used as a forum topic icon by any user. Requires no parameters. Returns an Array of Sticker objects.



public extension TGBot {
/**
 Use this method to get custom emoji stickers, which can be used as a forum topic icon by any user. Requires no parameters. Returns an Array of Sticker objects.

 SeeAlso Telegram Bot API Reference:
 [GetForumTopicIconStickersParams](https://core.telegram.org/bots/api#getforumtopiciconstickers)
 
 - Parameters:
     - params: Parameters container, see `GetForumTopicIconStickersParams` struct
 - Throws: Throws on errors
 - Returns: `[TGSticker]`
 */

    @discardableResult
    func getForumTopicIconStickers() async throws -> [TGSticker] {
        let methodURL: URI = .init(string: getMethodURL("getForumTopicIconStickers"))
        let result: [TGSticker] = try await tgClient.post(methodURL)
        return result
    }
}
