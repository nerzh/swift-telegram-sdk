// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents one result of an inline query. Telegram clients currently support results of the following 20 types:
 InlineQueryResultCachedAudio
 InlineQueryResultCachedDocument
 InlineQueryResultCachedGif
 InlineQueryResultCachedMpeg4Gif
 InlineQueryResultCachedPhoto
 InlineQueryResultCachedSticker
 InlineQueryResultCachedVideo
 InlineQueryResultCachedVoice
 InlineQueryResultArticle
 InlineQueryResultAudio
 InlineQueryResultContact
 InlineQueryResultGame
 InlineQueryResultDocument
 InlineQueryResultGif
 InlineQueryResultLocation
 InlineQueryResultMpeg4Gif
 InlineQueryResultPhoto
 InlineQueryResultVenue
 InlineQueryResultVideo
 InlineQueryResultVoice
 Note: All URLs passed in inline query results will be available to end users and therefore must be assumed to be public.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResult](https://core.telegram.org/bots/api#inlinequeryresult)
 **/
public enum TGInlineQueryResult: Codable {
    case inlineQueryResultCachedAudio(TGInlineQueryResultCachedAudio)
    case inlineQueryResultCachedDocument(TGInlineQueryResultCachedDocument)
    case inlineQueryResultCachedGif(TGInlineQueryResultCachedGif)
    case inlineQueryResultCachedMpeg4Gif(TGInlineQueryResultCachedMpeg4Gif)
    case inlineQueryResultCachedPhoto(TGInlineQueryResultCachedPhoto)
    case inlineQueryResultCachedSticker(TGInlineQueryResultCachedSticker)
    case inlineQueryResultCachedVideo(TGInlineQueryResultCachedVideo)
    case inlineQueryResultCachedVoice(TGInlineQueryResultCachedVoice)
    case inlineQueryResultArticle(TGInlineQueryResultArticle)
    case inlineQueryResultAudio(TGInlineQueryResultAudio)
    case inlineQueryResultContact(TGInlineQueryResultContact)
    case inlineQueryResultGame(TGInlineQueryResultGame)
    case inlineQueryResultDocument(TGInlineQueryResultDocument)
    case inlineQueryResultGif(TGInlineQueryResultGif)
    case inlineQueryResultLocation(TGInlineQueryResultLocation)
    case inlineQueryResultMpeg4Gif(TGInlineQueryResultMpeg4Gif)
    case inlineQueryResultPhoto(TGInlineQueryResultPhoto)
    case inlineQueryResultVenue(TGInlineQueryResultVenue)
    case inlineQueryResultVideo(TGInlineQueryResultVideo)
    case inlineQueryResultVoice(TGInlineQueryResultVoice)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGInlineQueryResultCachedAudio.self) {
            self = .inlineQueryResultCachedAudio(value)
        } else if let value = try? container.decode(TGInlineQueryResultCachedDocument.self) {
            self = .inlineQueryResultCachedDocument(value)
        } else if let value = try? container.decode(TGInlineQueryResultCachedGif.self) {
            self = .inlineQueryResultCachedGif(value)
        } else if let value = try? container.decode(TGInlineQueryResultCachedMpeg4Gif.self) {
            self = .inlineQueryResultCachedMpeg4Gif(value)
        } else if let value = try? container.decode(TGInlineQueryResultCachedPhoto.self) {
            self = .inlineQueryResultCachedPhoto(value)
        } else if let value = try? container.decode(TGInlineQueryResultCachedSticker.self) {
            self = .inlineQueryResultCachedSticker(value)
        } else if let value = try? container.decode(TGInlineQueryResultCachedVideo.self) {
            self = .inlineQueryResultCachedVideo(value)
        } else if let value = try? container.decode(TGInlineQueryResultCachedVoice.self) {
            self = .inlineQueryResultCachedVoice(value)
        } else if let value = try? container.decode(TGInlineQueryResultArticle.self) {
            self = .inlineQueryResultArticle(value)
        } else if let value = try? container.decode(TGInlineQueryResultAudio.self) {
            self = .inlineQueryResultAudio(value)
        } else if let value = try? container.decode(TGInlineQueryResultContact.self) {
            self = .inlineQueryResultContact(value)
        } else if let value = try? container.decode(TGInlineQueryResultGame.self) {
            self = .inlineQueryResultGame(value)
        } else if let value = try? container.decode(TGInlineQueryResultDocument.self) {
            self = .inlineQueryResultDocument(value)
        } else if let value = try? container.decode(TGInlineQueryResultGif.self) {
            self = .inlineQueryResultGif(value)
        } else if let value = try? container.decode(TGInlineQueryResultLocation.self) {
            self = .inlineQueryResultLocation(value)
        } else if let value = try? container.decode(TGInlineQueryResultMpeg4Gif.self) {
            self = .inlineQueryResultMpeg4Gif(value)
        } else if let value = try? container.decode(TGInlineQueryResultPhoto.self) {
            self = .inlineQueryResultPhoto(value)
        } else if let value = try? container.decode(TGInlineQueryResultVenue.self) {
            self = .inlineQueryResultVenue(value)
        } else if let value = try? container.decode(TGInlineQueryResultVideo.self) {
            self = .inlineQueryResultVideo(value)
        } else if let value = try? container.decode(TGInlineQueryResultVoice.self) {
            self = .inlineQueryResultVoice(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE InlineQueryResult.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .inlineQueryResultCachedAudio(value):
            try container.encode(value)
        case let .inlineQueryResultCachedDocument(value):
            try container.encode(value)
        case let .inlineQueryResultCachedGif(value):
            try container.encode(value)
        case let .inlineQueryResultCachedMpeg4Gif(value):
            try container.encode(value)
        case let .inlineQueryResultCachedPhoto(value):
            try container.encode(value)
        case let .inlineQueryResultCachedSticker(value):
            try container.encode(value)
        case let .inlineQueryResultCachedVideo(value):
            try container.encode(value)
        case let .inlineQueryResultCachedVoice(value):
            try container.encode(value)
        case let .inlineQueryResultArticle(value):
            try container.encode(value)
        case let .inlineQueryResultAudio(value):
            try container.encode(value)
        case let .inlineQueryResultContact(value):
            try container.encode(value)
        case let .inlineQueryResultGame(value):
            try container.encode(value)
        case let .inlineQueryResultDocument(value):
            try container.encode(value)
        case let .inlineQueryResultGif(value):
            try container.encode(value)
        case let .inlineQueryResultLocation(value):
            try container.encode(value)
        case let .inlineQueryResultMpeg4Gif(value):
            try container.encode(value)
        case let .inlineQueryResultPhoto(value):
            try container.encode(value)
        case let .inlineQueryResultVenue(value):
            try container.encode(value)
        case let .inlineQueryResultVideo(value):
            try container.encode(value)
        case let .inlineQueryResultVoice(value):
            try container.encode(value)
        }
    }
}
