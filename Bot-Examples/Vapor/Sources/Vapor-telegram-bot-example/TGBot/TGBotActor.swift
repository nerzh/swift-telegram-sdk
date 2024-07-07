//
//  TGBotActor.swift
//  Vapor-telegram-bot-example
//
//  Created by Oleh Hudeichuk on 17.04.2023.
//

import SwiftTelegramSdk

actor TGBotActor {
    private var _bot: TGBot!

    var bot: TGBot {
        self._bot
    }
    
    func setBot(_ bot: TGBot) {
        self._bot = bot
    }
}
