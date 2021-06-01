//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Filters messages that contains a `SuccessfulPayment`.
public class SuccesfulPaymentFilter: TGFilter {

    public var name: String = "successful_payment"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.successfulPayment != nil
    }
}

public extension TGFilter {
    static var successfulPayment = SuccesfulPaymentFilter()
}
