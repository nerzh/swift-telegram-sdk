//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that are a reply to another message
public class ReplyFilter: TGFilter {

    public var name: String = "reply"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.replyToMessage != nil
    }
}

public extension TGFilter {
    static var reply: ReplyFilter { ReplyFilter() }
}
