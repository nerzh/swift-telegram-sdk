//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 23.05.2021.
//

import Foundation

public typealias TGHandlerCallbackAsync = (_ update: TGUpdate, _ bot: TGBotPrtcl) async throws -> Void
public typealias TGHandlerCallback = (_ update: TGUpdate, _ bot: TGBotPrtcl) throws -> Void

public protocol TGHandlerPrtcl {

    var id: Int { get set }
    var name: String { get }

    func check(update: TGUpdate) -> Bool
    func handle(update: TGUpdate, bot: TGBotPrtcl) throws
    func handle(update: TGUpdate, bot: TGBotPrtcl) async throws
}

extension TGHandlerPrtcl {
    public var name: String {
        return String(describing: Self.self)
    }
}
