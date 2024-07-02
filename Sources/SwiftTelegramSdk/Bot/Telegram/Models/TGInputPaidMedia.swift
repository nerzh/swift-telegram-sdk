// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object describes the paid media to be sent. Currently, it can be one of
 InputPaidMediaPhoto
 InputPaidMediaVideo

 SeeAlso Telegram Bot API Reference:
 [InputPaidMedia](https://core.telegram.org/bots/api#inputpaidmedia)
 **/
public enum TGInputPaidMedia: Codable {
    case inputPaidMediaPhoto(TGInputPaidMediaPhoto)
    case inputPaidMediaVideo(TGInputPaidMediaVideo)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGInputPaidMediaPhoto.self) {
            self = .inputPaidMediaPhoto(value)
        } else if let value = try? container.decode(TGInputPaidMediaVideo.self) {
            self = .inputPaidMediaVideo(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE InputPaidMedia.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .inputPaidMediaPhoto(value):
            try container.encode(value)
        case let .inputPaidMediaVideo(value):
            try container.encode(value)
        }
    }
}
