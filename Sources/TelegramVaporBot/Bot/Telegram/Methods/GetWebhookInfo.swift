// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to get current webhook status. Requires no parameters. On success, returns a WebhookInfo object. If the bot is using getUpdates, will return an object with the url field empty.



public extension TGBot {

/**
 Use this method to get current webhook status. Requires no parameters. On success, returns a WebhookInfo object. If the bot is using getUpdates, will return an object with the url field empty.

 SeeAlso Telegram Bot API Reference:
 [GetWebhookInfoParams](https://core.telegram.org/bots/api#getwebhookinfo)
 
 - Parameters:
     - params: Parameters container, see `GetWebhookInfoParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `TGWebhookInfo` type
 */
    @discardableResult
    func getWebhookInfo() throws -> EventLoopFuture<TGWebhookInfo> {
        let methodURL: URI = .init(string: getMethodURL("getWebhookInfo"))
        let future: EventLoopFuture<TGWebhookInfo> = tgClient.post(methodURL)
        return future
    }
}
