//
//  PerInvocationContextInitializer.swift
//  Smoke-AsyncHttpClient-bot-example
//
//  Created by Maxim Lanskoy on 06.07.2024.
//

import Foundation
import SmokeOperationsHTTP1Server
import AsyncHTTPClient
import NIO
import Logging

struct TelegramPerInvocationContextInitializer: StandardJSONSmokeServerPerInvocationContextInitializer {
    typealias ContextType = TelegramApplicationContext
    typealias OperationIdentifer = TelegramOperations
    
    let serverName = "TelegramBot"
    let operationsInitializer: OperationsInitializerType = TelegramOperations.addToSmokeServer
    let botActor: TGBotActor

    init(eventLoopGroup: EventLoopGroup) throws {
        var logger = Logger(label: "SwiftTelegramBot")
        logger.logLevel = .debug
        self.botActor = TGBotActor()
    }

    public func getInvocationContext(
        invocationReporting: SmokeServerInvocationReporting<SmokeInvocationTraceContext>) -> TelegramApplicationContext {
        return TelegramApplicationContext(logger: invocationReporting.logger, botActor: self.botActor)
    }

    func onShutdown() throws {
        // shutdown anything before the application closes
    }
}
