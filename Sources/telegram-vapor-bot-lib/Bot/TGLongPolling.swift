//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 28.05.2021.
//

import Foundation
import Vapor

public class LongPollingConfig {
    public var limit: Int?
    public var timeout: Int? = 10
    public var allowedUpdates: [Update.CodingKeys]?

    public init(limit: Int? = nil, timeout: Int? = nil, allowedUpdates: [Update.CodingKeys]? = nil) {
        self.limit = limit
        self.timeout = timeout
        self.allowedUpdates = allowedUpdates
    }
}

extension TGBot {

    public func longPollingStart(config: LongPollingConfig? = nil) throws {
        let defaultConfig: LongPollingConfig = .init()
        /// delete webhook because: You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.
        let deleteWebHookParams: TGBot.DeleteWebhookParams = .init(dropPendingUpdates: false)
        let future: EventLoopFuture<Bool> = try TGBot.shared.deleteWebhook(params: deleteWebHookParams)

        future.whenComplete { [weak self] response in
            switch response {
            case .success(_):
                break
            case let .failure(error):
                log.critical(error.logMessage)
            }

            do {
                try self?.getUpdates(config: config ?? defaultConfig)
                log.info("LongPolling Start")
            } catch {
                log.critical(error.logMessage)
            }
        }
    }

    private func getUpdates(config: LongPollingConfig) throws {
        let allowedUpdates: [String] = (config.allowedUpdates ?? []).map { $0.rawValue }
        let params: GetUpdatesParams = .init(offset: newOffsetUpdates,
                                             limit: config.limit,
                                             timeout: config.timeout,
                                             allowedUpdates: allowedUpdates)
        try TGBot.shared.getUpdates(params: params).whenComplete { [weak self] response in
            switch response {
            case let .success(updates):
                if let lastUpdate: Update = updates.last {
                    self?.offsetUpdates = lastUpdate.updateId
                }
                for update in updates {
                    self?.longPollingQueue.sync {
                        do {
                            try self?.longPollingProcess(update)
                        } catch {
                            log.critical(error.logMessage)
                        }
                    }
                }
            case let .failure(error):
                log.critical(error.logMessage)
            }
            do {
                try self?.getUpdates(config: config)
            } catch {
                log.critical(error.logMessage)
            }
        }
    }

    private func longPollingProcess(_ update: Update) throws {
        log.info("LONG \(update.message?.text ?? "no text")")
    }
}
