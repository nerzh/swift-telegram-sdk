//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation
import SwiftRegularExpression

/// Filters updates by searching for an occurence of pattern in the message text. The `NSRegularExpression` is used to determine whether an update should be filtered. Refer to the documentation of the `NSRegularExpression` for more information.
public class RegexpFilter: TGFilter {

    let pattern: String
    let options: NSRegularExpression.Options

    public init(pattern: String, options: NSRegularExpression.Options = []) {
        self.pattern = pattern
        self.options = options
        super.init()
    }

    public var name: String = "regexp"

    override
    public func filter(message: TGMessage) -> Bool {
        guard let text = message.text else { return false }
        return text.regexp(pattern, options).keys.count > 0
    }
}

public extension TGFilter {
    static func regexp(pattern: String, options: NSRegularExpression.Options = []) -> RegexpFilter {
        return RegexpFilter(pattern: pattern, options: options)
    }
}
