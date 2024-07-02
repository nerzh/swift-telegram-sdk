//
//  VaporTGClient.swift
//
//
//  Created by O. Hudeichuk on 01.07.2024.
//

import Foundation
import Vapor
import SwiftTelegramSdk

public enum TGHTTPMediaType: String, Equatable {
    case formData
    case json
}

private struct TGEmptyParams: Encodable {}

public final class VaporTGClient: TGClientPrtcl {
    
    public typealias HTTPMediaType = SwiftTelegramSdk.HTTPMediaType
    public var log: Logging.Logger = .init(label: "VaporTGClient")
    private let client: Vapor.Client
    
    public init(client: Vapor.Client) {
        self.client = client
    }
    
    @discardableResult
    public func get<Params: Encodable, Response: Decodable>
    (
        _ url: URL,
        params: Params? = nil,
        as mediaType: HTTPMediaType? = nil
    ) async throws -> Response {
        let clientResponse: ClientResponse = try await client.get(URI(string: url.absoluteString), headers: HTTPHeaders()) { clientRequest in
            if mediaType == .formData || mediaType == nil {
                #warning("THIS CODE FOR FAST FIX, BECAUSE https://github.com/vapor/multipart-kit/issues/63 not accepted yet")
                var rawMultipart: (body: NSMutableData, boundary: String)!
                do {
                    /// Content-Disposition: form-data; name="nested_object"
                    ///
                    /// { json string }
                    rawMultipart = try (params ?? (TGEmptyParams() as! Params)).toMultiPartFormData(log: log)
                } catch {
                    log.critical(error.logMessage)
                }
                clientRequest.headers.add(name: "Content-Type", value: "multipart/form-data; boundary=\(rawMultipart.boundary)")
                let buffer = ByteBuffer.init(data: rawMultipart.body as Data)
                clientRequest.body = buffer
            } else {
                let mediaType: Vapor.HTTPMediaType = if let mediaType {
                    .init(type: mediaType.type, subType: mediaType.subType, parameters: mediaType.parameters)
                } else {
                    .json
                }
                if let currentParams: Params = params {
                    try clientRequest.content.encode(currentParams, as: mediaType)
                } else {
                    try clientRequest.content.encode(TGEmptyParams(), as: mediaType)
                }
            }
        }
        let telegramContainer: TGTelegramContainer = try clientResponse.content.decode(TGTelegramContainer<Response>.self)
        return try processContainer(telegramContainer)
    }
    
    @discardableResult
    public func get<Response: Decodable>(_ url: URL) async throws -> Response {
        try await get(url, params: TGEmptyParams(), as: nil)
    }
    
    @discardableResult
    public func get<Response: Decodable>(_ url: URL, as mediaType: HTTPMediaType) async throws -> Response {
        try await get(url, params: TGEmptyParams(), as: mediaType)
    }
    
    @discardableResult
    public func post<Params: Encodable, Response: Decodable>
    (
        _ url: URL,
        params: Params? = nil,
        as mediaType: HTTPMediaType? = nil
    ) async throws -> Response {
        let clientResponse: ClientResponse = try await client.post(URI(string: url.absoluteString), headers: HTTPHeaders()) { clientRequest in
            if mediaType == .formData || mediaType == nil {
                #warning("THIS CODE FOR FAST FIX, BECAUSE https://github.com/vapor/multipart-kit/issues/63 not accepted yet")
                var rawMultipart: (body: NSMutableData, boundary: String)!
                do {
                    /// Content-Disposition: form-data; name="nested_object"
                    ///
                    /// { json string }
                    if let currentParams: Params = params {
                        rawMultipart = try currentParams.toMultiPartFormData(log: log)
                    } else {
                        rawMultipart = try TGEmptyParams().toMultiPartFormData(log: log)
                    }
                } catch {
                    log.critical("Post request error: \(error.logMessage)")
                }
                clientRequest.headers.add(name: "Content-Type", value: "multipart/form-data; boundary=\(rawMultipart.boundary)")
                let buffer = ByteBuffer.init(data: rawMultipart.body as Data)
                clientRequest.body = buffer
                /// Debug
                // TGBot.log.critical("url: \(url)\n\(String(decoding: rawMultipart.body, as: UTF8.self))")
            } else {
                let mediaType: Vapor.HTTPMediaType = if let mediaType {
                    .init(type: mediaType.type, subType: mediaType.subType, parameters: mediaType.parameters)
                } else {
                    .json
                }
                try clientRequest.content.encode(params ?? (TGEmptyParams() as! Params), as: mediaType)
            }
        }
        let telegramContainer: TGTelegramContainer = try clientResponse.content.decode(TGTelegramContainer<Response>.self)
        return try processContainer(telegramContainer)
    }
    
    @discardableResult
    public func post<Response: Decodable>(_ url: URL) async throws -> Response {
        try await post(url, params: TGEmptyParams(), as: nil)
    }
    
    @discardableResult
    public func post<Response: Decodable>(_ url: URL, as mediaType: HTTPMediaType) async throws -> Response {
        try await post(url, params: TGEmptyParams(), as: mediaType)
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















