//
//  TGVaporDispatcher.swift
//  
//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import TelegramBotKit


public final class TGVaporDispatcher: TGVaporDispatcherPrtcl {

    public var bot: TGBot
    public var handlersGroup: [[TGHandlerPrtcl]] = []
    public var beforeAllCallback: ([TGUpdate]) async throws -> Bool = { _ in true }
    public var handlersId: Int = 0
    private var nextHandlerId: Int {
        handlersId += 1
        return handlersId
    }
    public var index: Int = 0

    public var handlersIndex: [Level: [IndexId: Position]] = .init()

    required public init(bot: TGBot) async throws {
        self.bot = bot
        try await handle()
    }
    
    func handle() async throws {}

}
