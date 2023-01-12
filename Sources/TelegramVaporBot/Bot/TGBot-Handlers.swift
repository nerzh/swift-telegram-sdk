//
//  File.swift
//  
//
//  Created by Giacomo Leopizzi on 13/01/23.
//

import Foundation

extension TGBot {
    
    func onCallback(pattern: String, callback: @escaping (_ update: TGUpdate, _ bot: TGBotPrtcl) async throws -> TGAnswerCallbackQueryParams) {
        let handler = TGCallbackQueryHandler(pattern: pattern) { update, bot in
            let params = try await callback(update, bot)
            try bot.answerCallbackQuery(params: params)
        }
        connection.dispatcher.add(handler)
    }
    
    func onCommand(_ commands: String..., filters: TGFilter = .all, options: TGCommandHandler.Options = [], botUsername: String? = nil, callback: @escaping TGHandlerCallback) {
        let handler = TGCommandHandler(commands: commands, filters: filters, options: options, botUsername: botUsername, callback)
        connection.dispatcher.add(handler)
    }
    
    func onMessage(filters: TGFilter = .all, options: TGMessageHandler.Options = [.messageUpdates, .channelPostUpdates], callback: @escaping TGHandlerCallback) {
        let handler = TGMessageHandler(filters: filters, options: options, callback)
        connection.dispatcher.add(handler)
    }
    
}
