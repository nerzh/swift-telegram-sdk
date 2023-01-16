//
//  File.swift
//  
//
//  Created by Giacomo Leopizzi on 13/01/23.
//

import Vapor

final public class Telegram: LifecycleHandler {
    
    private let app: Application
    public var configuration: Configuration?
    
    private var _bot: TGBotPrtcl?
    public var bot: TGBotPrtcl {
        if let bot = self._bot {
            return bot
        }
        guard let config = configuration else {
            fatalError("Telegram is not configured ! Please setup app.telegram.configuration before")
        }
        let tgClient = config.tgClient ?? DefaultTGClient(client: app.client)
        let connection: TGConnectionPrtcl
        switch config.connection {
        case let .longPool(limit: limit, timeout: timeout, allowedUpdates: allowedUpdates):
            connection = TGLongPollingConnection(limit: limit, timeout: timeout, allowedUpdates: allowedUpdates, app: app)
        case .webhook(let uri):
            connection = TGWebHookConnection(webHookURL: uri, app: app)
        case .custom(let conn):
            connection = conn
        }
    
        let bot = TGBot(connection: connection, tgClient: tgClient, tgURI: config.tgURI, botId: config.botId)
        self._bot = bot
        return bot
    }
    
    init(app: Application) {
        self.app = app
    }
    
    public func willBoot(_ application: Application) throws {
        try bot.start()
    }
    
}
