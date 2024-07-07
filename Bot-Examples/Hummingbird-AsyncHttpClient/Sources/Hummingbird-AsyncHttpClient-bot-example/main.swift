//
//  main.swift
//  Hummingbird-AsyncHttpClient-bot-example
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//


import SwiftTelegramSdk
import Hummingbird
import Logging

var logger = Logger(label: "SwiftTelegramBot")
logger.logLevel = .debug

let router = Router()
router.middlewares.add(LogRequestsMiddleware(.info))
TelegramController().addRoutes(to: router.group("tgbot"))

let app = Application(router: router)
let botActor: TGBotActor = .init()

try await configure(app)
try await app.runService()
