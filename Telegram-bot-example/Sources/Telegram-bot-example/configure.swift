//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Vapor
import TelegramVaporBot

public func configure(_ app: Application) async throws {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    /// set level of debug if you needed
//    TGBot.log.logLevel = .error
    TGBot.log.logLevel = app.logger.logLevel
    let bot: TGBot = .init(app: app, botId: tgApi)
    await TGBOT.setConnection(try await TGLongPollingConnection(bot: bot))
    /// OR SET WEBHOOK CONNECTION
    /// await TGBOT.setConnection(try await TGWebHookConnection(bot: bot, webHookURL: "https://your_domain/telegramWebHook"))
    
    await DefaultBotHandlers.addHandlers(app: app, connection: TGBOT.connection)
    try await TGBOT.connection.start()

    try routes(app)
}
