//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation
import SwiftRegularExpression

public class TGRegexpHandler: TGHandlerPrtcl {
    
    public var id: Int = 0
    public var name: String
    
    let regexp: NSRegularExpression
    var callback: TGHandlerCallback? = nil
    var callbackAsync: TGHandlerCallbackAsync? = nil
    let filters: TGFilter
    
    public init(
        name: String = String(describing: TGRegexpHandler.self),
        regexp: NSRegularExpression,
        filters: TGFilter = .all,
        _ callback: @escaping TGHandlerCallback
    ) {
        self.name = name
        self.regexp = regexp
        self.filters = filters
        self.callback = callback
    }
    
    public init(
        name: String = String(describing: TGRegexpHandler.self),
        regexp: NSRegularExpression,
        filters: TGFilter = .all,
        _ callback: @escaping TGHandlerCallbackAsync
    ) {
        self.name = name
        self.regexp = regexp
        self.filters = filters
        self.callbackAsync = callback
    }
    
    public convenience init?(
        name: String = String(describing: TGRegexpHandler.self),
        pattern: String,
        filters: TGFilter = .all,
        _ callback: @escaping TGHandlerCallback
    ) {
        guard let regexp = try? NSRegularExpression(pattern: pattern, options: []) else {
            return nil
        }
        self.init(
            name: name,
            regexp: regexp,
            filters: filters,
            callback
        )
    }
    
    public convenience init?(
        name: String = String(describing: TGRegexpHandler.self),
        pattern: String,
        filters: TGFilter = .all,
        _ callback: @escaping TGHandlerCallbackAsync
    ) {
        guard let regexp = try? NSRegularExpression(pattern: pattern, options: []) else {
            return nil
        }
        self.init(
            name: name,
            regexp: regexp,
            filters: filters,
            callback
        )
    }
    
    public func check(update: TGUpdate) -> Bool {
        guard let text = update.message?.text else { return false }
        return text.regexp(regexp.pattern, regexp.options).keys.count > 0
    }
    
    public func handle(update: TGUpdate, bot: TGBotPrtcl) {
        do {
            try callback?(update, bot)
        } catch {
            TGBot.log.error(error.logMessage)
        }
    }
    
    public func handle(update: TGUpdate, bot: TGBotPrtcl) async throws {
        try await callbackAsync?(update, bot)
    }
}
