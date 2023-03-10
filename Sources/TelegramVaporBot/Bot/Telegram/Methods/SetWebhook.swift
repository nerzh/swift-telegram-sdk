// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to specify a URL and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified URL, containing a JSON-serialized Update. In case of an unsuccessful request, we will give up after a reasonable amount of attempts. Returns True on success.
/// If you'd like to make sure that the webhook was set by you, you can specify secret data in the parameter secret_token. If specified, the request will contain a header “X-Telegram-Bot-Api-Secret-Token” with the secret token as content.


/// Parameters container struct for `setWebhook` method
public struct TGSetWebhookParams: Encodable {

    /// HTTPS URL to send updates to. Use an empty string to remove webhook integration
    public var url: String

    /// Upload your public key certificate so that the root certificate in use can be checked. See our self-signed guide for details.
    public var certificate: TGInputFile?

    /// The fixed IP address which will be used to send webhook requests instead of the IP address resolved through DNS
    public var ipAddress: String?

    /// The maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery, 1-100. Defaults to 40. Use lower values to limit the load on your bot's server, and higher values to increase your bot's throughput.
    public var maxConnections: Int?

    /// A JSON-serialized list of the update types you want your bot to receive. For example, specify [“message”, “edited_channel_post”, “callback_query”] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all update types except chat_member (default). If not specified, the previous setting will be used.
    /// Please note that this parameter doesn't affect updates created before the call to the setWebhook, so unwanted updates may be received for a short period of time.
    public var allowedUpdates: [String]?

    /// Pass True to drop all pending updates
    public var dropPendingUpdates: Bool?

    /// A secret token to be sent in a header “X-Telegram-Bot-Api-Secret-Token” in every webhook request, 1-256 characters. Only characters A-Z, a-z, 0-9, _ and - are allowed. The header is useful to ensure that the request comes from a webhook set by you.
    public var secretToken: String?

    /// Custom keys for coding/decoding `SetWebhookParams` struct
    public enum CodingKeys: String, CodingKey {
            case url = "url"
            case certificate = "certificate"
            case ipAddress = "ip_address"
            case maxConnections = "max_connections"
            case allowedUpdates = "allowed_updates"
            case dropPendingUpdates = "drop_pending_updates"
            case secretToken = "secret_token"
    }

    public init(url: String, certificate: TGInputFile? = nil, ipAddress: String? = nil, maxConnections: Int? = nil, allowedUpdates: [String]? = nil, dropPendingUpdates: Bool? = nil, secretToken: String? = nil) {
            self.url = url
            self.certificate = certificate
            self.ipAddress = ipAddress
            self.maxConnections = maxConnections
            self.allowedUpdates = allowedUpdates
            self.dropPendingUpdates = dropPendingUpdates
            self.secretToken = secretToken
    }
}


public extension TGBot {

/**
 Use this method to specify a URL and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified URL, containing a JSON-serialized Update. In case of an unsuccessful request, we will give up after a reasonable amount of attempts. Returns True on success.
 If you'd like to make sure that the webhook was set by you, you can specify secret data in the parameter secret_token. If specified, the request will contain a header “X-Telegram-Bot-Api-Secret-Token” with the secret token as content.

 SeeAlso Telegram Bot API Reference:
 [SetWebhookParams](https://core.telegram.org/bots/api#setwebhook)
 
 - Parameters:
     - params: Parameters container, see `SetWebhookParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setWebhook(params: TGSetWebhookParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("setWebhook"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
