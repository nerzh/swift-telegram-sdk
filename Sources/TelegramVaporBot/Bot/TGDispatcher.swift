//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation
import Vapor

public protocol TGDispatcherPrtcl {
    
    var bot: TGBotPrtcl { get }
    var handlersGroup: [[TGHandlerPrtcl]] { get set }

    init(bot: TGBotPrtcl)
    /// The higher level has the highest priority
    func add(_ handler: TGHandlerPrtcl, priority: Int)
    func add(_ handler: TGHandlerPrtcl)
    func addBeforeAllCallback(_ callback: @escaping ([TGUpdate], @escaping ([TGUpdate]) throws -> Void) throws -> Void)
    func remove(_ handler: TGHandlerPrtcl, from level: Int?)
    func process(_ updates: [TGUpdate])
    @discardableResult
    func process(_ updates: [TGUpdate]) async throws -> Bool
}

open class TGDefaultDispatcher: TGDispatcherPrtcl {
    
    private var appEventLoop: EventLoop!

    public var bot: TGBotPrtcl
    public var handlersGroup: [[TGHandlerPrtcl]] = []
    private var beforeAllCallback: ([TGUpdate], @escaping ([TGUpdate]) throws -> Void) throws -> Void = { updates, callback in
        try callback(updates)
    }
    private var handlersId: Int = 0
    private var nextHandlerId: Int {
        handlersId += 1
        return handlersId
    }
    private var index: Int = 0

    private typealias Level = Int
    private typealias IndexId = Int
    private typealias Position = Int
    private var handlersIndex: [Level: [IndexId: Position]] = .init()

    required public init(bot: TGBotPrtcl) {
        self.bot = bot
        appEventLoop = bot.app.eventLoopGroup.next()
    }

    public func add(_ handler: TGHandlerPrtcl, priority level: Int) {
        appEventLoop.execute { [weak self] in
            guard let self = self else { return }

            /// add uniq index id
            var handler: TGHandlerPrtcl = handler
            handler.id = self.nextHandlerId

            /// add handler
            var handlerPosition: Int = 0
            let correctLevel: Int = level >= 0 ? level : 0
            if self.handlersGroup.count > correctLevel {
                self.handlersGroup[correctLevel].append(handler)
                handlerPosition = self.handlersGroup[correctLevel].count - 1
            } else {
                self.handlersGroup.append([handler])
                handlerPosition = self.handlersGroup[self.handlersGroup.count - 1].count - 1
            }
            
            /// add handler to index
            if self.handlersIndex[level] == nil { self.handlersIndex[level] = .init() }
            self.handlersIndex[level]?[handler.id] = handlerPosition
        }
    }

    public func add(_ handler: TGHandlerPrtcl) {
        add(handler, priority: 0)
    }

    public func addBeforeAllCallback(_ callback: @escaping ([TGUpdate], @escaping ([TGUpdate]) throws -> Void) throws -> Void) {
        beforeAllCallback = callback
    }

    public func remove(_ handler: TGHandlerPrtcl, from level: Int?) {
        appEventLoop.execute { [weak self] in
            guard let self = self else { return }
            let level: Level = level ?? 0
            let indexId: IndexId = handler.id
            guard
                let index: [IndexId: Position] = self.handlersIndex[level],
                let position: Position = index[indexId]
            else {
                return
            }
            self.handlersGroup[level].remove(at: position)
            self.handlersIndex[level]![indexId] = nil
        }
    }

    public func process(_ updates: [TGUpdate]) {
        bot.app.eventLoopGroup.any().execute { [weak self] in
            guard let self = self else {
                TGBot.log.error("TGDispatcher was deinited")
                return
            }
            do {
                try self.beforeAllCallback(updates) { updates in
                    for update in updates {
                        self.processByHandler(update)
                    }
                }
            } catch {
                TGBot.log.critical("TGDispatcher process: \(error.logMessage)")
            }
        }
    }
    
    @discardableResult
    public func process(_ updates: [TGUpdate]) async throws -> Bool {
        return try await withUnsafeThrowingContinuation { continuation in
            bot.app.eventLoopGroup.any().execute { [weak self] in
                guard let self = self else {
                    TGBot.log.error("TGDispatcher was deinited")
                    continuation.resume(returning: false)
                    return
                }
                do {
                    try self.beforeAllCallback(updates) { updates in
                        for update in updates {
                            self.processByHandler(update)
                        }
                    }
                    continuation.resume(returning: true)
                } catch {
                    TGBot.log.critical("TGDispatcher process: \(error.logMessage)")
                    continuation.resume(returning: false)
                }
            }
        }
    }

    private func processByHandler(_ update: TGUpdate) {
        bot.app.eventLoopGroup.any().execute { [weak self] in
            guard let self = self, self.handlersGroup.count > 0 else {
                if self == nil { TGBot.log.error("TGDispatcher was deinited"); return }
                return
            }
            for i in 1...self.handlersGroup.count {
                for handler in self.handlersGroup[self.handlersGroup.count - i] {
                    if handler.check(update: update) {
                        self.bot.app.eventLoopGroup.any().execute {
                            do {
                                try handler.handle(update: update, bot: self.bot)
                            } catch {
                                TGBot.log.error("\(error.localizedDescription)")
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func processByHandler(_ update: TGUpdate) async {
        bot.app.eventLoopGroup.any().execute { [weak self] in
            guard let self = self, self.handlersGroup.count > 0 else {
                if self == nil { TGBot.log.error("TGDispatcher was deinited"); return }
                return
            }
            for i in 1...self.handlersGroup.count {
                for handler in self.handlersGroup[self.handlersGroup.count - i] {
                    if handler.check(update: update) {
                        self.bot.app.eventLoopGroup.any().execute {
                            Task {
                                try await handler.handle(update: update, bot: self.bot)
                            }
                        }
                    }
                }
            }
        }
    }
}


