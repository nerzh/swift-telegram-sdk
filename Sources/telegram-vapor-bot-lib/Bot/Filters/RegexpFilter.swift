//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

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
        guard let regexp = try? NSRegularExpression(pattern: pattern, options: options) else { return false }
        let range = NSRange(location: 0, length: text.count)
        return regexp.numberOfMatches(in: text, options: [], range: range) > 0
    }
}

public extension TGFilter {
    static func regexp(pattern: String, options: NSRegularExpression.Options = []) -> TGFilter {
        return RegexpFilter(pattern: pattern, options: options)
    }
}
