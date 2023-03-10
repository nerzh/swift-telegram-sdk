//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Vapor
import TelegramVaporBot

public func configure(_ app: Application) throws {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    /// set level of debug if you needed
//    TGBot.log.logLevel = .error
    TGBot.log.logLevel = .info
    let bot: TGBot = .init(app: app, botId: tgApi)
    TGBotConnection = TGLongPollingConnection(bot: bot)
    /// OR SET WEBHOOK CONNECTION
    /// TGBotConnection = TGWebHookConnection(bot: bot, webHookURL: "https://your_domain/telegramWebHook")
    Task {
        await DefaultBotHandlers.addHandlers(app: app, connection: TGBotConnection)
        try await TGBotConnection.start()
    }

    try routes(app)
}
