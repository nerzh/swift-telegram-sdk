// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Returns the list of gifts that can be sent by the bot to users. Requires no parameters. Returns a Gifts object.



public extension TGBot {
/**
 Returns the list of gifts that can be sent by the bot to users. Requires no parameters. Returns a Gifts object.

 SeeAlso Telegram Bot API Reference:
 [GetAvailableGiftsParams](https://core.telegram.org/bots/api#getavailablegifts)
 
 - Parameters:
     - params: Parameters container, see `GetAvailableGiftsParams` struct
 - Throws: Throws on errors
 - Returns: `TGGifts`
 */

    @discardableResult
    func getAvailableGifts() async throws -> TGGifts {
        guard let methodURL: URL = .init(string: getMethodURL("getAvailableGifts")) else {
            throw BotError("Bad URL: \(getMethodURL("getAvailableGifts"))")
        }
        let result: TGGifts = try await tgClient.post(methodURL)
        return result
    }
}
