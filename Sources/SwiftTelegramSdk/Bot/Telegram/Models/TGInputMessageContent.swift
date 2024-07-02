// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents the content of a message to be sent as a result of an inline query. Telegram clients currently support the following 5 types:
 InputTextMessageContent
 InputLocationMessageContent
 InputVenueMessageContent
 InputContactMessageContent
 InputInvoiceMessageContent

 SeeAlso Telegram Bot API Reference:
 [InputMessageContent](https://core.telegram.org/bots/api#inputmessagecontent)
 **/
public enum TGInputMessageContent: Codable {
    case inputTextMessageContent(TGInputTextMessageContent)
    case inputLocationMessageContent(TGInputLocationMessageContent)
    case inputVenueMessageContent(TGInputVenueMessageContent)
    case inputContactMessageContent(TGInputContactMessageContent)
    case inputInvoiceMessageContent(TGInputInvoiceMessageContent)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGInputTextMessageContent.self) {
            self = .inputTextMessageContent(value)
        } else if let value = try? container.decode(TGInputLocationMessageContent.self) {
            self = .inputLocationMessageContent(value)
        } else if let value = try? container.decode(TGInputVenueMessageContent.self) {
            self = .inputVenueMessageContent(value)
        } else if let value = try? container.decode(TGInputContactMessageContent.self) {
            self = .inputContactMessageContent(value)
        } else if let value = try? container.decode(TGInputInvoiceMessageContent.self) {
            self = .inputInvoiceMessageContent(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE InputMessageContent.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .inputTextMessageContent(value):
            try container.encode(value)
        case let .inputLocationMessageContent(value):
            try container.encode(value)
        case let .inputVenueMessageContent(value):
            try container.encode(value)
        case let .inputContactMessageContent(value):
            try container.encode(value)
        case let .inputInvoiceMessageContent(value):
            try container.encode(value)
        }
    }
}
