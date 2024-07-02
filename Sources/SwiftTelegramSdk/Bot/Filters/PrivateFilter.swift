//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages sent in a private chat
public class PrivateFilter: TGFilter {

    public var name: String = "private"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.chat.type == .private
    }
}

public extension TGFilter {
    static var `private`: PrivateFilter { PrivateFilter() }
}
