//
//  InvoiceFilter.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 21.04.2018.
//

import Foundation

/// Messages that contain `Invoice`
public struct InvoiceFilter: Filter {

    public var name: String = "invoice"

    public func filter(message: TGMessage) -> Bool {
        return message.invoice != nil
    }
}

public extension Filters {
    static var invoice = Filters(filter: InvoiceFilter())
}
