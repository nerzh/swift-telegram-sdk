//
//  ReplyMarkup.swift
//  App
//
//  Created by Givi Pataridze on 01.03.2018.
//

//import TelegrammerMultipart

/** Enum for InlineKeyboardMarkup or ReplyKeyboardMarkup or ReplyKeyboardRemove or ForceReply
 
 SeeAlso Telegram TGBot API Reference:
 [Reply Markups](https://core.telegram.org/bots/2-0-intro#new-inline-keyboards)
 */
public enum TGReplyMarkup: Codable {
    case inlineKeyboardMarkup(TGInlineKeyboardMarkup)
    case replyKeyboardMarkup(TGReplyKeyboardMarkup)
    case replyKeyboardRemove(TGReplyKeyboardRemove)
    case forceReply(TGForceReply)
    case undefined

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .inlineKeyboardMarkup(let value):
            try container.encode(value)
        case .replyKeyboardMarkup(let value):
            try container.encode(value)
        case .replyKeyboardRemove(let value):
            try container.encode(value)
        case .forceReply(let value):
            try container.encode(value)
        case .undefined:
            try container.encodeNil()
        }
    }

    public init(from decoder: Decoder) throws {
        if let value = try? decoder.singleValueContainer().decode(TGInlineKeyboardMarkup.self) {
            self = .inlineKeyboardMarkup(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGReplyKeyboardMarkup.self) {
            self = .replyKeyboardMarkup(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGReplyKeyboardRemove.self) {
            self = .replyKeyboardRemove(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(TGForceReply.self) {
            self = .forceReply(value)
            return
        }
        self = .undefined
    }
}
