// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// A method to get the current Telegram Stars balance of the bot. Requires no parameters. On success, returns a StarAmount object.



public extension TGBot {
/**
 A method to get the current Telegram Stars balance of the bot. Requires no parameters. On success, returns a StarAmount object.

 SeeAlso Telegram Bot API Reference:
 [GetMyStarBalanceParams](https://core.telegram.org/bots/api#getmystarbalance)
 
 - Parameters:
     - params: Parameters container, see `GetMyStarBalanceParams` struct
 - Throws: Throws on errors
 - Returns: `TGStarAmount`
 */

    @discardableResult
    func getMyStarBalance() async throws -> TGStarAmount {
        guard let methodURL: URL = .init(string: getMethodURL("getMyStarBalance")) else {
            throw BotError("Bad URL: \(getMethodURL("getMyStarBalance"))")
        }
        let result: TGStarAmount = try await tgClient.post(methodURL)
        return result
    }
}
