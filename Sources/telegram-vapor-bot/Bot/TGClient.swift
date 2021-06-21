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

public protocol TGClientPrtcl {

    @discardableResult
    func get<Params: Encodable, Response: Codable>(_ url: URI, params: Params?, as mediaType: Vapor.HTTPMediaType?) -> EventLoopFuture<Response>

    @discardableResult
    func get<Response: Codable>(_ url: URI) -> EventLoopFuture<Response>

    @discardableResult
    func get<Response: Codable>(_ url: URI, as mediaType: Vapor.HTTPMediaType) -> EventLoopFuture<Response>

    @discardableResult
    func post<Params: Encodable, Response: Codable>(_ url: URI, params: Params?, as mediaType: Vapor.HTTPMediaType?) -> EventLoopFuture<Response>

    @discardableResult
    func post<Response: Codable>(_ url: URI) -> EventLoopFuture<Response>

    @discardableResult
    func post<Response: Codable>(_ url: URI, as mediaType: Vapor.HTTPMediaType) -> EventLoopFuture<Response>
}

public final class DefaultTGClient: TGClientPrtcl {
    
    private let client: Vapor.Client

    public init(client: Vapor.Client) {
        self.client = client
    }

    @discardableResult
    public func get<Params: Encodable, Response: Codable>
    (
        _ url: URI,
        params: Params? = nil,
        as mediaType: Vapor.HTTPMediaType? = nil
    ) -> EventLoopFuture<Response> {
        #warning("THIS CODE FOR FAST FIX, BECAUSE https://github.com/vapor/multipart-kit/issues/63 not accepted yet")
        var rawMultipart: (body: NSMutableData, boundary: String)!
        do {
            /// Content-Disposition: form-data; name="nested_object"
            ///
            /// { json string }
            rawMultipart = try (params ?? (TGEmptyParams() as! Params)).toMultiPartFormData()
        } catch {
            TGBot.log.critical(error.logMessage)
        }
        var headers: HTTPHeaders = .init()
        if mediaType == .formData || mediaType == nil {
            headers.add(name: "Content-Type", value: "multipart/form-data; boundary=\(rawMultipart.boundary)")
        }
        return client.get(url, headers: HTTPHeaders()) { clientRequest in
            if mediaType == .formData || mediaType == nil {
                let buffer = ByteBuffer.init(data: rawMultipart.body as Data)
                clientRequest.body = buffer
//                TGBot.log.critical("\(String(decoding: rawMultipart.body, as: UTF8.self))")
            } else {
                try clientRequest.content.encode(params ?? (TGEmptyParams() as! Params), as: mediaType ?? .json)
            }
        }.flatMapThrowing { (clientResponse) throws -> TGTelegramContainer<Response> in
            try clientResponse.content.decode(TGTelegramContainer<Response>.self)
        }.flatMapThrowing { [self] telegramContainer in
            try processContainer(telegramContainer)
        }
    }

    @discardableResult
    public func get<Response: Codable>(_ url: URI) -> EventLoopFuture<Response> {
        self.get(url, params: TGEmptyParams(), as: nil)
    }

    @discardableResult
    public func get<Response: Codable>(_ url: URI, as mediaType: Vapor.HTTPMediaType) -> EventLoopFuture<Response> {
        self.get(url, params: TGEmptyParams(), as: mediaType)
    }

    @discardableResult
    public func post<Params: Encodable, Response: Codable>
    (
        _ url: URI,
        params: Params? = nil,
        as mediaType: Vapor.HTTPMediaType? = nil
    ) -> EventLoopFuture<Response> {
        #warning("THIS CODE FOR FAST FIX, BECAUSE https://github.com/vapor/multipart-kit/issues/63 not accepted yet")
        var rawMultipart: (body: NSMutableData, boundary: String)!
        do {
            /// Content-Disposition: form-data; name="nested_object"
            ///
            /// { json string }
            rawMultipart = try (params ?? (TGEmptyParams() as! Params)).toMultiPartFormData()
        } catch {
            TGBot.log.critical(error.logMessage)
        }
        var headers: HTTPHeaders = .init()
        if mediaType == .formData || mediaType == nil {
            headers.add(name: "Content-Type", value: "multipart/form-data; boundary=\(rawMultipart.boundary)")
        }
        return client.post(url, headers: headers) { clientRequest in
            if mediaType == .formData || mediaType == nil {
                let buffer = ByteBuffer.init(data: rawMultipart.body as Data)
                clientRequest.body = buffer
                /// Debug
                TGBot.log.critical("url: \(url)\n\(String(decoding: rawMultipart.body, as: UTF8.self))")
            } else {
                try clientRequest.content.encode(params ?? (TGEmptyParams() as! Params), as: mediaType ?? .json)
            }
        }.flatMapThrowing { (clientResponse) throws -> TGTelegramContainer<Response> in
            try clientResponse.content.decode(TGTelegramContainer<Response>.self)
        }.flatMapThrowing { [self] telegramContainer in
            try processContainer(telegramContainer)
        }
    }

    @discardableResult
    public func post<Response: Codable>(_ url: URI) -> EventLoopFuture<Response> {
        self.post(url, params: TGEmptyParams(), as: nil)
    }

    @discardableResult
    public func post<Response: Codable>(_ url: URI, as mediaType: Vapor.HTTPMediaType) -> EventLoopFuture<Response> {
        self.post(url, params: TGEmptyParams(), as: mediaType)
    }

    private func processContainer<T: Codable>(_ container: TGTelegramContainer<T>) throws -> T {
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
            TGBot.log.error(error.logMessage)
            throw error
        }

        guard let result = container.result else {
            let error = CoreError(
                type: .server,
                reason: "Response marked as `Ok`, but doesn't contain `result` field."
            )
            TGBot.log.error(error.logMessage)
            throw error
        }

        let logString = """

        Response:
        Code: \(container.errorCode ?? 0)
        Status OK: \(container.ok)
        Description: \(container.description ?? "Empty")

        """
        TGBot.log.info(logString.logMessage)
        return result
    }
}
