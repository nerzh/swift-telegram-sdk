//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 17.04.2023.
//

import Foundation
import TelegramVaporBot

actor TGBotActor {
    private var _bot: TGBotPrtcl!

    var bot: TGBotPrtcl {
        self._bot
    }
    
    func setBot(_ bot: TGBotPrtcl) {
        self._bot = bot
    }
}
