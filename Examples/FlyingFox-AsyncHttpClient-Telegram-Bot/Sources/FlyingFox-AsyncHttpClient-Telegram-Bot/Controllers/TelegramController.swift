//
//  TelegramController.swift
//  FlyingFox-AsyncHttpClient-bot-example
//
//  Created by Oleh Hudeichuk on 10.03.2023.
//

import Foundation
import FlyingFox
import SwiftTelegramSdk

final class TelegramController {
    func addRoutes(to group: FlyingFox.HTTPRoute) async {
        await server.appendRoute("/telegramWebHook") { request in
            do {
                let body = try await request.bodyData
                let update = try JSONDecoder().decode(TGUpdate.self, from: body)
                Task {
                    await appContext.botActor.bot.dispatcher.process([update])
                }
            } catch {
                return HTTPResponse(statusCode: .badRequest)
            }
            return HTTPResponse(statusCode: .ok)
        }
    }
}
