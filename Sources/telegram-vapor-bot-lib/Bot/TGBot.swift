//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Vapor

public protocol TGBotPrtcl {

    var botId: String { get set }
    var tgURI: URI { get set }
    var tgClient: TGClientPrtcl { get set }
    var connection: TGConnectionPrtcl  { get }

    static var shared: Self { get }

    func start() throws
//    func add(_ handler: TGHandlerPrtcl)
}

public final class TGBot: TGBotPrtcl {

    public var botId: String
    public var tgURI: URI
    public var tgClient: TGClientPrtcl
    public var connection: TGConnectionPrtcl

    public static let standardTGURL: URI = .init(string: "https://api.telegram.org")
    private static var _shared: TGBot!
    private static var configured: Bool = false

    private init(connection: TGConnectionPrtcl,
                 tgClient: TGClientPrtcl,
                 tgURI: URI,
                 botId: String
    ) {
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

    public static func configure(connection: TGConnectionPrtcl, botId: String, tgURI: URI = TGBot.standardTGURL, tgClient: TGClientPrtcl) {
        if configured { return }
        Self._shared = Self.init(connection: connection, tgClient: tgClient, tgURI: tgURI, botId: botId)
    }

    public static func configure(connection: TGConnectionPrtcl, botId: String, tgURI: URI = TGBot.standardTGURL, vaporClient: Vapor.Client) {
        configure(connection: connection, botId: botId, tgURI: tgURI, tgClient: DefaultTGClient(client: vaporClient))
    }

    public func getMethodURL(_ methodName: String) -> String {
        "\(tgURI)/bot\(botId)/\(methodName)"
    }
}


