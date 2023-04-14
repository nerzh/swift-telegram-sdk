//
//  CallbackQueryHandler.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 23.04.2018.
//

import Foundation

/// Handler for CallbackQuery updates
public class TGCallbackQueryHandler: TGHandlerPrtcl {

    public var id: Int = 0
    public var name: String
    
    let pattern: String
    var callbackAsync: TGHandlerCallbackAsync
    
    public init(
        name: String = String(describing: TGCallbackQueryHandler.self),
        pattern: String,
        _ callback: @escaping TGHandlerCallbackAsync
    ) {
        self.pattern = pattern
        self.callbackAsync = callback
        self.name = name
    }

    public func check(update: TGUpdate) -> Bool {
        guard let callbackQuery = update.callbackQuery else { return false }
        if
            let data = callbackQuery.data,
            !data.matchRegexp(pattern: pattern
        ) {
            return false
        }
        return true
    }
    
    public func handle(update: TGUpdate, bot: TGBot) async throws {
        try await callbackAsync(update, bot)
    }
}
