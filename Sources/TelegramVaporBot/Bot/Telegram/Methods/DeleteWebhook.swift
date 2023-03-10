// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to remove webhook integration if you decide to switch back to getUpdates. Returns True on success.


/// Parameters container struct for `deleteWebhook` method
public struct TGDeleteWebhookParams: Encodable {

    /// Pass True to drop all pending updates
    public var dropPendingUpdates: Bool?

    /// Custom keys for coding/decoding `DeleteWebhookParams` struct
    public enum CodingKeys: String, CodingKey {
            case dropPendingUpdates = "drop_pending_updates"
    }

    public init(dropPendingUpdates: Bool? = nil) {
            self.dropPendingUpdates = dropPendingUpdates
    }
}


public extension TGBot {

/**
 Use this method to remove webhook integration if you decide to switch back to getUpdates. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteWebhookParams](https://core.telegram.org/bots/api#deletewebhook)
 
 - Parameters:
     - params: Parameters container, see `DeleteWebhookParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */

    @discardableResult
    func deleteWebhook(params: TGDeleteWebhookParams? = nil) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("deleteWebhook"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
