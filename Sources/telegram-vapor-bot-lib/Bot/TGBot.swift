//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Vapor

public final class TGBot: TGBotPrtcl {

    public var app: Vapor.Application
    public var connection: TGConnectionPrtcl
    public var botId: String
    public var tgURI: URI
    public var tgClient: TGClientPrtcl


    public static let standardTGURL: URI = .init(string: "https://api.telegram.org")
    private static var _shared: TGBot!
    private static var configured: Bool = false

    private init(app: Vapor.Application,
                 connection: TGConnectionPrtcl,
                 tgClient: TGClientPrtcl,
                 tgURI: URI,
                 botId: String
    ) {
        self.app = app
        self.connection = connection
        self.botId = botId
        self.tgURI = tgURI
        self.tgClient = tgClient
        Self.configured = true
    }

    public func start() throws {
        try connection.start()
    }

    public static var shared: TGBot {
        if !configured {
            fatalError("Bot is not configured ! Please call TGBot.configure method before")
        }
        return Self._shared
    }

    public static func configure(app: Vapor.Application, connection: TGConnectionPrtcl, botId: String, tgURI: URI = TGBot.standardTGURL, tgClient: TGClientPrtcl) {
        if configured { return }
        Self._shared = Self.init(app: app, connection: connection, tgClient: tgClient, tgURI: tgURI, botId: botId)
        Self._shared.connection.bot = Self._shared
    }

    public static func configure(app: Vapor.Application, connection: TGConnectionPrtcl, botId: String, tgURI: URI = TGBot.standardTGURL) {
        configure(app: app, connection: connection, botId: botId, tgURI: tgURI, tgClient: DefaultTGClient(client: app.client))
    }

    public func getMethodURL(_ methodName: String) -> String {
        "\(tgURI)/bot\(botId)/\(methodName)"
    }
}


