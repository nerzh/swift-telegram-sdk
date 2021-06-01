//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that contain `Invoice`
public class InvoiceFilter: TGFilter {

    public var name: String = "invoice"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.invoice != nil
    }
}

public extension TGFilter {
    static var invoice = InvoiceFilter()
}
