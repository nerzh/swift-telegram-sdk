//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that are forwarded.
public class ForwarderFilter: TGFilter {

    public var name: String = "forwarded"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.forwardDate != nil ||
        message.forwardFrom != nil ||
        message.forwardFromChat != nil ||
        message.forwardSignature != nil ||
        message.forwardFromMessageId != nil
    }
}

public extension TGFilter {
    static var forwarded = ForwarderFilter()
}
