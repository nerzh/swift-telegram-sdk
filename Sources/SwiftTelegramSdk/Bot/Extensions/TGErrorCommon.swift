//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 10.03.2023.
//

import Foundation

public protocol TGErrorCommon: ErrorCommonMessage {}

public protocol ErrorCommonMessage: LocalizedError, Error, Decodable {
    var title: String { get set }
    var reason: String { get set }
    
    init()
    init(_ reason: String)
    init(reason: String)
    init(_ error: Error)
    static func mess(_ reason: String) -> Self
}

public extension ErrorCommonMessage {
    var description: String { "[\(title)] \(reason)" }
    var errorDescription: String? { self.description }
    var failureReason: String? { self.description }
    var recoverySuggestion: String? { self.description }
    var helpAnchor: String? { self.description }
    var localizedDescription: String { self.description }
    
    static func mess(_ reason: String) -> Self {
        Self(reason)
    }
    
    init(_ reason: String) {
        self.init()
        self.reason = reason
    }
    
    init(reason: String) {
        self.init()
        self.reason = reason
    }
    
    init(_ error: Error) {
        self.init()
        self.reason = error.localizedDescription
    }
}

func makeError<T: ErrorCommonMessage>(_ error: T, _ funcName: String = #function, _ line: Int = #line) -> T {
    let message: String = "\(funcName) line: \(line), error: \(error.localizedDescription)"
    return T.mess(message)
}
