//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages sent in a group chat
public class GroupFilter: TGFilter {

    public var name: String = "group"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.chat.type != .private
    }
}

public extension TGFilter {
    static var group: GroupFilter { GroupFilter() }
}
