// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

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
 - Returns: EventLoopFuture of `TGUser` type
 */
    @discardableResult
    func getMe() throws -> EventLoopFuture<TGUser> {
        let methodURL: URI = .init(string: getMethodURL("getMe"))
        let future: EventLoopFuture<TGUser> = tgClient.post(methodURL)
        return future
    }

    @discardableResult
    func getMe() async throws -> TGUser {
        let methodURL: URI = .init(string: getMethodURL("getMe"))
        let result: TGUser = try await tgClient.post(methodURL)
        return result
    }
}
