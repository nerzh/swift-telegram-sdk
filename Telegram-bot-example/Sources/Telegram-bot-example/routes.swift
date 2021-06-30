//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Vapor
import telegram_vapor_bot


func routes(_ app: Application) throws {

    app.post("telegram_webhook_route") { (request) -> String in
        do {
            let update: TGUpdate = try request.content.decode(TGUpdate.self)
            try TGBot.shared.connection.dispatcher.process([update])
        } catch {
            TGBot.log.error(error.logMessage)
        }

        return "ok"
    }
}

