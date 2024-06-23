//
//  TGVaporBotPrtcl.swift
//  
//
//  Created by Yakov Shapovalov on 23.06.2024.
//

import TelegramBotKit
import Vapor

public protocol TGVaporBotPrtcl: TGBotPrtcl {

    var app: Vapor.Application { get }
    var tgURI: URI { get }

    func getMethodURL(_ methodName: String) -> String

}
