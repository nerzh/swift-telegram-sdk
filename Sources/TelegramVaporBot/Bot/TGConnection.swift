//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation
import Vapor


public protocol TGConnectionPrtcl {
    
    var bot: TGBotPrtcl { get }
    var dispatcher: TGDispatcherPrtcl { get }
    
    @discardableResult
    func start() throws -> Bool
    
    @discardableResult
    func start() async throws -> Bool
}


public final class TGLongPollingConnection: TGConnectionPrtcl {
    
    public let bot: TGBotPrtcl
    public let dispatcher: TGDispatcherPrtcl
    public var handlersGroup: [[TGHandlerPrtcl]] = []
    public var limit: Int?
    public var timeout: Int? = 15
    public var allowedUpdates: [TGUpdate.CodingKeys]?
    
    private var offsetUpdates: Int = 0
    private var newOffsetUpdates: Int { offsetUpdates + 1 }
    
    public init(bot: TGBotPrtcl,
                dispatcher: TGDispatcherPrtcl.Type = TGDefaultDispatcher.self,
                limit: Int? = nil,
                timeout: Int? = nil,
                allowedUpdates: [TGUpdate.CodingKeys]? = nil
    ) {
        self.bot = bot
        self.dispatcher = dispatcher.init(bot: bot)
        self.limit = limit
        self.timeout = timeout ?? self.timeout
        self.allowedUpdates = allowedUpdates
    }
    
    @discardableResult
    public func start() throws -> Bool {
        /// delete webhook because: You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.
        let deleteWebHookParams: TGDeleteWebhookParams = .init(dropPendingUpdates: false)
        let future: EventLoopFuture<Bool> = try bot.deleteWebhook(params: deleteWebHookParams)
        var result: Bool = false
        future.whenComplete { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(_):
                result = true
            case let .failure(error):
                TGBot.log.critical(error.logMessage)
            }
            
            do {
                try self.getUpdates()
                TGBot.log.info("LongPolling Start")
            } catch {
                TGBot.log.critical(error.logMessage)
            }
        }
        _ = try future.wait()
        
        return result
    }
    
    @discardableResult
    public func start() async throws -> Bool {
        /// delete webhook because: You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.
        let deleteWebHookParams: TGDeleteWebhookParams = .init(dropPendingUpdates: false)
        try await bot.deleteWebhook(params: deleteWebHookParams)
        Task.detached { [weak self] in
            guard let self = self else { return }
            try await self.getUpdates()
        }
        
        return true
    }
    
    private func getUpdates() throws {
        let allowedUpdates: [String] = (allowedUpdates ?? []).map { $0.rawValue }
        let params: TGGetUpdatesParams = .init(offset: newOffsetUpdates,
                                               limit: limit,
                                               timeout: timeout,
                                               allowedUpdates: allowedUpdates)
        try bot.getUpdates(params: params).whenComplete { [weak self] response in
            guard let self = self else { return }
            switch response {
            case let .success(updates):
                if let lastUpdate: TGUpdate = updates.last {
                    self.offsetUpdates = lastUpdate.updateId
                }
                do {
                    try self.dispatcher.process(updates)
                } catch {
                    TGBot.log.critical(error.logMessage)
                }
            case let .failure(error):
                TGBot.log.critical(error.logMessage)
            }
            do {
                try self.getUpdates()
            } catch {
                TGBot.log.critical(error.logMessage)
            }
        }
    }
    
    private func getUpdates() async throws {
        let allowedUpdates: [String] = (allowedUpdates ?? []).map { $0.rawValue }
        let params: TGGetUpdatesParams = .init(offset: newOffsetUpdates,
                                               limit: limit,
                                               timeout: timeout,
                                               allowedUpdates: allowedUpdates)
        let response = try await bot.getUpdates(params: params)
        if let lastUpdate: TGUpdate = response.last {
            offsetUpdates = lastUpdate.updateId
        }
        try await dispatcher.process(response)
        try await getUpdates()
    }
}


public final class TGWebHookConnection: TGConnectionPrtcl {
    
    public let bot: TGBotPrtcl
    public let dispatcher: TGDispatcherPrtcl
    public let webHookURL: URI
    
    public init(bot: TGBotPrtcl, webHookURL: URI, dispatcher: TGDispatcherPrtcl.Type = TGDefaultDispatcher.self) {
        self.bot = bot
        self.webHookURL = webHookURL
        self.dispatcher = dispatcher.init(bot: bot)
    }
    
    @discardableResult
    public func start() throws -> Bool {
        let webHookParams: TGSetWebhookParams = .init(url: webHookURL.description)
        let future: EventLoopFuture<Bool> = try bot.setWebhook(params: webHookParams)
        var result: Bool = false
        future.whenComplete { response in
            switch response {
            case .success(_):
                result = true
            case let .failure(error):
                TGBot.log.critical(error.logMessage)
            }
        }
        _ = try future.wait()
        
        return result
    }
    
    @discardableResult
    public func start() async throws -> Bool {
        let webHookParams: TGSetWebhookParams = .init(url: webHookURL.description)
        return try await bot.setWebhook(params: webHookParams)
    }
}
