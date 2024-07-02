//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation

public protocol TGDispatcherPrtcl {
    var handlersGroup: [[TGHandlerPrtcl]] { get set }
    /// The higher level has the highest priority
    func add(_ handler: TGHandlerPrtcl, priority: Int) async
    func add(_ handler: TGHandlerPrtcl) async
    func addBeforeAllCallback(_ callback: @Sendable @escaping ([TGUpdate]) async throws -> Bool)
    func remove(_ handler: TGHandlerPrtcl, from level: Int?) async
    func process(_ updates: [TGUpdate])
}

open class TGDefaultDispatcher: TGDispatcherPrtcl {
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

    required public init() async throws {
        try await handle()
    }
    
    public func handle() async throws {}

    public func add(_ handler: TGHandlerPrtcl, priority level: Int) {
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

    public func add(_ handler: TGHandlerPrtcl) async {
        add(handler, priority: 0)
    }

    public func addBeforeAllCallback(_ callback: @escaping ([TGUpdate]) async throws -> Bool) {
        beforeAllCallback = callback
    }

    public func remove(_ handler: TGHandlerPrtcl, from level: Int?) {
        let level: Level = level ?? 0
        let indexId: IndexId = handler.id
        guard
            let index: [IndexId: Position] = self.handlersIndex[level],
            let position: Position = index[indexId]
        else {
            return
        }
        let positionIndex = position - 1
        if self.handlersGroup[level].count > positionIndex, self.handlersGroup[level][positionIndex].id == handler.id {
            self.handlersGroup[level].remove(at: positionIndex)
            self.handlersIndex[level]?.removeValue(forKey: indexId)
        }
    }
    
    public func process(_ updates: [TGUpdate]) {
        Task.detached {
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
        }
    }
    
    private func processByHandler(_ update: TGUpdate) async throws {
        TGBot.log.debug("\(dump(update))")
        try await withThrowingTaskGroup(of: Void.self, body: { group in
            for i in 1...self.handlersGroup.count {
                for handler in self.handlersGroup[self.handlersGroup.count - i] {
                    if handler.check(update: update) {
                        group.addTask {
                            do {
                                try await handler.handle(update: update)
                            } catch {
                                TGBot.log.error("\(makeError(BotError(error)).localizedDescription)")
                            }
                        }
                    }
                }
            }
            try await group.waitForAll()
        })
    }
}
