//
//  main.swift
//  FlyingFox-AsyncHttpClient-bot-example
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import FlyingFox
import Logging
import SwiftTelegramSdk
import Foundation

struct TelegramApplicationContext {
    let logger: Logger
    let botActor: TGBotActor
}

var logger = Logger(label: "SwiftTelegramBot")
logger.logLevel = .debug
let botActor = TGBotActor()
let appContext = TelegramApplicationContext(logger: logger, botActor: botActor)
try await configure(appContext: appContext)
let server = HTTPServer(port: 8080)
try await server.start()
