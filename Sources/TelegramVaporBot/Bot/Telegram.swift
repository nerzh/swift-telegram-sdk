//
//  File.swift
//  
//
//  Created by Giacomo Leopizzi on 13/01/23.
//

import Vapor

final public class Telegram: LifecycleHandler {
    
    public struct Configuration {
        public var connection: TGConnectionPrtcl
        public var botId: String
        public var tgURI: URI
        public var tgClient: TGClientPrtcl?
        
        public init(connection: TGConnectionPrtcl, botId: String, tgURI: URI = TGBot.standardTGURL, tgClient: TGClientPrtcl? = nil) {
            self.connection = connection
            self.botId = botId
            self.tgURI = tgURI
            self.tgClient = tgClient
        }
    }
    
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
        let bot = TGBot(connection: config.connection, tgClient: tgClient, tgURI: config.tgURI, botId: config.botId)
        self._bot = bot
        return bot
    }
    
    init(app: Application) {
        self.app = app
    }
    
    public func didBoot(_ application: Application) throws {
        try bot.start()
    }
    
}
