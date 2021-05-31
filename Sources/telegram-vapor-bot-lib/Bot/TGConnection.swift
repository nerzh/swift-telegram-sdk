//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation
import Vapor


public protocol TGConnectionPrtcl {

    var bot: TGBot! { get set }
    var dispatcher: TGDispatcherPrtcl { get }

    @discardableResult
    func start() throws -> Bool
}


public final class TGLongPollingConnection: TGConnectionPrtcl {

    public weak var bot: TGBot! {
        get { _bot }
        set {
            _bot = newValue
            dispatcher.bot = newValue
        }
    }
    public var dispatcher: TGDispatcherPrtcl
    public var limit: Int?
    public var timeout: Int? = 10
    public var allowedUpdates: [TGUpdate.CodingKeys]?

    private var _bot: TGBot!
    private var offsetUpdates: Int = 0
    private var newOffsetUpdates: Int { offsetUpdates + 1 }

    public init(dispatcher: TGDispatcherPrtcl, limit: Int? = nil, timeout: Int? = nil, allowedUpdates: [TGUpdate.CodingKeys]? = nil) {
        self.dispatcher = dispatcher
        self.limit = limit
        self.timeout = timeout
        self.allowedUpdates = allowedUpdates
    }

    public init(limit: Int? = nil, timeout: Int? = nil, allowedUpdates: [TGUpdate.CodingKeys]? = nil) {
        self.dispatcher = TGDispatcher()
        self.limit = limit
        self.timeout = timeout
        self.allowedUpdates = allowedUpdates
    }

    @discardableResult
    public func start() throws -> Bool {
        /// delete webhook because: You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.
        let deleteWebHookParams: TGDeleteWebhookParams = .init(dropPendingUpdates: false)
        let future: EventLoopFuture<Bool> = try bot.deleteWebhook(params: deleteWebHookParams)
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
        let params: TGGetUpdatesParams = .init(offset: newOffsetUpdates,
                                                   limit: limit,
                                                   timeout: timeout,
                                                   allowedUpdates: allowedUpdates)
        try bot.getUpdates(params: params).whenComplete { [weak self] response in
            switch response {
            case let .success(updates):
                if let lastUpdate: TGUpdate = updates.last {
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

    public weak var bot: TGBot!
    public var dispatcher: TGDispatcherPrtcl
    public var webHookURL: URI

    public init(webHookURL: URI, dispatcher: TGDispatcherPrtcl) {
        self.webHookURL = webHookURL
        self.dispatcher = dispatcher
    }

    public init(webHookURL: URI) {
        self.webHookURL = webHookURL
        self.dispatcher = TGDispatcher()
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
                log.critical(error.logMessage)
            }
        }
        _ = try future.wait()

        return result
    }
}
