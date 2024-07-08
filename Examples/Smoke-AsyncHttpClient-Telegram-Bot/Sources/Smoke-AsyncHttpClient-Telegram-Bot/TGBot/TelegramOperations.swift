//
//  TelegramOperations.swift
//  Smoke-AsyncHttpClient-bot-example
//
//  Created by Maxim Lanskoy on 06.07.2024.
//

import SmokeOperationsHTTP1
import SmokeOperations
import SwiftTelegramSdk

enum TelegramOperations: String, Hashable, CustomStringConvertible, OperationIdentity {
    case telegramWebHook = "TelegramWebHook"

    public var description: String {
        return rawValue
    }

    public var operationPath: String {
        switch self {
        case .telegramWebHook:
            return "/telegramWebHook"
        }
    }
}

extension TelegramOperations {
    static func addToSmokeServer<SelectorType: SmokeHTTP1HandlerSelector>(selector: inout SelectorType)
            where SelectorType.ContextType == TelegramApplicationContext,
                  SelectorType.OperationIdentifer == TelegramOperations {
        let allowedErrors: [(TelegramBotError, Int)] = []
        selector.addHandlerForOperationProvider(.telegramWebHook, httpMethod: .POST,
                                                operationProvider: { context in
            return { input in
                try TelegramController.telegramWebHookHandler(input: input, context: context)
            }
        }, allowedErrors: allowedErrors)
    }
}
