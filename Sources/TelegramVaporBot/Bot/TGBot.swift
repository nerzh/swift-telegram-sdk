//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Vapor

public final class TGBot: TGBotPrtcl {
    
    public let botId: String
    public let tgURI: URI
    public let tgClient: TGClientPrtcl
    
    public static let standardTGURL: URI = .init(string: "https://api.telegram.org")
    public static var log = Logger(label: "com.tgbot")
    
    public init(tgClient: TGClientPrtcl,
                tgURI: URI = TGBot.standardTGURL,
                botId: String
    ) {
        self.botId = botId
        self.tgURI = tgURI
        self.tgClient = tgClient
    }
    
    public init(vaporClient: Vapor.Client,
                tgURI: URI = TGBot.standardTGURL,
                botId: String
    ) {
        self.botId = botId
        self.tgURI = tgURI
        self.tgClient = DefaultTGClient(client: vaporClient)
    }
    
    public func getMethodURL(_ methodName: String) -> String {
        "\(tgURI)/bot\(botId)/\(methodName)"
    }
}


