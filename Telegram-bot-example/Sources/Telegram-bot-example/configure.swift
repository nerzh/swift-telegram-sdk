//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Vapor
import telegram_vapor_bot_lib

public func configure(_ app: Application) throws {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    let connection: TGConnectionPrtcl = TGLongPollingConnection()
    /// OR SET WEBHOOK CONNECTION
    /// let connection: TGConnectionPrtcl = TGWebHookConnection(webHookURL: "https://your_domain/telegram_webhook_route")
    TGBot.configure(connection: connection, botId: tgApi, vaporClient: app.client)
    try TGBot.shared.start()
    /// set level of debug if you needed 
    TGBot.log.logLevel = .error
    DefaultBotHandlers.addHandlers(app: app, bot: TGBot.shared)

    try routes(app)
}
