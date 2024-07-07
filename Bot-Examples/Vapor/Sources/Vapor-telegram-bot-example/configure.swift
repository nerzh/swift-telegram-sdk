//
//  configure.swift
//  Vapor-telegram-bot-example
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Vapor
import SwiftTelegramSdk

public func configure(_ app: Application) async throws {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    
    /// SET WEBHOOK CONNECTION
    // let bot: TGBot = try await .init(connectionType: .webhook(webHookURL: URL(string: "https://your_domain/telegramWebHook")!),
    //                            dispatcher: nil, tgClient: VaporTGClient(client: app.client),
    //                            tgURI: TGBot.standardTGURL, botId: tgApi, log: app.logger)
    
    /// SET LONGPOLLING CONNECTION
        let bot: TGBot = try await .init(connectionType: .longpolling(limit: nil,
                                                                      timeout: nil,
                                                                      allowedUpdates: nil),
                                         dispatcher: nil,
                                         tgClient: VaporTGClient(client: app.client),
                                         tgURI: TGBot.standardTGURL,
                                         botId: tgApi,
                                         log: app.logger)
    
    // set level of debug if you needed
    // bot.log.logLevel = .error
    await botActor.setBot(bot)
    await DefaultBotHandlers.addHandlers(bot: botActor.bot)
    try await botActor.bot.start()
    
    try routes(app)
}
