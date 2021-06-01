//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Filters messages to allow only those which contains text
public class TextFilter: TGFilter {

    public var name: String = "text"

    override
    public func filter(message: TGMessage) -> Bool {
        guard let text = message.text else { return false }
        return !text.isEmpty
    }
}

public extension TGFilter {
    static var text = TextFilter()
}
