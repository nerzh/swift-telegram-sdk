//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Logging

public protocol TGClientPrtcl {
    
    var log: Logger { get set }
    
    @discardableResult
    func post<Params: Encodable, Response: Decodable>(_ url: URL, params: Params?, as mediaType: HTTPMediaType?) async throws -> Response
    
    @discardableResult
    func post<Response: Decodable>(_ url: URL) async throws -> Response
}
