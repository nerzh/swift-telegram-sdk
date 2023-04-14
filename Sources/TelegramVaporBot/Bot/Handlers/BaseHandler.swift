//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 13.04.2023.
//

import Foundation

public class TGBaseHandler: TGHandlerPrtcl {
    
    public var id: Int = 0
    public var name: String
    var callbackAsync: TGHandlerCallbackAsync
    
    public init(
        name: String = String(describing: TGBaseHandler.self),
        _ callback: @escaping TGHandlerCallbackAsync
    ) {
        self.name = name
        self.callbackAsync = callback
    }
    
    public func check(update: TGUpdate) -> Bool {
        true
    }
    
    public func handle(update: TGUpdate, bot: TGBot) async throws {
        try await callbackAsync(update, bot)
    }
}
