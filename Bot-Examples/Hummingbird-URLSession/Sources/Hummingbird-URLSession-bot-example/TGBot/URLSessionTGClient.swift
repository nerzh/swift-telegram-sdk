//
//  URLSessionTGClient.swift
//  Hummingbird-URLSession-bot-example
//
//  Created by Maxim Lanskoy on 06.07.2024.
//

import Logging
import Hummingbird
import SwiftTelegramSdk
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import Foundation

public enum TGHTTPMediaType: String, Equatable {
    case formData
    case json
}

private struct TGEmptyParams: Encodable {}

public final class URLSessionTGClient: TGClientPrtcl {
    
    public typealias HTTPMediaType = SwiftTelegramSdk.HTTPMediaType
    public var log: Logging.Logger = .init(label: "URLSessionTGClient")
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    @discardableResult
    public func post<Params: Encodable, Response: Decodable>(
        _ url: URL,
        params: Params? = nil,
        as mediaType: HTTPMediaType? = nil
    ) async throws -> Response {
        let request = try makeRequest(url: url, params: params, as: mediaType)
        
        #if canImport(FoundationNetworking)
            let (data, response): (Data, URLResponse) = await withCheckedContinuation { continuation in
                URLSession.shared.dataTask(with: request) { data, response, _ in
                    guard let data = data, let response = response else {
                        fatalError()
                    }
                    continuation.resume(returning: (data, response))
                }.resume()
            }
        #else
            let (data, response) = try await session.data(for: request)
        #endif
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw BotError(type: .network, reason: "Invalid response from server")
        }
        
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
    ) throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
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
            request.setValue("multipart/form-data; boundary=\(rawMultipart.boundary)", forHTTPHeaderField: "Content-Type")
            request.httpBody = rawMultipart.body as Data
        } else {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let encodable: Encodable = params ?? TGEmptyParams()
            let data = try JSONEncoder().encode(encodable)
            request.httpBody = data
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
            log.error(error.logMessage)
            throw error
        }
        
        guard let result = container.result else {
            let error = BotError(
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
        log.trace(logString.logMessage)
        return result
    }
}
