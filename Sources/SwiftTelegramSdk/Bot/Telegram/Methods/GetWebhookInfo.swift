// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

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
 - Returns: `TGWebhookInfo`
 */

    @discardableResult
    func getWebhookInfo() async throws -> TGWebhookInfo {
        guard let methodURL: URL = .init(string: getMethodURL("getWebhookInfo")) else {
            throw BotError("Bad URL: \(getMethodURL("getWebhookInfo"))")
        }
        let result: TGWebhookInfo = try await tgClient.post(methodURL)
        return result
    }
}
