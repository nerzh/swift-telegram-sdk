//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Vapor

public final class TGBot {

    public var botId: String
    public var tgURI: URI
    public var tgClient: TGClient

    public static let standardTGURL: URI = .init(string: "https://api.telegram.org")
    private static var _shared: TGBot!
    private static var configured: Bool = false
    private static var handlers: Bool = false


    private init(tgClient: TGClient,
                 tgURI: URI,
                 botId: String
    ) {
        self.botId = botId
        self.tgURI = tgURI
        self.tgClient = tgClient
        Self.configured = true
    }

    public static var shared: TGBot {
        if !configured {
            fatalError("Bot is not configured ! Please call TGBot.configure method before")
        }
        return Self._shared
    }

    public static func configure(botId: String, tgURI: URI = TGBot.standardTGURL, tgClient: TGClient) {
        if configured { return }
        Self._shared = Self.init(tgClient: tgClient, tgURI: tgURI, botId: botId)
    }

    public static func configure(botId: String, tgURI: URI = TGBot.standardTGURL, vaporClient: Vapor.Client) {
        configure(botId: botId, tgURI: tgURI, tgClient: DefaultTGClient(client: vaporClient))
    }

    public func getMethodURL(_ methodName: String) -> String {
        "\(tgURI)/bot\(botId)/\(methodName)"
    }

    public func process() throws {

    }
}


