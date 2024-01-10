//
//  File.swift
//  
//
//  Created by Hadi Sharghi on 2024-01-10.
//

import Foundation

/**
 This extension adds common properties betwwen TGMessage and TGInaccessibleMessage (chat, messageId and date) to TGMaybeInaccessibleMessage. These properties are always accessible no mather TGInaccessibleMessage is TGMessage or TGInaccessibleMessage.
 
 SeeAlso Telegram Bot API Reference:
 [MaybeInaccessibleMessage](https://core.telegram.org/bots/api#maybeinaccessiblemessage)
 **/

public extension TGMaybeInaccessibleMessage {
    var chat: TGChat {
        switch self {
        case .inaccessibleMessage(let msg):
            return msg.chat
        case .message(let msg):
            return msg.chat
        }
    }
    
    var messageId: Int {
        switch self {
        case .inaccessibleMessage(let msg):
            return msg.messageId
        case .message(let msg):
            return msg.messageId
        }
    }
    
    var date: Int {
        switch self {
        case .inaccessibleMessage(let msg):
            return msg.date
        case .message(let msg):
            return msg.date
        }
    }
}
