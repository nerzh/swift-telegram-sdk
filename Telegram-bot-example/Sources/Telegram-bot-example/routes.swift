//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Vapor
import TelegramVaporBot


func routes(_ app: Application) throws {
    try app.register(collection: TelegramController())
}

