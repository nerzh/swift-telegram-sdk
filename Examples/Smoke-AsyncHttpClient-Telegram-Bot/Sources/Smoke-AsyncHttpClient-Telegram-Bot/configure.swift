//
//  configure.swift
//  Smoke-AsyncHttpClient-bot-example
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import SwiftTelegramSdk
import Logging

func configure(appContext: TelegramApplicationContext) async throws {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    
    /// SET WEBHOOK CONNECTION
    // let bot: TGBot = try await .init(connectionType: .webhook(webHookURL: URL(string: "https://your_domain/telegramWebHook")!),
    //                                  dispatcher: nil,
    //                                  tgClient: URLSessionTGClient(),
    //                                  tgURI: TGBot.standardTGURL,
    //                                  botId: tgApi,
    //                                  log: appContext.logger)
    
    /// SET LONGPOLLING CONNECTION
    // set level of debug if you needed
//    var logger = appContext.logger
//    logger.logLevel = .error
    let bot: TGBot = try await .init(connectionType: .longpolling(limit: nil,
                                     timeout: nil, allowedUpdates: nil),
                                     dispatcher: nil, tgClient: AsyncHttpTGClient(),
                                     tgURI: TGBot.standardTGURL, botId: tgApi, log: appContext.logger)
    await appContext.botActor.setBot(bot)
    await DefaultBotHandlers.addHandlers(bot: appContext.botActor.bot)
    try await appContext.botActor.bot.start()
}
