//
//  main.swift
//  Vapor-telegram-bot-example
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Vapor
import SwiftTelegramSdk

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let eventLoop: EventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount * 4)
let app: Application = try await Application.make(env, Application.EventLoopGroupProvider.shared(eventLoop))
let botActor: TGBotActor = .init()

defer { app.shutdown() }
try await configure(app)
try await app.execute()
