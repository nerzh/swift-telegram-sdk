// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The paid media isn't available before the payment.

 SeeAlso Telegram Bot API Reference:
 [PaidMediaPreview](https://core.telegram.org/bots/api#paidmediapreview)
 */

public enum TGPaidMediaPreviewType: String, Codable {
    case preview = "preview"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGPaidMediaPreviewType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}