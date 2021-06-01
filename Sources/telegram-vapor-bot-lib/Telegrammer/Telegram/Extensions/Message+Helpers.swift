//
//  Message+Helpers.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 09/06/2018.
//

public extension TGMessage {

    /**
     Helper method to easy reply to message
     - Parameters:
        - text: Text to send in reply
        - bot: TGBot from which send reply
        - parseMode: Optional. Text format
        - replyMarkup: Optional. Reply Markup

     - Throws: Throws on errors
     */
    func reply(text: String, bot: TGBotPrtcl, parseMode: TGParseMode? = nil, replyMarkup: TGReplyMarkup? = nil) throws {
        let params = TGSendMessageParams(
            chatId: .chat(Int64(chat.id)),
            text: text,
            parseMode: parseMode,
            replyMarkup: replyMarkup
        )
        try bot.sendMessage(params: params)
    }

    /**
     Helper method to easy edit message

     - Parameters:
        - text: Text to send in reply
        - bot: TGBot from which send reply
        - parseMode: Optional. Text format
        - replyMarkup: Optional. Reply Markup

     - Throws: Throws on errors
     */
    func edit(
        text: String,
        bot: TGBotPrtcl,
        parseMode: TGParseMode? = nil,
        replyMarkup: TGInlineKeyboardMarkup? = nil
    ) throws {
        let params = TGEditMessageTextParams(
            chatId: .chat(Int64(chat.id)),
            messageId: messageId,
            text: text,
            parseMode: parseMode,
            replyMarkup: replyMarkup
        )
        try bot.editMessageText(params: params)
    }

    /**
     Helper method to easy edit message

     - Parameters:
        - bot: TGBot from which send reply

     - Throws: Throws on errors
     */
    func delete(bot: TGBotPrtcl) throws {
        let params = TGDeleteMessageParams(
            chatId: .chat(Int64(chat.id)),
            messageId: messageId
        )
        try bot.deleteMessage(params: params)
    }

    func contains(command: String) -> Bool {
        guard let text = text, let entities = entities else { return false }
        let commands = entities.compactMap { (entity) -> String? in
            guard entity.type == .botCommand else { return nil }
            let start = text.index(text.startIndex, offsetBy: entity.offset)
            let end = text.index(start, offsetBy: entity.length - 1)
            let cmd = String(text[start...end])
            return cmd == command ? cmd : nil
        }
        return !commands.isEmpty
    }
}
