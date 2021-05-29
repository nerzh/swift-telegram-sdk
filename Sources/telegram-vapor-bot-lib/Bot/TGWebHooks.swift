//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 28.05.2021.
//

import Foundation
import Vapor

extension TGBot {

    @discardableResult
    public func webHooksStartAndWait(on url: URI) throws -> Bool {
        let webHookParams: TGBot.SetWebhookParams = .init(url: url.path)
        let future: EventLoopFuture<Bool> = try TGBot.shared.setWebhook(params: webHookParams)
        var result: Bool = false
        future.whenComplete { response in
            switch response {
            case let .success(value):
                result = value
            case let .failure(value):
                log.critical("\(value.localizedDescription)")
            }
        }
        _ = try future.wait()

        return result
    }

    @discardableResult
    public func webHooksStart(on url: URI) throws -> EventLoopFuture<Bool> {
        let webHookParams: TGBot.SetWebhookParams = .init(url: url.path)
        return try TGBot.shared.setWebhook(params: webHookParams)
    }

    public func webHookProcess(_ update: Update) throws {

    }

    public func webHookProcess(_ data: Data) throws {
        try webHookProcess(JSONDecoder().decode(Update.self, from: data))
    }
}

