// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// A simple method for testing your bot's authentication token. Requires no parameters. Returns basic information about the bot in form of a User object.



public extension TGBot {
/**
 A simple method for testing your bot's authentication token. Requires no parameters. Returns basic information about the bot in form of a User object.

 SeeAlso Telegram Bot API Reference:
 [GetMeParams](https://core.telegram.org/bots/api#getme)
 
 - Parameters:
     - params: Parameters container, see `GetMeParams` struct
 - Throws: Throws on errors
 - Returns: `TGUser`
 */

    @discardableResult
    func getMe() async throws -> TGUser {
        guard let methodURL: URL = .init(string: getMethodURL("getMe")) else {
            throw BotError("Bad URL: \(getMethodURL("getMe"))")
        }
        let result: TGUser = try await tgClient.post(methodURL)
        return result
    }
}
