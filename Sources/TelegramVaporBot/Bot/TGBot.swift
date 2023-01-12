//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Vapor

public final class TGBot: TGBotPrtcl {

    public var botId: String
    public var tgURI: URI
    public var tgClient: TGClientPrtcl
    public var connection: TGConnectionPrtcl

    public static let standardTGURL: URI = .init(string: "https://api.telegram.org")
    public static var log = Logger(label: "com.tgbot")

    internal init(connection: TGConnectionPrtcl,
                 tgClient: TGClientPrtcl,
                 tgURI: URI,
                 botId: String
    ) {
        self.connection = connection
        self.botId = botId
        self.tgURI = tgURI
        self.tgClient = tgClient
    }
    
    public func start() throws {
        try connection.start()
    }

    public func getMethodURL(_ methodName: String) -> String {
        "\(tgURI)/bot\(botId)/\(methodName)"
    }
    
}


