//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Vapor

public final class TGBot: TGBotPrtcl {
    
    public let app: Vapor.Application
    public let botId: String
    public let tgURI: URI
    public let tgClient: TGClientPrtcl
    
    public static let standardTGURL: URI = .init(string: "https://api.telegram.org")
    public static var log = Logger(label: "com.tgbot")
    
    public init(app: Vapor.Application,
                tgClient: TGClientPrtcl,
                tgURI: URI = TGBot.standardTGURL,
                botId: String
    ) {
        self.app = app
        self.botId = botId
        self.tgURI = tgURI
        self.tgClient = tgClient
    }
    
    public init(app: Vapor.Application,
                tgURI: URI = TGBot.standardTGURL,
                botId: String
    ) {
        self.app = app
        self.botId = botId
        self.tgURI = tgURI
        self.tgClient = DefaultTGClient(client: app.client)
    }
    
    public func getMethodURL(_ methodName: String) -> String {
        "\(tgURI)/bot\(botId)/\(methodName)"
    }
}


