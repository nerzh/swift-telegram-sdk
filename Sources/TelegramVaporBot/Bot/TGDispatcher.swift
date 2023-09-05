//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation
import Vapor

public protocol TGDispatcherPrtcl {
    
    var bot: TGBot { get }
    var handlersGroup: [[TGHandlerPrtcl]] { get set }

    init(bot: TGBot) async throws
    /// The higher level has the highest priority
    func add(_ handler: TGHandlerPrtcl, priority: Int) async
    func add(_ handler: TGHandlerPrtcl) async
    func addBeforeAllCallback(_ callback: @Sendable @escaping ([TGUpdate]) async throws -> Bool)
    func remove(_ handler: TGHandlerPrtcl, from level: Int?) async
    @discardableResult
    func process(_ updates: [TGUpdate]) async throws -> Bool
}

open class TGDefaultDispatcher: TGDispatcherPrtcl {
    
    private var eventLoopGroup: EventLoopGroup!

    public var bot: TGBot
    public var handlersGroup: [[TGHandlerPrtcl]] = []
    private var beforeAllCallback: ([TGUpdate]) async throws -> Bool = { _ in true }
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

    required public init(bot: TGBot) async throws {
        self.bot = bot
        eventLoopGroup = bot.app.eventLoopGroup
    }

    public func add(_ handler: TGHandlerPrtcl, priority level: Int) async {
        return await withCheckedContinuation { continuation in
            eventLoopGroup.any().execute { [weak self] in
                guard let self = self else { continuation.resume(); return }
                
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
                continuation.resume();
            }
        }
    }

    public func add(_ handler: TGHandlerPrtcl) async {
        await add(handler, priority: 0)
    }

    public func addBeforeAllCallback(_ callback: @escaping ([TGUpdate]) async throws -> Bool) {
        beforeAllCallback = callback
    }

    public func remove(_ handler: TGHandlerPrtcl, from level: Int?) async {
        return await withCheckedContinuation { continuation in
            eventLoopGroup.any().execute { [weak self] in
                guard let self = self else { continuation.resume(); return }
                let level: Level = level ?? 0
                let indexId: IndexId = handler.id
                guard
                    let index: [IndexId: Position] = self.handlersIndex[level],
                    let position: Position = index[indexId]
                else {
                    continuation.resume()
                    return
                }
                self.handlersGroup[level].remove(at: position)
                self.handlersIndex[level]![indexId] = nil
                continuation.resume()
            }
        }
    }
    
    @discardableResult
    public func process(_ updates: [TGUpdate]) async throws -> Bool {
        return try await withCheckedThrowingContinuation { continuation in
            bot.app.eventLoopGroup.any().execute { [weak self] in
                guard let self = self else {
                    TGBot.log.error("TGDispatcher was deinited")
                    continuation.resume(returning: false)
                    return
                }
                
                Task.detached {
                    do {
                        let allowNext: Bool = try await self.beforeAllCallback(updates)
                        if allowNext {
                            try await withThrowingTaskGroup(of: Void.self, body: { group in
                                for update in updates {
                                    group.addTask {
                                        do {
                                            try await self.processByHandler(update)
                                        } catch {
                                            TGBot.log.error("\(makeError(BotError(error)).localizedDescription)")
                                        }
                                    }
                                }
                                try await group.waitForAll()
                            })
                        }
                        continuation.resume(returning: true)
                    } catch {
                        TGBot.log.critical("TGDispatcher process: \(error.logMessage)")
                        continuation.resume(returning: false)
                    }
                }
            }
        }
    }
    
    private func processByHandler(_ update: TGUpdate) async throws {
        TGBot.log.debug("\(dump(update))")
        return try await withCheckedThrowingContinuation { continuation in
            bot.app.eventLoopGroup.any().execute { [weak self] in
                guard let self = self, self.handlersGroup.count > 0 else {
                    if self == nil { TGBot.log.error("TGDispatcher was deinited"); continuation.resume(); return }
                    continuation.resume()
                    return
                }
                Task.detached {
                    do {
                        try await withThrowingTaskGroup(of: Void.self, body: { group in
                            for i in 1...self.handlersGroup.count {
                                for handler in self.handlersGroup[self.handlersGroup.count - i] {
                                    if handler.check(update: update) {
                                        group.addTask {
                                            do {
                                                try await handler.handle(update: update, bot: self.bot)
                                            } catch {
                                                TGBot.log.error("\(makeError(BotError(error)).localizedDescription)")
                                            }
                                        }
                                    }
                                }
                            }
                            try await group.waitForAll()
                        })
                        continuation.resume()
                    } catch {
                        continuation.resume(throwing: makeError(BotError(error)))
                    }
                }
            }
        }
    }
}
