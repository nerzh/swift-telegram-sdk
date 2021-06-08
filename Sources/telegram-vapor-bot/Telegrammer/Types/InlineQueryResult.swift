//
//  InlineQueryResult.swift
//  App
//
//  Created by Givi Pataridze on 28.02.2018.
//

// swiftlint:disable all

/// This enum represents one result of an inline query. Telegram clients currently support results of the following 20 types
public enum TGInlineQueryResult: Codable {
    case cachedAudio(TGInlineQueryResultAudio)
    case cachedDocument(TGInlineQueryResultCachedDocument)
    case cachedGif(TGInlineQueryResultCachedGif)
    case cachedMpeg4Gif(TGInlineQueryResultCachedMpeg4Gif)
    case cachedPhoto(TGInlineQueryResultCachedPhoto)
    case cachedSticker(TGInlineQueryResultCachedSticker)
    case cachedVideo(TGInlineQueryResultCachedVideo)
    case cachedVoice(TGInlineQueryResultCachedVoice)
    case article(TGInlineQueryResultArticle)
    case audio(TGInlineQueryResultAudio)
    case contact(TGInlineQueryResultContact)
    case game(TGInlineQueryResultGame)
    case document(TGInlineQueryResultDocument)
    case gif(TGInlineQueryResultGif)
    case location(TGInlineQueryResultLocation)
    case mpeg4Gif(TGInlineQueryResultMpeg4Gif)
    case photo(TGInlineQueryResultPhoto)
    case venue(TGInlineQueryResultVenue)
    case video(TGInlineQueryResultVideo)
    case voice(TGInlineQueryResultVoice)
    case undefined

    public init(from decoder: Decoder) throws {
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultAudio.self) {
            self = .cachedAudio(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultCachedDocument.self) {
            self = .cachedDocument(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultCachedGif.self) {
            self = .cachedGif(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultCachedMpeg4Gif.self) {
            self = .cachedMpeg4Gif(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultCachedPhoto.self) {
            self = .cachedPhoto(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultCachedSticker.self) {
            self = .cachedSticker(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultCachedVideo.self) {
            self = .cachedVideo(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultCachedVoice.self) {
            self = .cachedVoice(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultArticle.self) {
            self = .article(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultAudio.self) {
            self = .audio(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultContact.self) {
            self = .contact(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultGame.self) {
            self = .game(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultDocument.self) {
            self = .document(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultGif.self) {
            self = .gif(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultLocation.self) {
            self = .location(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultMpeg4Gif.self) {
            self = .mpeg4Gif(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultPhoto.self) {
            self = .photo(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultVenue.self) {
            self = .venue(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultVideo.self) {
            self = .video(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGInlineQueryResultVoice.self) {
            self = .voice(value)
            return
        }
        self = .undefined
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .cachedAudio(let value):
            try container.encode(value)
        case .cachedDocument(let value):
            try container.encode(value)
        case .cachedGif(let value):
            try container.encode(value)
        case .cachedMpeg4Gif(let value):
            try container.encode(value)
        case .cachedPhoto(let value):
            try container.encode(value)
        case .cachedSticker(let value):
            try container.encode(value)
        case .cachedVideo(let value):
            try container.encode(value)
        case .cachedVoice(let value):
            try container.encode(value)
        case .article(let value):
            try container.encode(value)
        case .audio(let value):
            try container.encode(value)
        case .contact(let value):
            try container.encode(value)
        case .game(let value):
            try container.encode(value)
        case .document(let value):
            try container.encode(value)
        case .gif(let value):
            try container.encode(value)
        case .location(let value):
            try container.encode(value)
        case .mpeg4Gif(let value):
            try container.encode(value)
        case .photo(let value):
            try container.encode(value)
        case .venue(let value):
            try container.encode(value)
        case .video(let value):
            try container.encode(value)
        case .voice(let value):
            try container.encode(value)
        case .undefined:
            try container.encodeNil()
        }
    }
}
