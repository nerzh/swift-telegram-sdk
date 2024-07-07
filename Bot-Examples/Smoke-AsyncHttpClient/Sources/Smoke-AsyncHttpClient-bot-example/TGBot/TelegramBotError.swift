//
//  TelegramBotError.swift
//  Smoke-AsyncHttpClient-bot-example
//
//  Created by Maxim Lanskoy on 07.07.2024.
//

enum TelegramBotError: Swift.Error, CustomStringConvertible {
    case unknownError
    
    public var description: String {
        switch self {
        case .unknownError:
            return "UnknownError"
        }
    }
}
