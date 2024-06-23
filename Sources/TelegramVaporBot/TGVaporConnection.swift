//
//  TGVaporConnection.swift
//  
//
//  Created by Yakov Shapovalov on 30.06.2024.
//

import TelegramBotKit
import Vapor

public final class TGVaporLongPollingConnection: TGVaporLongPollingConnectionPrtcl {

    public let bot: TGBot
    public let dispatcher: TGDispatcher
    public var limit: Int?
    public var timeout: Int? = 10
    public var allowedUpdates: [TGUpdate.CodingKeys]?

    private var offsetUpdates: Int = 0
    private var newOffsetUpdates: Int { offsetUpdates + 1 }

    public init(bot: TGBot,
                dispatcher: TGDispatcher.Type = TGDispatcher.self,
                limit: Int? = nil,
                timeout: Int? = nil,
                allowedUpdates: [TGUpdate.CodingKeys]? = nil
    ) async throws {
        self.bot = bot
        self.dispatcher = try await dispatcher.init(bot: bot)
        self.limit = limit
        self.timeout = timeout ?? self.timeout
        self.allowedUpdates = allowedUpdates
    }

    @discardableResult
    public func start() async throws -> Bool {
        /// delete webhook because: You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.
        let deleteWebHookParams: TGDeleteWebhookParams = .init(dropPendingUpdates: false)
        try await bot.deleteWebhook(params: deleteWebHookParams)
        Task.detached { [weak self] in
            guard let self = self else { return }
            while !Task.isCancelled {
                try await Task.sleep(nanoseconds: 100)
                try await self.getUpdates()
            }
        }

        return true
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
    }
}


public final class TGVaporWebHookConnection: TGVaporWebHookConnectionPrtcl {

    public let bot: TGBot
    public let dispatcher: TGDispatcher
    public let webHookURL: TGURI

    public init(bot: TGBot, webHookURL: URI, dispatcher: TGDispatcher.Type = TGDispatcher.self) async throws {
        self.bot = bot
        self.webHookURL = webHookURL
        self.dispatcher = try await dispatcher.init(bot: bot)
    }

    @discardableResult
    public func start() async throws -> Bool {
        let webHookParams: TGSetWebhookParams = .init(url: webHookURL.description)
        return try await bot.setWebhook(params: webHookParams)
    }
}
