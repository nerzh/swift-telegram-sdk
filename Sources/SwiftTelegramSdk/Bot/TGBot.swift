//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Logging

public final class TGBot: TGBotPrtcl {
    
    
    public let connectionType: TGConnectionType
    public let dispatcher: TGDispatcherPrtcl
    public let botId: String
    public let tgURI: URL
    public let tgClient: TGClientPrtcl
    
    public static let standardTGURL: URL = .init(string: "https://api.telegram.org")!
    public static var log = Logger(label: "com.tgbot")
    
    private var connection: TGConnectionPrtcl
    
    public init(connectionType: TGConnectionType,
                dispatcher: TGDispatcherPrtcl? = nil,
                tgClient: TGClientPrtcl,
                tgURI: URL = TGBot.standardTGURL,
                botId: String
    ) async throws {
        self.connectionType = connectionType
        switch connectionType {
        case let .longpolling(limit, timeout, allowedUpdates):
            self.connection = try await TGLongPollingConnection(limit: limit,
                                                      timeout: timeout,
                                                      allowedUpdates: allowedUpdates)
        case let .webhook(webHookURL):
            self.connection = try await TGWebHookConnection(webHookURL: webHookURL)
        }
        self.tgClient = tgClient
        self.botId = botId
        self.tgURI = tgURI
        if let dispatcher {
            self.dispatcher = dispatcher
        } else {
            self.dispatcher = try await TGDefaultDispatcher()
        }
    }
    
    public func getMethodURL(_ methodName: String) -> String {
        "\(tgURI)/bot\(botId)/\(methodName)"
    }
    
    @discardableResult
    public func start() async throws -> Bool {
        try await connection.start(bot: self)
    }
}


