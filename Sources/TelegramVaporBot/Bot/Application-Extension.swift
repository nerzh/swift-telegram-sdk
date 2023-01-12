//
//  File.swift
//  
//
//  Created by Giacomo Leopizzi on 12/01/23.
//

import Vapor

extension Application {
    
    private struct TelegramStorage: StorageKey {
        typealias Value = Telegram
    }
    
    public var telegram: Telegram {
        if let telegram = self.storage.get(TelegramStorage.self) {
            return telegram
        } else {
            let telegram = Telegram(app: self)
            self.lifecycle.use(telegram)
            self.storage.set(TelegramStorage.self, to: telegram)
            return telegram
        }
    }
    
}

extension Application {
    
    public func telegramWebhook(_ path: PathComponent...) {
        post(path) { (request) throws -> String in
            let update: TGUpdate = try request.content.decode(TGUpdate.self)
            try request.application.telegram.bot.connection.dispatcher.process([update])
            return "ok"
        }
    }
    
}
