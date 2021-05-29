//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation
import Vapor


public protocol TGConnectionPrtcl {

    var dispatcher: TGDispatcherPrtcl { get }

    @discardableResult
    func start() throws -> Bool
}


public final class TGLongPollingConnection: TGConnectionPrtcl {

    public var dispatcher: TGDispatcherPrtcl
    public var limit: Int?
    public var timeout: Int? = 10
    public var allowedUpdates: [Update.CodingKeys]?

    private var offsetUpdates: Int = 0
    private var newOffsetUpdates: Int { offsetUpdates + 1 }

    public init(dispatcher: TGDispatcherPrtcl, limit: Int? = nil, timeout: Int? = nil, allowedUpdates: [Update.CodingKeys]? = nil) {
        self.dispatcher = dispatcher
        self.limit = limit
        self.timeout = timeout
        self.allowedUpdates = allowedUpdates
    }

    @discardableResult
    public func start() throws -> Bool {
        /// delete webhook because: You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.
        let deleteWebHookParams: TGBot.DeleteWebhookParams = .init(dropPendingUpdates: false)
        let future: EventLoopFuture<Bool> = try TGBot.shared.deleteWebhook(params: deleteWebHookParams)
        var result: Bool = false
        future.whenComplete { [weak self] response in
            switch response {
            case .success(_):
                result = true
            case let .failure(error):
                log.critical(error.logMessage)
            }

            do {
                try self?.getUpdates()
                log.info("LongPolling Start")
            } catch {
                log.critical(error.logMessage)
            }
        }
        _ = try future.wait()

        return result
    }

    private func getUpdates() throws {
        let allowedUpdates: [String] = (allowedUpdates ?? []).map { $0.rawValue }
        let params: TGBot.GetUpdatesParams = .init(offset: newOffsetUpdates,
                                                   limit: limit,
                                                   timeout: timeout,
                                                   allowedUpdates: allowedUpdates)
        try TGBot.shared.getUpdates(params: params).whenComplete { [weak self] response in
            switch response {
            case let .success(updates):
                if let lastUpdate: Update = updates.last {
                    self?.offsetUpdates = lastUpdate.updateId
                }
                do {
                    try self?.dispatcher.process(updates)
                } catch {
                    log.critical(error.logMessage)
                }
            case let .failure(error):
                log.critical(error.logMessage)
            }
            do {
                try self?.getUpdates()
            } catch {
                log.critical(error.logMessage)
            }
        }
    }

}


public final class TGWebHookConnection: TGConnectionPrtcl {

    public var dispatcher: TGDispatcherPrtcl
    public var webHookURL: URI

    public init(webHookURL: URI, dispatcher: TGDispatcherPrtcl) {
        self.webHookURL = webHookURL
        self.dispatcher = dispatcher
    }

    @discardableResult
    public func start() throws -> Bool {
        let webHookParams: TGBot.SetWebhookParams = .init(url: webHookURL.path)
        let future: EventLoopFuture<Bool> = try TGBot.shared.setWebhook(params: webHookParams)
        var result: Bool = false
        future.whenComplete { response in
            switch response {
            case .success(_):
                result = true
            case let .failure(error):
                log.critical(error.logMessage)
            }
        }
        _ = try future.wait()

        return result
    }
}
