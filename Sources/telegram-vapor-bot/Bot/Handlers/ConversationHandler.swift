//
//  ConversationHandler.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 08.06.2018.
//

import Vapor
import NIO

public class TGConversationHandler: TGHandlerPrtcl {
    
    public var id: Int = 0
    public var name: String
    
    public struct Options: OptionSet {
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        ///Determines if a user can restart a conversation with an entry point.
        public static let allowReentry = Options(rawValue: 1)
        ///If the conversationkey should contain the Chat’s ID.
        public static let perChat = Options(rawValue: 2)
        ///If the conversationkey should contain the User’s ID.
        public static let perUser = Options(rawValue: 4)
        ///If the conversationkey should contain the Message’s ID.
        public static let perMessage = Options(rawValue: 8)
    }
    
    public var entryPoints: [TGHandlerPrtcl] = []
    public var states: [String: [TGHandlerPrtcl]] = [:]
    public var fallbacks: [TGHandlerPrtcl] = []
    public var timeoutBehavior: [TGHandlerPrtcl] = []
    
    let options: Options
    let conversationTimeout: TimeAmount?
    let callback: TGHandlerCallback
    
    public init(
        name: String = String(describing: TGConversationHandler.self),
        options: Options = [],
        conversationTimeout: TimeAmount? = nil,
        _ callback: @escaping TGHandlerCallback
    ) {
        self.name = name
        self.options = options
        self.conversationTimeout = conversationTimeout
        self.callback = callback
    }
    
    public func check(update: TGUpdate) -> Bool {
        return true
    }
    
    public func handle(update: TGUpdate, bot: TGBotPrtcl) {
        do {
            try callback(update, bot)
        } catch {
            TGBot.log.error(error.logMessage)
        }
    }
}
