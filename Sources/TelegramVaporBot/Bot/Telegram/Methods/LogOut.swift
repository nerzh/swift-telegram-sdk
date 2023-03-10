// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to log out from the cloud Bot API server before launching the bot locally. You must log out the bot before running it locally, otherwise there is no guarantee that the bot will receive updates. After a successful call, you can immediately log in on a local server, but will not be able to log in back to the cloud Bot API server for 10 minutes. Returns True on success. Requires no parameters.



public extension TGBot {
/**
 Use this method to log out from the cloud Bot API server before launching the bot locally. You must log out the bot before running it locally, otherwise there is no guarantee that the bot will receive updates. After a successful call, you can immediately log in on a local server, but will not be able to log in back to the cloud Bot API server for 10 minutes. Returns True on success. Requires no parameters.

 SeeAlso Telegram Bot API Reference:
 [LogOutParams](https://core.telegram.org/bots/api#logout)
 
 - Parameters:
     - params: Parameters container, see `LogOutParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */

    @discardableResult
    func logOut() async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("logOut"))
        let result: Bool = try await tgClient.post(methodURL)
        return result
    }
}
