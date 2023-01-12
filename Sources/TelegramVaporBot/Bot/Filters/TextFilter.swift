//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Filters messages to allow only those which contains text
public class TextFilter: TGFilter {

    public var name: String = "text"
    private var value: String? = nil

    override
    public func filter(message: TGMessage) -> Bool {
        guard let text = message.text else { return false }
        if let value = value {
            return text == value
        }
        return !text.isEmpty
    }

    public func value(_ value: String) -> Self {
        self.value = value
        return self
    }
}

public extension TGFilter {
    static var text: TextFilter { TextFilter() }
}
