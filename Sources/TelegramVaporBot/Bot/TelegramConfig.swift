//
//  File.swift
//  
//
//  Created by Giacomo Leopizzi on 13/01/23.
//

import Vapor

extension Telegram {
    
    public struct Configuration {
        
        public enum Connection {
            case longPool(limit: Int? = nil, timeout: Int? = nil, allowedUpdates: [TGUpdate.CodingKeys]? = nil)
            case webhook(uri: URI)
            case custom(TGConnectionPrtcl)
        }
        
        public var connection: Connection
        public var botId: String
        public var tgURI: URI
        public var tgClient: TGClientPrtcl?
        
        public init(connection: Connection, botId: String, tgURI: URI = TGBot.standardTGURL, tgClient: TGClientPrtcl? = nil) {
            self.connection = connection
            self.botId = botId
            self.tgURI = tgURI
            self.tgClient = tgClient
        }
        
    }
    
}
