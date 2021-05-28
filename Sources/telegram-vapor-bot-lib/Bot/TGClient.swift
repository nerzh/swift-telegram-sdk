//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Vapor

public enum TGHTTPMediaType: String, Equatable {
    case formData
    case json
}

private struct TGEmptyParams: Encodable {}

public protocol TGClient {

    @discardableResult
    func get<Params: Encodable, Response: Codable>(_ url: URI, params: Params, as mediaType: Vapor.HTTPMediaType?) -> EventLoopFuture<Response>

    @discardableResult
    func get<Params: Encodable, Response: Codable>(_ url: URI, params: Params) -> EventLoopFuture<Response>

    @discardableResult
    func get<Response: Codable>(_ url: URI) -> EventLoopFuture<Response>

    @discardableResult
    func post<Params: Encodable, Response: Codable>(_ url: URI, params: Params, as mediaType: Vapor.HTTPMediaType?) -> EventLoopFuture<Response>

    @discardableResult
    func post<Params: Encodable, Response: Codable>(_ url: URI, params: Params) -> EventLoopFuture<Response>

    @discardableResult
    func post<Response: Codable>(_ url: URI) -> EventLoopFuture<Response>
}

public final class DefaultTGClient: TGClient {
    
    private let client: Vapor.Client

    public init(client: Vapor.Client) {
        self.client = client
    }

    @discardableResult
    public func get<Params: Encodable, Response: Codable>
    (
        _ url: URI,
        params: Params,
        as mediaType: Vapor.HTTPMediaType? = nil
    ) -> EventLoopFuture<Response> {
        client.get(url, headers: HTTPHeaders()) { clientRequest in
            try clientRequest.content.encode(params, as: mediaType ?? .formData)
        }.flatMapThrowing { (clientResponse) throws -> TelegramContainer<Response> in
            try clientResponse.content.decode(TelegramContainer<Response>.self)
        }.flatMapThrowing { [self] telegramContainer in
            try processContainer(telegramContainer)
        }
    }

    @discardableResult
    public func get<Params: Encodable, Response: Codable>(_ url: URI, params: Params) -> EventLoopFuture<Response> {
        self.get(url, params: params, as: nil)
    }

    @discardableResult
    public func get<Response: Codable>(_ url: URI) -> EventLoopFuture<Response> {
        self.get(url, params: TGEmptyParams())
    }

    @discardableResult
    public func post<Params: Encodable, Response: Codable>
    (
        _ url: URI,
        params: Params,
        as mediaType: Vapor.HTTPMediaType? = nil
    ) -> EventLoopFuture<Response> {
        client.post(url, headers: HTTPHeaders()) { clientRequest in
            try clientRequest.content.encode(params, as: mediaType ?? .formData)
        }.flatMapThrowing { (clientResponse) throws -> TelegramContainer<Response> in
            try clientResponse.content.decode(TelegramContainer<Response>.self)
        }.flatMapThrowing { [self] telegramContainer in
            try processContainer(telegramContainer)
        }
    }

    @discardableResult
    public func post<Params: Encodable, Response: Codable>(_ url: URI, params: Params) -> EventLoopFuture<Response> {
        self.post(url, params: params, as: nil)
    }

    @discardableResult
    public func post<Response: Codable>(_ url: URI) -> EventLoopFuture<Response> {
        self.post(url, params: TGEmptyParams())
    }

    private func processContainer<T: Codable>(_ container: TelegramContainer<T>) throws -> T {
        guard container.ok else {
            let desc = """
            Response marked as `not Ok`, it seems something wrong with request
            Code: \(container.errorCode ?? -1)
            \(container.description ?? "Empty")
            """
            let error = CoreError(
                type: .server,
                description: desc
            )
            log.error(error.logMessage)
            throw error
        }

        guard let result = container.result else {
            let error = CoreError(
                type: .server,
                reason: "Response marked as `Ok`, but doesn't contain `result` field."
            )
            log.error(error.logMessage)
            throw error
        }

        let logString = """

        Response:
        Code: \(container.errorCode ?? 0)
        Status OK: \(container.ok)
        Description: \(container.description ?? "Empty")

        """
        log.info(logString.logMessage)
        return result
    }
}
