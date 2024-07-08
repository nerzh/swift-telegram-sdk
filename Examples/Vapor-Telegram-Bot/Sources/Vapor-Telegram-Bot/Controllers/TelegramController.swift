//
//  TelegramController.swift
//  Vapor-telegram-bot-example
//
//  Created by Oleh Hudeichuk on 10.03.2023.
//

import Foundation
import Vapor
import SwiftTelegramSdk

final class TelegramController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.post("telegramWebHook", use: telegramWebHook)
    }
}

extension TelegramController {
    
    func telegramWebHook(_ req: Request) async throws -> Bool {
        let update: TGUpdate = try req.content.decode(TGUpdate.self)
        Task.detached {
            do {
                try await botActor.bot.dispatcher.process([update])
            } catch {
                await botActor.bot.log.error("\(makeError(BotError(error)).localizedDescription)")
            }
        }
        return true
    }
}
