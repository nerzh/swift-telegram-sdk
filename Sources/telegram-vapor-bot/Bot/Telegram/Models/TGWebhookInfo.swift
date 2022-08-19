// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Describes the current status of a webhook.

 SeeAlso Telegram Bot API Reference:
 [WebhookInfo](https://core.telegram.org/bots/api#webhookinfo)
 */
public final class TGWebhookInfo: Codable {

    /// Custom keys for coding/decoding `WebhookInfo` struct
    public enum CodingKeys: String, CodingKey {
        case url = "url"
        case hasCustomCertificate = "has_custom_certificate"
        case pendingUpdateCount = "pending_update_count"
        case ipAddress = "ip_address"
        case lastErrorDate = "last_error_date"
        case lastErrorMessage = "last_error_message"
        case lastSynchronizationErrorDate = "last_synchronization_error_date"
        case maxConnections = "max_connections"
        case allowedUpdates = "allowed_updates"
    }

    /// Webhook URL, may be empty if webhook is not set up
    public var url: String

    /// True, if a custom certificate was provided for webhook certificate checks
    public var hasCustomCertificate: Bool

    /// Number of updates awaiting delivery
    public var pendingUpdateCount: Int

    /// Optional. Currently used webhook IP address
    public var ipAddress: String?

    /// Optional. Unix time for the most recent error that happened when trying to deliver an update via webhook
    public var lastErrorDate: Int?

    /// Optional. Error message in human-readable format for the most recent error that happened when trying to deliver an update via webhook
    public var lastErrorMessage: String?

    /// Optional. Unix time of the most recent error that happened when trying to synchronize available updates with Telegram datacenters
    public var lastSynchronizationErrorDate: Int?

    /// Optional. The maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery
    public var maxConnections: Int?

    /// Optional. A list of update types the bot is subscribed to. Defaults to all update types except chat_member
    public var allowedUpdates: [String]?

    public init (url: String, hasCustomCertificate: Bool, pendingUpdateCount: Int, ipAddress: String? = nil, lastErrorDate: Int? = nil, lastErrorMessage: String? = nil, lastSynchronizationErrorDate: Int? = nil, maxConnections: Int? = nil, allowedUpdates: [String]? = nil) {
        self.url = url
        self.hasCustomCertificate = hasCustomCertificate
        self.pendingUpdateCount = pendingUpdateCount
        self.ipAddress = ipAddress
        self.lastErrorDate = lastErrorDate
        self.lastErrorMessage = lastErrorMessage
        self.lastSynchronizationErrorDate = lastSynchronizationErrorDate
        self.maxConnections = maxConnections
        self.allowedUpdates = allowedUpdates
    }
}
