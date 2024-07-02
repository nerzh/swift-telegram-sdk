//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation

public protocol TGClientPrtcl {
    
    @discardableResult
    func get<Params: Encodable, Response: Decodable>(_ url: URL, params: Params?, as mediaType: HTTPMediaType?) async throws -> Response
    
    @discardableResult
    func get<Response: Decodable>(_ url: URL) async throws -> Response
    
    @discardableResult
    func post<Params: Encodable, Response: Decodable>(_ url: URL, params: Params?, as mediaType: HTTPMediaType?) async throws -> Response
    
    @discardableResult
    func post<Response: Decodable>(_ url: URL) async throws -> Response
    
    @discardableResult
    func post<Response: Decodable>(_ url: URL, as mediaType: HTTPMediaType) async throws -> Response
}
