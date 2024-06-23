//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import TelegramBotKit
import Vapor

public final class TGVaporBot: TGVaporBotPrtcl {

    public typealias TGClient = TGVaporClient

    public let app: Vapor.Application
    public let botId: String
    public let tgURI: URI
    public let tgClient: TGClient

    public static let standardTGURL: URI = .init(string: "https://api.telegram.org")
    public static var log = Logger(label: "com.tgbot")
    
    public init(app: Vapor.Application,
                tgClient: TGClient,
                tgURI: URI = standardTGURL,
                botId: String
    ) {
        self.app = app
        self.botId = botId
        self.tgURI = tgURI
        self.tgClient = tgClient
    }
    
    public init(app: Vapor.Application,
                tgURI: URI = standardTGURL,
                botId: String
    ) {
        self.app = app
        self.botId = botId
        self.tgURI = tgURI
        self.tgClient = TGVaporClient(client: app.client)
    }
    
    public func getMethodURL(_ methodName: String) -> String {
        "\(tgURI)/bot\(botId)/\(methodName)"
    }
}


