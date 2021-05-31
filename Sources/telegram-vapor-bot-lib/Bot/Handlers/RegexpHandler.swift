//
//  RegexpHandler.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 11/06/2018.
//

import Foundation

public class TGRegexpHandler: TGHandlerPrtcl {

    public var id: Int = 0
    public var name: String

    let regexp: NSRegularExpression
    let callback: TGHandlerCallback
    let filters: Filters

    public init(
        name: String = String(describing: TGRegexpHandler.self),
        regexp: NSRegularExpression,
        filters: Filters = .all,
        callback: @escaping TGHandlerCallback
        ) {
        self.name = name
        self.regexp = regexp
        self.filters = filters
        self.callback = callback
    }

    public convenience init?(
        name: String = String(describing: TGRegexpHandler.self),
        pattern: String,
        filters: Filters = .all,
        callback: @escaping TGHandlerCallback
        ) {
        guard let regexp = try? NSRegularExpression(pattern: pattern, options: []) else {
            return nil
        }
        self.init(
            name: name,
            regexp: regexp,
            filters: filters,
            callback: callback
        )
    }

    public func check(update: TGUpdate) -> Bool {
        guard let text = update.message?.text else { return false }
        let range = NSRange(location: 0, length: text.count)
        return regexp.numberOfMatches(in: text, options: [], range: range) > 0
    }

    public func handle(update: TGUpdate, bot: TGBotPrtcl) {
        do {
            try callback(update, bot)
        } catch {
            log.error(error.logMessage)
        }
    }
}
