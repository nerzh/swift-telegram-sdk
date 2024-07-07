//
//  main.swift
//  Smoke-AsyncHttpClient-bot-example
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import SmokeOperationsHTTP1Server
import Foundation
import Logging
import NIO
import SmokeHTTP1

do {
    let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
    let initializer = try TelegramPerInvocationContextInitializer(eventLoopGroup: eventLoopGroup)
    let logger = Logger(label: "SmokeServer")
    let traceContext = SmokeInvocationTraceContext()
    let reporting = SmokeServerInvocationReporting(logger: logger, internalRequestId: UUID().uuidString, traceContext: traceContext)
    let context = initializer.getInvocationContext(invocationReporting: reporting)
    
    try await configure(appContext: context)
    
    SmokeHTTP1Server.runAsOperationServer(TelegramPerInvocationContextInitializer.init)
} catch {
    print("Error starting server: \(error)")
}

