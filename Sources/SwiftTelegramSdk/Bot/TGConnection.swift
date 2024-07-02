//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation

public protocol TGConnectionPrtcl {
    @discardableResult
    func start(bot: TGBot) async throws -> Bool
}

public enum TGConnectionType {
    case longpolling(limit: Int?,
                     timeout: Int?,
                     allowedUpdates: [TGUpdate.CodingKeys]?)
    case webhook(webHookURL: URL)
}

public final class TGLongPollingConnection: TGConnectionPrtcl {
    public var limit: Int?
    public var timeout: Int? = 10
    public var allowedUpdates: [TGUpdate.CodingKeys]?
    
    private var offsetUpdates: Int = 0
    private var newOffsetUpdates: Int { offsetUpdates + 1 }
    
    public init(limit: Int? = nil,
                timeout: Int? = nil,
                allowedUpdates: [TGUpdate.CodingKeys]? = nil
    ) async throws {
        self.limit = limit
        self.timeout = timeout ?? self.timeout
        self.allowedUpdates = allowedUpdates
    }
    
    @discardableResult
    public func start(bot: TGBot) async throws -> Bool {
        /// delete webhook because: You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.
        let deleteWebHookParams: TGDeleteWebhookParams = .init(dropPendingUpdates: false)
        try await bot.deleteWebhook(params: deleteWebHookParams)
        Task.detached { [weak self] in
            guard let self = self else { return }
            var cancell: Bool = false
            while !Task.isCancelled && !cancell {
                do {
                    try await Task.sleep(nanoseconds: 1_000_000_000)
                    try await self.getUpdates(bot: bot)
                } catch {
                    TGBot.log.warning("\(BotError(error).localizedDescription)")
                    cancell = true
                }
            }
            try await start(bot: bot)
        }
        
        return true
    }
    
    private func getUpdates(bot: TGBot) async throws {
        let allowedUpdates: [String] = (allowedUpdates ?? []).map { $0.rawValue }
        let params: TGGetUpdatesParams = .init(offset: newOffsetUpdates,
                                               limit: limit,
                                               timeout: timeout,
                                               allowedUpdates: allowedUpdates)
        let response = try await bot.getUpdates(params: params)
        if let lastUpdate: TGUpdate = response.last {
            offsetUpdates = lastUpdate.updateId
        }
        bot.dispatcher.process(response)
    }
}


public final class TGWebHookConnection: TGConnectionPrtcl {
    
    public let webHookURL: URL
    
    public init(webHookURL: URL) async throws {
        self.webHookURL = webHookURL
    }
    
    @discardableResult
    public func start(bot: TGBot) async throws -> Bool {
        let webHookParams: TGSetWebhookParams = .init(url: webHookURL.description)
        return try await bot.setWebhook(params: webHookParams)
    }
}
