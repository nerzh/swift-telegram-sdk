//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Vapor
import TelegramVaporBot


func routes(_ app: Application) throws {
    
    try app.register(collection: TelegramController())

    app.post("telegram_webhook_route") { (request) -> String in
        do {
            let update: TGUpdate = try request.content.decode(TGUpdate.self)
            try TGBotConnection.dispatcher.process([update])
        } catch {
            TGBot.log.error(error.logMessage)
        }

        return "ok"
    }
}

