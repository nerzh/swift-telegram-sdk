//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import AsyncHTTPClient

/// Handler for bot messages, can handle normal messages, channel posts, edited messages
public class TGMessageHandler: TGHandlerPrtcl {
    
    public var id: Int = 0
    /// Name of particular MessageHandler, needed for determine handlers instances of one class in groups
    public var name: String
    
    /// Option Set for `MessageHandler`
    public struct Options: OptionSet {
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        ///Should “normal” message updates be handled?
        public static let messageUpdates = Options(rawValue: 1)
        ///Should channel posts updates be handled?
        public static let channelPostUpdates = Options(rawValue: 2)
        ///Should “edited” message updates be handled?
        public static let editedUpdates = Options(rawValue: 4)
    }
    
    let filters: TGFilter
    let callback: TGHandlerCallback
    let options: Options
    
    public init(
        name: String = String(describing: TGMessageHandler.self),
        filters: TGFilter = .all,
        options: Options = [.messageUpdates, .channelPostUpdates],
        callback: @escaping TGHandlerCallback
    ) {
        self.filters = filters
        self.callback = callback
        self.options = options
        self.name = name
    }
    
    public func check(update: TGUpdate) -> Bool {
        if options.contains(.channelPostUpdates) {
            if update.channelPost != nil {
                return true
            }
            if options.contains(.editedUpdates),
               update.editedChannelPost != nil ||
                update.editedMessage != nil {
                return true
            }
        }
        
        if options.contains(.messageUpdates),
           let message = update.message,
           filters.check(message) {
            return true
        }
        
        return false
    }
    
    public func handle(update: TGUpdate, bot: TGBotPrtcl) {
        do {
            try callback(update, bot)
        } catch {
            TGBot.log.error(error.logMessage)
        }
    }
}
