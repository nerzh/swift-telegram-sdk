//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation

public protocol TGDispatcherPrtcl {

    func add(_ handler: TGHandler) throws
    func process(_ updates: [TGUpdate]) throws
}

public final class TGDispatcher: TGDispatcherPrtcl {

    private var longPollingQueue: DispatchQueue = .init(label: "com.telegram-vapor-bot-lib.longpolling", qos: .default)

    public func add(_ handler: TGHandler) throws {

    }

    public func process(_ updates: [TGUpdate]) throws {

    }
}
