//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 17.04.2023.
//

import Foundation
import TelegramVaporBot

actor TGBotConnection {
    private var _connection: TGConnectionPrtcl!

    var connection: TGConnectionPrtcl {
        self._connection
    }
    
    func setConnection(_ conn: TGConnectionPrtcl) {
        self._connection = conn
    }
}
