//
//  AsyncHttpTGClient.swift
//  Hummingbird-AsyncHttpClient-bot-example
//
//  Created by Maxim Lanskoy on 06.07.2024.
//

import Logging
import Foundation
import Hummingbird
import AsyncHTTPClient
import SwiftTelegramSdk

public enum TGHTTPMediaType: String, Equatable {
    case formData
    case json
}

private struct TGEmptyParams: Encodable {}

public final class AsyncHttpTGClient: TGClientPrtcl {
    
    public typealias HTTPMediaType = SwiftTelegramSdk.HTTPMediaType
    public var log: Logger = .init(label: "AsyncHttpTGClient")
    private let client: HTTPClient
    
    public init(client: HTTPClient = .shared) {
        self.client = client
    }
    
    @discardableResult
    public func post<Params: Encodable, Response: Decodable>(
        _ url: URL,
        params: Params? = nil,
        as mediaType: HTTPMediaType? = nil
    ) async throws -> Response {
        let request = try makeRequest(url: url, params: params, as: mediaType)
        let clientResponse = try await client.execute(request, timeout: .seconds(30))
        
        guard clientResponse.status == .ok else {
            throw BotError(type: .network, reason: "Invalid response status: \(clientResponse.status)")
        }
        
        let data = try await clientResponse.body.collect(upTo: 1024 * 1024) // 1 MB limit
        let telegramContainer: TGTelegramContainer<Response> = try JSONDecoder().decode(TGTelegramContainer<Response>.self, from: data)
        return try processContainer(telegramContainer)
    }
    
    @discardableResult
    public func post<Response: Decodable>(_ url: URL) async throws -> Response {
        try await post(url, params: TGEmptyParams(), as: nil)
    }
    
    private func makeRequest<Params: Encodable>(
        url: URL,
        params: Params?,
        as mediaType: HTTPMediaType?
    ) throws -> HTTPClientRequest {
        var request: HTTPClientRequest = HTTPClientRequest(url: url.absoluteString)
        request.method = .POST
        
        if mediaType == .formData || mediaType == nil {
            var rawMultipart: (body: NSMutableData, boundary: String)!
            do {
                if let currentParams = params {
                    rawMultipart = try currentParams.toMultiPartFormData(log: log)
                } else {
                    rawMultipart = try TGEmptyParams().toMultiPartFormData(log: log)
                }
            } catch {
                log.critical("Post request error: \(error.localizedDescription)")
                throw error
            }
            request.headers.add(name: "Content-Type", value: "multipart/form-data; boundary=\(rawMultipart.boundary)")
            request.body = .bytes(rawMultipart.body as Data)
        } else {
            request.headers.add(name: "Content-Type", value: "application/json")
            let encoded: Encodable = params ?? TGEmptyParams()
            let data = try JSONEncoder().encode(encoded)
            request.body = .bytes(data)
        }
        
        return request
    }
    
    private func processContainer<T: Decodable>(_ container: TGTelegramContainer<T>) throws -> T {
        guard container.ok else {
            let desc = """
            Response marked as `not Ok`, it seems something wrong with request
            Code: \(container.errorCode ?? -1)
            \(container.description ?? "Empty")
            """
            let error = BotError(
                type: .server,
                description: desc
            )
            log.error("\(error)")
            throw error
        }
        
        guard let result = container.result else {
            let error = BotError(
                type: .server,
                reason: "Response marked as `Ok`, but doesn't contain `result` field."
            )
            log.error("\(error)")
            throw error
        }
        
        let logString = """
        Response:
        Code: \(container.errorCode ?? 0)
        Status OK: \(container.ok)
        Description: \(container.description ?? "Empty")
        """
        log.trace("\(logString)")
        return result
    }
}
