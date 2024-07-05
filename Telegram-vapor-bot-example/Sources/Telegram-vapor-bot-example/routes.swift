//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: TelegramController())
}

