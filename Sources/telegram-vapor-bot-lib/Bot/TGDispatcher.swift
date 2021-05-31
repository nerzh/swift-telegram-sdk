//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation

public protocol TGDispatcherPrtcl {

    var bot: TGBot! { get set }
    var handlersGroup: [[TGHandlerPrtcl]] { get set }

    /// The higher level has the highest priority
    func add(_ handler: TGHandlerPrtcl, at level: Int?)
    func remove(_ handler: TGHandlerPrtcl, from level: Int?)
    func process(_ updates: [TGUpdate]) throws
}

public final class TGDispatcher: TGDispatcherPrtcl {

    public weak var bot: TGBot!
    private var processQueue: DispatchQueue = .init(label: "com.telegram-vapor-bot-lib.dispatcher.processQueue",
                                                    qos: .default,
                                                    attributes: .concurrent)

    private var handlerQueue: DispatchQueue = .init(label: "com.telegram-vapor-bot-lib.dispatcher.handlerQueue",
                                                    qos: .default,
                                                    attributes: .concurrent)

    public var handlersGroup: [[TGHandlerPrtcl]] = []
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

    private func add(_ handler: TGHandlerPrtcl, at level: Int) {
        processQueue.async(flags: .barrier) { [weak self] in
            guard let self = self else { return }

            /// add uniq index id
            var handler: TGHandlerPrtcl = handler
            handler.id = self.nextHandlerId

            /// add handler
            var handlerPosition: Int = 0
            if self.handlersGroup.count > level && level >= 0 {
                self.handlersGroup[level].append(handler)
                handlerPosition = self.handlersGroup[level].count - 1
            } else {
                if self.handlersGroup.count > 0 {
                    self.handlersGroup[0].append(handler)
                    handlerPosition = self.handlersGroup[0].count - 1
                } else {
                    self.handlersGroup.append([handler])
                    handlerPosition = 0
                }
            }
            /// add handler to index
            if self.handlersIndex[level] == nil { self.handlersIndex[level] = .init() }
            self.handlersIndex[level]?[handler.id] = handlerPosition
        }
    }

    public func add(_ handler: TGHandlerPrtcl, at level: Int?) {
        add(handler, at: level ?? 0)
    }

    public func remove(_ handler: TGHandlerPrtcl, from level: Int?) {
        processQueue.async(flags: .barrier) { [weak self] in
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

    public func process(_ updates: [TGUpdate]) throws {
        processQueue.async { [weak self] in
            guard let self = self else { return }
            for update in updates {
                do {
                    try self.processByHandler(update)
                } catch {
                    log.critical("TGDispatcher process: \(error.logMessage)")
                }
            }
        }
    }

    func processByHandler(_ update: TGUpdate) throws {
        processQueue.async { [weak self] in
            guard let self = self, let bot = self.bot else { return }
            for i in 1...self.handlersGroup.count {
                for handler in self.handlersGroup[self.handlersGroup.count - i] {
                    if handler.check(update: update) {
                        self.handlerQueue.async {
                            handler.handle(update: update, bot: bot)
                        }
                    }
                }
            }
        }
    }
}


