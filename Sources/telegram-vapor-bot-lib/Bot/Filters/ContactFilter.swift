//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that contain `Contact`
public class ContactFilter: TGFilter {

    public var name: String = "contact"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.contact != nil
    }
}

public extension TGFilter {
    static var contact = ContactFilter()
}
