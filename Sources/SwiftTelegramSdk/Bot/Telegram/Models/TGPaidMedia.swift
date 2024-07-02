// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object describes paid media. Currently, it can be one of
 PaidMediaPreview
 PaidMediaPhoto
 PaidMediaVideo

 SeeAlso Telegram Bot API Reference:
 [PaidMedia](https://core.telegram.org/bots/api#paidmedia)
 **/
public enum TGPaidMedia: Codable {
    case paidMediaPreview(TGPaidMediaPreview)
    case paidMediaPhoto(TGPaidMediaPhoto)
    case paidMediaVideo(TGPaidMediaVideo)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGPaidMediaPreview.self) {
            self = .paidMediaPreview(value)
        } else if let value = try? container.decode(TGPaidMediaPhoto.self) {
            self = .paidMediaPhoto(value)
        } else if let value = try? container.decode(TGPaidMediaVideo.self) {
            self = .paidMediaVideo(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE PaidMedia.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .paidMediaPreview(value):
            try container.encode(value)
        case let .paidMediaPhoto(value):
            try container.encode(value)
        case let .paidMediaVideo(value):
            try container.encode(value)
        }
    }
}
