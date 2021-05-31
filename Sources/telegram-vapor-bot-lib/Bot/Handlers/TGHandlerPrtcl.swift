//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 23.05.2021.
//

import Foundation

public typealias TGHandlerCallback = (_ update: TGUpdate, _ bot: TGBotPrtcl) throws -> Void

public protocol TGHandlerPrtcl {

    var id: Int { get set }
    var name: String { get }

    func check(update: TGUpdate) -> Bool
    func handle(update: TGUpdate, bot: TGBotPrtcl)
}

extension TGHandlerPrtcl {
    public var name: String {
        return String(describing: Self.self)
    }
}
