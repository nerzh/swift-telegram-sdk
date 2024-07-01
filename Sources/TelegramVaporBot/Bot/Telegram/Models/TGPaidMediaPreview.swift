// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 The paid media isn't available before the payment.

 SeeAlso Telegram Bot API Reference:
 [PaidMediaPreview](https://core.telegram.org/bots/api#paidmediapreview)
 **/
public final class TGPaidMediaPreview: Codable {

    /// Custom keys for coding/decoding `PaidMediaPreview` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case width = "width"
        case height = "height"
        case duration = "duration"
    }

    /// Type of the paid media, always “preview”
    public var type: TGPaidMediaPreviewType

    /// Optional. Media width as defined by the sender
    public var width: Int?

    /// Optional. Media height as defined by the sender
    public var height: Int?

    /// Optional. Duration of the media in seconds as defined by the sender
    public var duration: Int?

    public init (type: TGPaidMediaPreviewType, width: Int? = nil, height: Int? = nil, duration: Int? = nil) {
        self.type = type
        self.width = width
        self.height = height
        self.duration = duration
    }
}
