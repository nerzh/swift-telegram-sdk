//
//  File.swift
//
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Logging

actor TGClientActor {
    private var _client: TGClientPrtcl!
    private var telegramApiRequestLimitPerSecond: UInt
    private var lastTime: UInt = UInt(Date().timeIntervalSince1970)
    private var counter: UInt = 0
    
    func canSendRequest() -> Bool {
        if telegramApiRequestLimitPerSecond <= 0 { return true }
        let currentTime: UInt = UInt(Date().timeIntervalSince1970)
        if lastTime < currentTime {
            lastTime = currentTime
            counter = 0
            return true
        }
        return counter < telegramApiRequestLimitPerSecond
    }
    
    func client() async throws -> TGClientPrtcl {
        defer { counter += 1 }
        while !canSendRequest() {
            try await Task.sleep(nanoseconds: 10_000_000)
        }
        return _client
    }
    
    func set(_ client: TGClientPrtcl) {
        self._client = client
    }
    
    init(apiRequestLimit: UInt = 30) {
        self.telegramApiRequestLimitPerSecond = apiRequestLimit
    }
}


public final class TGBot: TGBotPrtcl {
    
    public static let standardTGURL: URL = .init(string: "https://api.telegram.org")!
    @available(*, deprecated, message: "Please use instance property \"log\". This static property doesn't work")
    public static var log = Logger(label: "com.tgbot")
    
    public let connectionType: TGConnectionType
    public let dispatcher: TGDispatcherPrtcl
    public let botId: String
    public let tgURI: URL
    public var tgClient: TGClientPrtcl {
        get async throws {
            try await clientActor.client()
        }
    }
    public let log: Logger
    private var connection: TGConnectionPrtcl
    private var clientActor: TGClientActor
    
    public init(connectionType: TGConnectionType,
                dispatcher: TGDispatcherPrtcl? = nil,
                tgClient: TGClientPrtcl,
                tgURI: URL = TGBot.standardTGURL,
                botId: String,
                apiRequestLimitWebHook: UInt = 30,
                apiRequestLimitLongPolling: UInt = 2,
                log: Logger = .init(label: "com.tgbot")
    ) async throws {
        self.connectionType = connectionType
        switch connectionType {
        case let .longpolling(limit, timeout, allowedUpdates):
            self.connection = try await TGLongPollingConnection(limit: limit,
                                                                timeout: timeout,
                                                                allowedUpdates: allowedUpdates,
                                                                log: log)
            self.clientActor = TGClientActor(apiRequestLimit: apiRequestLimitLongPolling)
        case let .webhook(webHookURL):
            self.connection = try await TGWebHookConnection(webHookURL: webHookURL)
            self.clientActor = TGClientActor(apiRequestLimit: apiRequestLimitWebHook)
        }
        var tgClient = tgClient
        tgClient.log = log
        await clientActor.set(tgClient)
        self.botId = botId
        self.tgURI = tgURI
        if let dispatcher {
            self.dispatcher = dispatcher
        } else {
            self.dispatcher = try await TGDefaultDispatcher(log: log)
        }
        self.log = log
    }
    
    public func getMethodURL(_ methodName: String) -> String {
        "\(tgURI)/bot\(botId)/\(methodName)"
    }
    
    @discardableResult
    public func start() async throws -> Bool {
        try await connection.start(bot: self)
    }
}


